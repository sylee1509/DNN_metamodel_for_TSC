from __future__ import absolute_import
from __future__ import print_function

import os
import sys
import re
import optparse
import random
import time
import pandas as pd
import numpy as np
from scipy import stats
import math
import traci
import csv
import multiprocessing
from collections import defaultdict


# we need to import python modules from the $SUMO_HOME/tools directory
if 'SUMO_HOME' in os.environ:
    tools = os.path.join(os.environ['SUMO_HOME'], 'tools')
    sys.path.append(tools)
else:
    sys.exit("please declare environment variable 'SUMO_HOME'")

from sumolib import checkBinary
from sumolib import output
from sumolib import net


cur_location = os.path.dirname(os.path.realpath(__file__)) + "\\"


def RUN_SUMO(run_type, param, warmup, runtime, replication, scenarioNum, trafficIndex, solution, target):
    run_sumo = {
        "default": Calculate_measure,
        "multi": Calculate_measure_multi,
        "traci": use_traci_test
    }

    return run_sumo[run_type](param, warmup, runtime, replication, scenarioNum, trafficIndex, solution, target)


def Calculate_measure(param, warmup, replication, scenarioNum, trafficIndex, solution, target):
    # return average delay and average stop count value when the traffic index and the cycletime are given
    avgDelay = [0.0 for s in range(replication)]
    avgStopCount = [0.0 for s in range(replication)]
    avgTravelTime = [0.0 for s in range(replication)]
    avgTimeLoss = [0.0 for _ in range(replication)]

    avg_veh_arrived = 0
    avg_veh_count = 0
    speed = 0

    for seed in range(replication):
        os.chdir(cur_location)

        # add parameters related to route files considering replication
        # if replication is 3, 'routes_0.rou.xml', 'routes_1.rou.xml', and 'routes_2.rou.xml' parameters are added 
        if '--route-files' not in param:
            param.append('--route-files')
        s = (seed-1+replication) % replication
        route_file = f'route/{target}_{scenarioNum}_{s}.rou.xml'
        if route_file in param:
            param.remove(route_file)

        if scenarioNum != 'nonstationary':
            route_file = f'route/{target}_{scenarioNum-1}_{replication-1}.rou.xml'
            if route_file in param:
                param.remove(route_file)

        param.append(f'route/{target}_{scenarioNum}_{seed}.rou.xml')

        stoptime = float(param[param.index("-e") + 1])

        command_str = ""
        for item in param:
            command_str += item
            command_str += " "

        tripinfo_file = f"tripinfo/tripinfo_{target}_{scenarioNum}_{trafficIndex}_{seed}.xml "

        command_str = command_str + "--tripinfo-output " + tripinfo_file
        # print(command_str)
        os.system(command_str) # run command line (run sumo program) -> make 'tripinfo.xml' file

        # tl = "new_"+str(ti)

        total = 0.
        stop_count = 0
        veh_count = 0
        veh_throughput_count = 0
        travel_time = 0.
        time_loss = 0.
        speed_temp = list()

        for tripinfo in output.parse(tripinfo_file, ['tripinfo']):

            if warmup <= float(tripinfo.arrival) or -1 == float(tripinfo.arrival):
                stop_count += int(tripinfo.waitingCount)
                travel_time += float(tripinfo.duration) + float(tripinfo.departDelay)
                veh_count += 1

            if warmup <= float(tripinfo.depart) and warmup <= float(tripinfo.arrival):
                veh_throughput_count += 1
                total += float(tripinfo.waitingTime) + float(tripinfo.departDelay)
                time_loss += float(tripinfo.timeLoss)
                speed_temp.append(float(tripinfo.routeLength) / (float(tripinfo.duration) + float(tripinfo.departDelay)))

        print(np.quantile(speed_temp, 0.05))
        print(np.mean(np.quantile(speed_temp, 0.05)))
        speed += np.mean(np.quantile(speed_temp, 0.05))

        avgDelay[seed] = (total / veh_throughput_count)
        avgStopCount[seed] = (stop_count / veh_count)
        avgTravelTime[seed] = (travel_time / veh_count)
        avgTimeLoss[seed] = (time_loss / veh_throughput_count)

        avg_veh_arrived += veh_throughput_count
        avg_veh_count += veh_count

        # print(avg_veh_arrived)
        # print(avg_veh_count)

    avgDelayData = sum(avgDelay) / replication
    avgStopCountData = sum(avgStopCount) / replication
    avgTravelData = sum(avgTravelTime) / replication
    avgTimeLossData = sum(avgTimeLoss) / replication

    speed /= replication
    avg_veh_arrived /= replication
    avg_veh_count /= replication
    # print("Traffic light : " + tl)
    # print('Elapsed time : ', time.time() - start)
    # print(avgDelay, avgStopCount)
    # print(speed)

    with open(f"output/result_{target}.csv", mode="a", newline="") as f:
        writer = csv.writer(f)
        row = [scenarioNum, trafficIndex]

        for junction in solution.junction_list:
            row.extend(np.pad(junction.split, (0, 6 - junction.phasenum)))
            row.append(junction.offset)

        row.extend(avgDelay)
        row.extend(avgStopCount)
        row.extend(avgTravelTime)
        row.extend(avgTimeLoss)
        row.extend([avg_veh_arrived, avg_veh_count])

        writer.writerow(row)

    return avgDelay, avgStopCount, avgTravelTime, avgTimeLoss, avg_veh_arrived, avg_veh_count


def Calculate_measure_multi(param, warmup, runtime, replication, scenarioNum, phaseSeq, solution, target):
    # return average delay and average stop count value when the traffic index and the cycletime are given
    avgDelay = [0.0 for _ in range(replication)]
    avgTravelTime = [0.0 for _ in range(replication)]
    avgStopCount = [0.0 for _ in range(replication)]
    avgTimeLoss = [0.0 for _ in range(replication)]
    avgSpeed = [0.0 for _ in range(replication)]
    throughput = [0 for _ in range(replication)]
    to_be_throughput = [0 for _ in range(replication)]

    start = time.time()

    processes = []

    for seed in range(replication):
        os.chdir(cur_location)

        command_str = ""
        for item in param:
            command_str += item
            command_str += " "

        route_file = f'route/{target}_{scenarioNum}_{seed}.rou.xml'
        tripinfo_file = f"tripinfo/tripinfo_{target}_{phaseSeq}_{seed}.xml "

        command_str += f"-r {route_file} "
        command_str += f"--tripinfo-output {tripinfo_file} "

        # print(command_str)
        p = multiprocessing.Process(target=os.system, args=(command_str, ))
        p.start()
        processes.append(p)
        # os.system(command_str) # run command line (run sumo program) -> make 'tripinfo.xml' file

    for p in processes:
        p.join()

    for seed in range(replication):
        # tl = "new_"+str(ti)
        wait_time = 0.
        travel_time = 0.
        stop_count = 0
        time_loss = 0.
        avg_speed = 0.

        veh_count = 0
        to_be_throughput_count = 0

        tripinfo_file = f"tripinfo/tripinfo_{target}_{phaseSeq}_{seed}.xml "

        for tripinfo in output.parse(tripinfo_file, ['tripinfo']):
            if float(tripinfo.arrival) == -1:
                to_be_throughput_count += 1

            if warmup <= float(tripinfo.arrival) <= runtime:

                wait_time += float(tripinfo.waitingTime) + float(tripinfo.departDelay)
                travel_time += float(tripinfo.duration) + float(tripinfo.departDelay)
                stop_count += int(tripinfo.waitingCount)
                time_loss += float(tripinfo.timeLoss)
                avg_speed += float(tripinfo.routeLength) / float(tripinfo.duration)

                veh_count += 1
                to_be_throughput_count += 1

        avgDelay[seed] = (wait_time / veh_count)
        avgTravelTime[seed] = (travel_time / veh_count)
        avgStopCount[seed] = (stop_count / veh_count)
        avgTimeLoss[seed] = (time_loss / veh_count)
        avgSpeed[seed] = (avg_speed / veh_count)
        throughput[seed] = veh_count
        to_be_throughput[seed] = to_be_throughput_count

    results = dict()
    results['wait'] = avgDelay
    results['travel'] = avgTravelTime
    results['stop'] = avgStopCount
    results['timeloss'] = avgTimeLoss
    results['speed'] = avgSpeed
    results['time'] = time.time() - start
    results['throughput'] = throughput
    results['to_be_throughput'] = to_be_throughput

    return results


def Calculate_CI(param, warmup, replication, target):
    # return average delay and average stop count value when the traffic index and the cycletime are given
    avgDelay = [0.0 for s in range(replication)]
    avgStopCount = [0.0 for s in range(replication)]

    for seed in range(replication):
        os.chdir(cur_location)

        # add parameters related to route files considering replication
        # if replication is 3, 'routes_0.rou.xml', 'routes_1.rou.xml', and 'routes_2.rou.xml' parameters are added
        if '--route-files' not in param:
            param.append('--route-files')
        s = (seed - 1 + replication) % replication
        route_file = f'route/{target}_' + str(s) + '.rou.xml'
        if route_file in param:
            param.remove(route_file)
        param.append(f'route/{target}_' + str(seed) + '.rou.xml')

        command_str = ""
        for item in param:
            command_str += item
            command_str += " "

        os.system(command_str)  # run command line (run sumo program) -> make 'tripinfo.xml' file

        total = 0.
        stop_count = 0
        veh_count = 0
        for tripinfo in output.parse('tripinfo.xml', ['tripinfo']):
            if float(tripinfo.depart) >= warmup:
                total += float(tripinfo.waitingTime)
                stop_count += int(tripinfo.waitingCount)
                veh_count += 1

        avgDelay[seed] = (total / veh_count)
        avgStopCount[seed] = (stop_count / veh_count)

    avgDelayData = sum(avgDelay) / replication
    avgStopCountData = sum(avgStopCount) / replication
    stdDelayData = math.sqrt(sum(pow(avgDelay[seed] - avgDelayData, 2) for seed in range(replication)) / replication)
    stdStopCountData = math.sqrt(
        sum(pow(avgStopCount[seed] - avgStopCountData, 2) for seed in range(replication)) / replication)
    t_value = stats.t.ppf(1 - 0.10, replication - 1)
    CI_d = (round(avgDelayData - t_value * stdDelayData, 3), round(avgDelayData + t_value * stdDelayData, 3))
    CI_sc = (
    round(avgStopCountData - t_value * stdStopCountData, 3), round(avgStopCountData + t_value * stdStopCountData, 3))

    return CI_d, CI_sc


def use_traci(param, warmup, replication, scenarioNum, trafficIndex, solution, target, intervals):
    traci.start(param)

    """execute the TraCI control loop"""

    step = 0
    # we start with given traffic index
    traci.trafficlight.setProgram("0", programID="new_" + str(trafficIndex))
    interval_idx = 0

    # store accumulated waiting time for each vehicle
    while traci.simulation.getMinExpectedNumber() > 0:
        traci.simulationStep()
        step += 1

    traci.close()

    # return average delay and average stop count value when the traffic index and the cycletime are given
    avgDelay = [0.0 for s in range(replication)]
    avgStopCount = [0.0 for s in range(replication)]
    avgTravelTime = [0.0 for s in range(replication)]

    avg_veh_arrived = 0
    avg_veh_count = 0
    speed = 0

    for seed in range(replication):
        os.chdir(cur_location)

        # add parameters related to route files considering replication
        # if replication is 3, 'routes_0.rou.xml', 'routes_1.rou.xml', and 'routes_2.rou.xml' parameters are added
        if '--route-files' not in param:
            param.append('--route-files')
        s = (seed-1+replication) % replication
        route_file = f'route/{target}_{scenarioNum}_{s}.rou.xml'
        if route_file in param:
            param.remove(route_file)
        route_file = f'route/{target}_{scenarioNum-1}_{replication-1}.rou.xml'
        if route_file in param:
            param.remove(route_file)
        param.append(f'route/{target}_{scenarioNum}_{seed}.rou.xml')

        stoptime = float(param[param.index("-e") + 1])

        command_str = ""
        for item in param:
            command_str += item
            command_str += " "

        tripinfo_file = f"tripinfo/tripinfo_{target}_{scenarioNum}_{trafficIndex}_{seed}.xml "

        command_str = command_str + "--tripinfo-output " + tripinfo_file

        os.system(command_str) # run command line (run sumo program) -> make 'tripinfo.xml' file

        # tl = "new_"+str(ti)

        total = 0.
        stop_count = 0
        veh_count = 0
        veh_throughput_count = 0
        travel_time = 0.
        speed_temp = list()

        for tripinfo in output.parse(tripinfo_file, ['tripinfo']):

            if warmup <= float(tripinfo.arrival) or -1 == float(tripinfo.arrival):
                total += float(tripinfo.waitingTime)
                stop_count += int(tripinfo.waitingCount)
                travel_time += float(tripinfo.duration) + float(tripinfo.departDelay)
                veh_count += 1

            if warmup <= float(tripinfo.depart) and warmup <= float(tripinfo.arrival):
                veh_throughput_count += 1
                speed_temp.append(float(tripinfo.routeLength) / (float(tripinfo.duration) + float(tripinfo.departDelay)))

        print(np.quantile(speed_temp, 0.05))
        print(np.mean(np.quantile(speed_temp, 0.05)))
        speed += np.mean(np.quantile(speed_temp, 0.05))

        avgDelay[seed] = (total / veh_count)
        avgStopCount[seed] = (stop_count / veh_count)
        avgTravelTime[seed] = (travel_time / veh_count)

        avg_veh_arrived += veh_throughput_count
        avg_veh_count += veh_count

        # print(avg_veh_arrived)
        # print(avg_veh_count)

    avgDelayData = sum(avgDelay) / replication
    avgStopCountData = sum(avgStopCount) / replication
    avgTravelData = sum(avgTravelTime) / replication


    speed /= replication
    avg_veh_arrived /= replication
    avg_veh_count /= replication
    # print("Traffic light : " + tl)
    # print('Elapsed time : ', time.time() - start)
    # print(avgDelay, avgStopCount)
    print(speed)

    with open(f"output/result_{target}.csv", mode="a", newline="") as f:
        writer = csv.writer(f)
        row = [scenarioNum, trafficIndex]

        for junction in solution.junction_list:
            row.extend(np.pad(junction.split, (0, 6 - junction.phasenum)))
            row.append(junction.offset)

        row.extend(avgDelay)
        row.extend(avgStopCount)
        row.extend(avgTravelTime)
        row.extend([avg_veh_arrived, avg_veh_count])

        writer.writerow(row)

    return avgDelay, avgStopCount, avgTravelTime, avg_veh_arrived, avg_veh_count

def use_traci_test(param, warmup, replication, scenarioNum, trafficIndex, solution, target):
    param.append('-r')
    param.append('route/RC_tls_7_0.rou.xml')
    print(param)
    traci.start(param)

    """execute the TraCI control loop"""

    step = 0
    # we start with given traffic index
    # traci.trafficlight.setProgram("new_0", programID="RC")
    interval_idx = 0

    print(traci.simulation.getMinExpectedNumber())
    # store accumulated waiting time for each vehicle
    temp = []
    while traci.simulation.getMinExpectedNumber() > 0:
        traci.simulationStep()

        if step == 246:
            for laneID in ['E2_in_0', 'E2_in_1', 'E2_in_3']:
                for vehID in traci.lane.getLastStepVehicleIDs(laneID):
                    traci.vehicle.setSpeedMode(vehID, 0)
                    traci.vehicle.setSpeed(vehID, 12)
                    temp.append(vehID)
        # elif step == 247:
        #     for laneID in ['E2_in_0', 'E2_in_1', 'E2_in_3']:
        #         for vehID in traci.lane.getLastStepVehicleIDs(laneID) or temp:
        #             traci.vehicle.setSpeedMode(vehID, 0)
        #             traci.vehicle.setSpeed(vehID, 4)
        # elif step == 248:
        #     for laneID in ['E2_in_0', 'E2_in_1', 'E2_in_3']:
        #         for vehID in traci.lane.getLastStepVehicleIDs(laneID) or temp:
        #             traci.vehicle.setSpeedMode(vehID, 0)
        #             traci.vehicle.setSpeed(vehID, 8)
        elif 286 > step >= 249:
            for laneID in ['E2_in_0', 'E2_in_1', 'E2_in_3']:
                for vehID in traci.lane.getLastStepVehicleIDs(laneID) or temp:
                    traci.vehicle.setSpeedMode(vehID, 0)
                    traci.vehicle.setSpeed(vehID, 12)
        elif step >= 286:
            for laneID in ['E2_in_0', 'E2_in_1', 'E2_in_3']:
                for vehID in traci.lane.getLastStepVehicleIDs(laneID) or temp:
                    traci.vehicle.setSpeedMode(vehID, 31)

        step += 1

    traci.close()

    # return average delay and average stop count value when the traffic index and the cycletime are given
    avgDelay = [0.0 for s in range(replication)]
    avgStopCount = [0.0 for s in range(replication)]
    avgTravelTime = [0.0 for s in range(replication)]

    avg_veh_arrived = 0
    avg_veh_count = 0
    speed = 0

    for seed in range(replication):
        os.chdir(cur_location)

        # add parameters related to route files considering replication
        # if replication is 3, 'routes_0.rou.xml', 'routes_1.rou.xml', and 'routes_2.rou.xml' parameters are added
        if '--route-files' not in param:
            param.append('--route-files')
        s = (seed-1+replication) % replication
        route_file = f'route/{target}_{scenarioNum}_{s}.rou.xml'
        if route_file in param:
            param.remove(route_file)
        route_file = f'route/{target}_{scenarioNum-1}_{replication-1}.rou.xml'
        if route_file in param:
            param.remove(route_file)
        param.append(f'route/{target}_{scenarioNum}_{seed}.rou.xml')

        stoptime = float(param[param.index("-e") + 1])

        command_str = ""
        for item in param:
            command_str += item
            command_str += " "

        tripinfo_file = f"tripinfo/tripinfo_{target}_{scenarioNum}_{trafficIndex}_{seed}.xml "

        command_str = command_str + "--tripinfo-output " + tripinfo_file

        os.system(command_str) # run command line (run sumo program) -> make 'tripinfo.xml' file

        # tl = "new_"+str(ti)

        total = 0.
        stop_count = 0
        veh_count = 0
        veh_throughput_count = 0
        travel_time = 0.
        speed_temp = list()

        for tripinfo in output.parse(tripinfo_file, ['tripinfo']):

            if warmup <= float(tripinfo.arrival) or -1 == float(tripinfo.arrival):
                total += float(tripinfo.waitingTime)
                stop_count += int(tripinfo.waitingCount)
                travel_time += float(tripinfo.duration) + float(tripinfo.departDelay)
                veh_count += 1

            if warmup <= float(tripinfo.depart) and warmup <= float(tripinfo.arrival):
                veh_throughput_count += 1
                speed_temp.append(float(tripinfo.routeLength) / (float(tripinfo.duration) + float(tripinfo.departDelay)))

        print(np.quantile(speed_temp, 0.05))
        print(np.mean(np.quantile(speed_temp, 0.05)))
        speed += np.mean(np.quantile(speed_temp, 0.05))

        avgDelay[seed] = (total / veh_count)
        avgStopCount[seed] = (stop_count / veh_count)
        avgTravelTime[seed] = (travel_time / veh_count)

        avg_veh_arrived += veh_throughput_count
        avg_veh_count += veh_count

        # print(avg_veh_arrived)
        # print(avg_veh_count)

    avgDelayData = sum(avgDelay) / replication
    avgStopCountData = sum(avgStopCount) / replication
    avgTravelData = sum(avgTravelTime) / replication


    speed /= replication
    avg_veh_arrived /= replication
    avg_veh_count /= replication
    # print("Traffic light : " + tl)
    # print('Elapsed time : ', time.time() - start)
    # print(avgDelay, avgStopCount)
    print(speed)

    with open(f"output/result_{target}.csv", mode="a", newline="") as f:
        writer = csv.writer(f)
        row = [scenarioNum, trafficIndex]

        for junction in solution.junction_list:
            row.extend(np.pad(junction.split, (0, 6 - junction.phasenum)))
            row.append(junction.offset)

        row.extend(avgDelay)
        row.extend(avgStopCount)
        row.extend(avgTravelTime)
        row.extend([avg_veh_arrived, avg_veh_count])

        writer.writerow(row)

    return avgDelay, avgStopCount, avgTravelTime, avg_veh_arrived, avg_veh_count



def get_lp_function(param, stoptime, replication, scenarioNum, trafficIndex, phasenum, queue_time,
                    min_length, max_length, yellow_length, target):
    lookup_table = pd.DataFrame(columns=['time', 'replication', *[f'x{i}' for i in range(phasenum)]])
    lookup_table_waiting = pd.DataFrame(columns=['time', 'replication', *[f'x{i}' for i in range(phasenum)]])

    print('queue time:', queue_time)

    if target == 'J1':
        e2detector = [[f'e2MultilaneDetector_{i}' for i in [0,1,2,3,8,9,10,11]],
                      [f'e2MultilaneDetector_{i}' for i in [6,7,8,9,10,11]],
                      [f'e2MultilaneDetector_{i}' for i in [4,5,6,7]],
                      [f'e2MultilaneDetector_{i}' for i in [12,13,14,15,16,17,18,19,20,21,22,23]]]
    elif target == 'J2':
        e2detector = []
    elif target == 'J3':
        e2detector = []
    elif target == 'J4':
        e2detector = []
    elif target == 'J5':
        e2detector = []

    e2detector = []

    for seed in range(replication):

        if '--route-files' not in param:
            param.append('--route-files')
        s = (seed-1+replication) % replication
        route_file = f'route/{target}_{scenarioNum}_{s}.rou.xml'
        if route_file in param:
            param.remove(route_file)

        if scenarioNum != 'nonstationary':
            route_file = f'route/{target}_{scenarioNum-1}_{replication-1}.rou.xml'
            if route_file in param:
                param.remove(route_file)

        param.append(f'route/{target}_{scenarioNum}_{seed}.rou.xml')

        # param.append('-a')
        # param.append(f'additional/e2detector_{target}.xml')

        traci.start(param)

        """execute the TraCI control loop"""
        step = 0
        t = 0
        current_phase = -2
        prev_phase = -2

        in_junction = [set() for _ in range(phasenum)]
        in_junction_count = [dict() for _ in range(phasenum)]
        e2_waiting = [dict() for _ in range(phasenum)]
        cycle = [dict() for _ in range(phasenum)]

        for p in range(phasenum):
            for j in range(max_length[p]):
                in_junction_count[p][j] = 0
                e2_waiting[p][j] = 0.
                cycle[p][j] = 0

        # we start with given traffic index
        # traci.trafficlight.setProgram(f"{target}", programID="new_" + str(trafficIndex))
        traci.trafficlight.setProgram(f"{target}", programID=str(trafficIndex))

        for tls_id in traci.trafficlight.getIDList():
            # print(traci.trafficlight.getProgram(tls_id)) # get name of program - new_0
            # print(traci.trafficlight.getPhase(tls_id)) # get index of phase - 0 1 2 3 ...
            # print(traci.trafficlight.getPhaseDuration(tls_id)) # get total length of phase duration - 74 6 57 46
            original_program = traci.trafficlight.getProgram(tls_id)
            tls = tls_id

        internal_lanes = list()
        for l in traci.lane.getIDList():
            if f":{target}_" in l:

                if traci.lane.getLinks(l)[0][6] != 'r':
                    internal_lanes.append(l)
                else:
                    # if target == 'J5':
                    #     internal_lanes.append(l)
                    internal_lanes.append(l)

                    print(l)
                    print(traci.lane.getLinks(l))

        print(internal_lanes)

        # store accumulated waiting time for each vehicle
        while traci.simulation.getMinExpectedNumber() > 0:
            if step == 0 or queue == queue_time[int(current_phase / 2)] + max_length[int(current_phase / 2)]:
                queue = 0
                current_phase = (current_phase + 2) % (phasenum * 2)

                if target == 'J2':
                    if current_phase == 8:
                        prev_phase = (current_phase + 2) % (phasenum * 2)
                    else:
                        prev_phase = (current_phase - 2) % (phasenum * 2)
                else:
                    if current_phase == 0:
                        prev_phase = (current_phase + 2) % (phasenum * 2)
                    else:
                        prev_phase = (current_phase - 2) % (phasenum * 2)

                original_state = traci.trafficlight.getRedYellowGreenState(tls)

                red_state = 'r' * len(original_state)

                traci.trafficlight.setRedYellowGreenState(tls, red_state)    # all red state
                traci.trafficlight.setPhaseDuration(tls, queue_time[int(current_phase / 2)])

                for veh_id in traci.vehicle.getIDList():
                    if random.uniform(0, 1) < 0.8:
                        traci.vehicle.remove(veh_id)

                if queue_time[int(current_phase / 2)] - min_length[int(prev_phase / 2)] - yellow_length[int(prev_phase / 2)] < 0:
                    traci.trafficlight.setProgram(tls, original_program)
                    traci.trafficlight.setPhase(tls, prev_phase)  # restore state
                    traci.trafficlight.setPhaseDuration(tls, min_length[int(prev_phase / 2)])

            elif queue == queue_time[int(current_phase / 2)] - min_length[int(prev_phase / 2)] - yellow_length[int(prev_phase / 2)]:
                traci.trafficlight.setProgram(tls, original_program)
                traci.trafficlight.setPhase(tls, prev_phase)  # restore state
                traci.trafficlight.setPhaseDuration(tls, min_length[int(prev_phase / 2)])

            elif queue == queue_time[int(current_phase / 2)] - yellow_length[int(prev_phase / 2)]:
                traci.trafficlight.setProgram(tls, original_program)
                traci.trafficlight.setPhase(tls, prev_phase + 1)  # restore state
                traci.trafficlight.setPhaseDuration(tls, yellow_length[int(prev_phase / 2)])

            elif queue == queue_time[int(current_phase / 2)]:
                traci.trafficlight.setProgram(tls, original_program)
                traci.trafficlight.setPhase(tls, current_phase)   # restore state
                traci.trafficlight.setPhaseDuration(tls, max_length[int(current_phase / 2)])

                t = 0
                in_junction[int(current_phase / 2)] = set()

            traci.simulationStep()
            step += 1

            if queue >= queue_time[int(current_phase / 2)]:
                for lane_id in internal_lanes:
                    for veh_id in traci.lane.getLastStepVehicleIDs(lane_id):
                        in_junction[int(current_phase / 2)].add(veh_id)

                in_junction_count[int(current_phase / 2)][t] += len(in_junction[int(current_phase / 2)])

                e2_veh = list()
                if len(e2detector) != 0:
                    for detID in e2detector[int(current_phase / 2)]:
                        e2_veh.extend(traci.lanearea.getLastStepVehicleIDs(detID))

                temp = 0
                for veh_id in e2_veh:
                    temp += traci.vehicle.getAccumulatedWaitingTime(veh_id)

                if len(e2_veh) == 0:
                    e2_waiting[int(current_phase / 2)][t] += 0
                else:
                    e2_waiting[int(current_phase / 2)][t] += temp / len(e2_veh)
                cycle[int(current_phase / 2)][t] += 1

                t += 1

            queue += 1

            if step % 1000 == 0:
                print(f'current step: {step} / {stoptime}')

        traci.close()

        for p in range(phasenum):
            for t in range(max_length[p]):
                in_junction_count[p][t] /= cycle[p][t]
                e2_waiting[p][t] /= cycle[p][t]

        print(cycle)
        print(in_junction_count)
        print(e2_waiting)

        for t in range(max(max_length)):
            temp = list()
            temp_wait = list()
            for p in range(phasenum):
                if t < max_length[p]:
                    temp.append(in_junction_count[p][t])
                    temp_wait.append(e2_waiting[p][t])
                else:
                    temp.append(0)
                    temp_wait.append(0)

            lookup_table.loc[len(lookup_table)] = [t, seed, *temp]
            lookup_table_waiting.loc[len(lookup_table_waiting)] = [t, seed, *temp_wait]

    print(lookup_table)
    print(lookup_table_waiting)

    return lookup_table, lookup_table_waiting


def read_route(routefile, warmup, stoptime):
    vehicle_count = 0

    for vehicle in output.parse(routefile, ['vehicle']):
        if warmup <= float(vehicle.depart) <= stoptime:
            vehicle_count += 1

    return vehicle_count


def read_route_OD(routefile, warmup, stoptime, od_res, road_num, target):
    for vehicle in output.parse(routefile, ['vehicle']):
        if warmup <= float(vehicle.depart) <= stoptime:
            temp = vehicle.route
            edges = temp[0].edges.split()

            o = edges[0]
            d = edges[-1]
            #
            # o_list = get_number(o)
            # d_list = get_number(d)

            if target == 'multi':
                for i in range(1, road_num + 1):
                    if f"E{i}_in" == o:
                        for j in range(1, road_num + 1):
                            if f"E{j}_out" == d:
                                od_res[i][j] += 1

            else:
                od_res[o][d] += 1

    return od_res


def read_route_given_OD(routefile, warmup, stoptime, od_res, origin, destination):
    vehicles = set()
    od_vehicle_dict = defaultdict(lambda: defaultdict(list))

    for vehicle in output.parse(routefile, ['vehicle']):
        if warmup <= float(vehicle.depart) <= stoptime:
            temp = vehicle.route
            edges = temp[0].edges.split()

            o = edges[0]
            d = edges[-1]

            if o in origin and d in destination:
                vehicles.add(vehicle.id)
                od_res[o][d] += 1
                od_vehicle_dict[o][d].append(vehicle.id)

    return od_res, vehicles, od_vehicle_dict


def get_number(s: str):
    # p = '[\d]+[.,\d]+|[\d]*[.][\d]+|[\d]+'
    # result = []
    # if re.search(p, s) is not None:
    #     for catch in re.finditer(p, s):
    #         result.append(int(catch[0]))  # catch is a match object

    string_result = re.split('(\d+)', s)

    if string_result[0] == 'E':
        return int(string_result[1])
    else:
        return ''
