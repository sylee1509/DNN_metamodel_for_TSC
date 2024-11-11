# 2021.02.08
# @Copyright Seungyeop Lee

import sys
import csv
import time
import xml.etree.ElementTree as elemTree
import numpy as np
import math
import itertools
import pandas as pd
import random
from module.Solution import *


def setTLS(trafficIndex, solution, net, param, target):
    # make a traffic light program with the given tarffic index and cycletime
    # make converted traffic light xml file and add related parameters to param
    # return the param
    xml_string = ""

    for tls in net.getTrafficLights():
        key_list = list(tls.getPrograms().keys())

        if str(trafficIndex) in key_list:
            program = tls.getPrograms()[str(trafficIndex)]  # choose a program of selected trafficIndex
        elif "new_" + str(trafficIndex) in key_list:
            program = tls.getPrograms()["new_" + str(trafficIndex)]  # choose a program of selected trafficIndex
        phases = program.getPhases()

        # add new TLS (ID = "new_"+str(trafficIndex))
        offset = 0
        net.addTLSProgram(tls.getID(), "new_" + str(trafficIndex), offset, "static", False)

        converted_program = tls.getPrograms()["new_" + str(trafficIndex)]

        for i in range(len(phases)):
            phase = phases[i]
            if i % 2 == 0:
                converted_program.addPhase(phase.state, solution[int(i / 2)])  # add green phase
            elif i % 2 == 1:
                converted_program.addPhase(phase.state, phase.duration) # add yellow phase

        xml_string += converted_program.toXML(tls.getID())  # convert modified program to xml file

    string2xml(xml_string, f'additional/tls_{target}_{trafficIndex}.add.xml')


def string2xml(xml_string, outfile): # convert string to xml file
    with open(outfile, 'w') as outf:
        outf.write('<?xml version="1.0" encoding="UTF-8"?>\n')
        outf.write('<additional>\n')
        outf.write(xml_string)
        outf.write('</additional>\n')


def set_options(target, nogui, duration_log, step_log, phaseSeq, endtime, nowarning):
    if nogui:
        sumoBinary = 'sumo'
    else:
        sumoBinary = 'sumo-gui'

    param = [sumoBinary,
             "-n", f"network/{target}.net.xml",
             "-a", f"additional/tls_{target}_{phaseSeq}.add.xml"]

    if duration_log:
        param.append("--duration-log.disable")
    if step_log:
        param.append("--no-step-log")
    if nowarning:
        param.append("--no-warnings")

    param.append("--time-to-teleport")
    param.append("200")

    param.append("-e")
    param.append(str(endtime))

    return param


## 아래는 새로 추가된 것들


def get_domain(junction_list):
    domain = dict()

    for junction in junction_list:
        domain[junction.ID] = dict()

        points = np.array(np.meshgrid(*[range(junction.mingreen[i], junction.maxgreen[i], 1)
                                        for i in range(junction.phasenum)])).T.reshape(-1, junction.phasenum)

        feasible_region = list()

        for point in points:
            if junction.fixed:
                if sum(point) == junction.totalcycle:
                    feasible_region.append(point)
            else:
                if sum(point) <= junction.totalcycle:
                    feasible_region.append(point)

        domain[junction.ID]['split'] = feasible_region

    return domain


def checkValidity(solution):
    # check whether current cycletime satisfies mingreen, maxgreen conditions (if any)
    for junction in solution.junction_list:
        for i in range(junction.phasenum):
            if junction.split[i] > junction.maxgreen[i] or junction.split[i] < junction.mingreen[i]:
                return False
            if junction.fixed:
                if sum(junction.split) != junction.totalcycle:
                    return False
            else:
                if sum(junction.split) > junction.totalcycle:
                    return False

    return True


def getParam(trafficIndex, solution, net, param, target):
    # make a traffic light program with the given tarffic index and cycletime
    # make converted traffic light xml file and add related parameters to param
    # return the param
    xml_string = ""

    for tls in net.getTrafficLights():
        key_list = list(tls.getPrograms().keys())

        if str(trafficIndex) in key_list:
            program = tls.getPrograms()[str(trafficIndex)]  # choose a program of selected trafficIndex
        elif "new_" + str(trafficIndex) in key_list:
            program = tls.getPrograms()["new_" + str(trafficIndex)]  # choose a program of selected trafficIndex
        phases = program.getPhases()

        idx = 0
        for j, junction in enumerate(solution.junction_list):
            if tls.getID() == junction.ID:
                idx = j

        # add new TLS (ID = "new_"+str(trafficIndex))
        net.addTLSProgram(tls.getID(), "new_" + str(trafficIndex), solution.junction_list[idx].offset, "static", False)

        converted_program = tls.getPrograms()["new_" + str(trafficIndex)]

        for i in range(len(phases)):
            phase = phases[i]
            if i % 2 == 0:
                converted_program.addPhase(phase.state, solution.junction_list[idx].split[int(i / 2)])  # add green phase
            elif i % 2 == 1:
                converted_program.addPhase(phase.state, solution.junction_list[idx].yellow[int(i / 2)]) # add yellow phase

        xml_string += converted_program.toXML(tls.getID())  # convert modified program to xml file

    string2xml(xml_string, f'additional/tls_{target}_{trafficIndex}.add.xml')

    if '-a' not in param:
        param.append('-a')
        param.append(f'additional/tls_{target}_{trafficIndex}.add.xml')
        # param.append(f'additional/e2detector_{target}.xml')

    return param


def get_performance_measure(results: dict, history):
    pm = [[value * weight for value in results[key]] for key, weight in history.weights.items()]
    return list(map(sum, zip(*pm)))


def feasible_adjustment(sol):
    # violates integer
    for junction in sol.junction_list:
        for phase in range(junction.phasenum):
            junction.split[phase] = round(junction.split[phase])

    while not checkValidity(sol):
        for j, junction in enumerate(sol.junction_list):
            phase_case = []
            phase_case_fixed = []

            # violates min phase length
            for phase in range(junction.phasenum):
                if junction.mingreen[phase] >= junction.split[phase]:
                    junction.split[phase] = junction.mingreen[phase]
                    phase_case.append(phase)
                    phase_case_fixed.append(phase)

            # violates max phase length
            for phase in range(junction.phasenum):
                if junction.maxgreen[phase] < junction.split[phase]:
                    junction.split[phase] = junction.maxgreen[phase]
                    phase_case_fixed.append(phase)

            # violates total cycle length
            if junction.totalcycle < sum(junction.split):
                print("total cycle length is greater than max length!")
                print(junction.split)

                phase_case = list(set(phase_case))

                phase_length = 0
                for phase in phase_case:
                    phase_length += junction.split[phase]

                idx = np.argmax(junction.split)

                total = sum(junction.split) - junction.split[idx] - phase_length
                surplus = junction.totalcycle - junction.split[idx] - phase_length

                for phase in range(junction.phasenum):
                    if phase != idx and phase not in phase_case:
                        junction.split[phase] = round(surplus * (junction.split[phase] / total))

                junction.split[idx] += junction.totalcycle - sum(junction.split)
                print(junction.split)

            if junction.fixed:
                phase_case_fixed = list(set(phase_case_fixed))
                if junction.totalcycle != sum(junction.split):
                    if junction.phasenum - 1 in phase_case_fixed:
                        idx = random.randint(0, junction.phasenum - 2)
                        junction.split[idx] += junction.totalcycle - sum(junction.split)
                    else:
                        junction.split[junction.phasenum - 1] += junction.totalcycle - sum(junction.split)

    return sol


def projection(solution, prev_solution, split_target, offset_target):
    # TODO: junction의 combination을 고려하는게 아니라 junction마다 체크하고 있는 것을 수정하기

    sol = Solution(solution.junction_list)
    temp_sol = Solution(solution.junction_list)

    for j, junction in enumerate(sol.junction_list):
        if split_target:
            temp = list()

            for i in range(junction.phasenum):
                temp.append([math.floor(junction.split[i]), math.ceil(junction.split[i])])

            domain = list(map(list, itertools.product(*temp)))

            while True:
                domain = list(k for k, _ in itertools.groupby(domain))

                temp_domain = list()

                for e in domain:
                    temp_sol.junction_list[j].split = e
                    if checkValidity(temp_sol):
                        temp_domain.append(e)

                domain = temp_domain

                if len(domain) > 0:
                    sample = random.choice(domain)
                    junction.split = sample
                    temp_sol.junction_list[j].split = sample
                    break

                for element in domain:
                    for i in range(junction.phasenum):
                        new1 = copy.deepcopy(element)
                        new2 = copy.deepcopy(element)
                        new1[i] += 1
                        new2[i] -= 1

                        domain.append(new1)
                        domain.append(new2)

        # TODO: if offset has a constraint, then fix this code
        # if offset_target:
            # idx = np.argmin([np.linalg.norm(solution.junction_list[j].offset, point) for point in domain[junction.ID]['offset']])
            # junction.offset = domain[junction.ID]['offset'][idx]

    return sol


def write_output(df: pd.DataFrame, curSolution: Solution, bestSolution: Solution, scenarioNum, phaseSeq, replication, veh_generated, startTime, algorithm, iteration, step):
    row = {}

    # save results in dataframe
    for junction in curSolution.junction_list:
        for i in range(junction.phasenum):
            row[f'{junction.ID}_{i}'] = junction.split[i]

    if bestSolution is not None:
        for junction in bestSolution.junction_list:
            for i in range(junction.phasenum):
                row[f'best_{junction.ID}_{i}'] = junction.split[i]

    for seed in range(replication):
        for measure in ['wait', 'travel', 'stop', 'timeloss', 'speed', 'throughput', 'to_be_throughput']:
            row[f'{measure}{seed}'] = curSolution.results[measure][seed]

    row['time'] = curSolution.results['time']
    row['iteration_time'] = time.time() - startTime
    row['performance measure'] = curSolution.PM
    row['veh_generated'] = sum(veh_generated) / replication

    row['scenario'] = scenarioNum
    row['phaseSeq'] = phaseSeq
    row['algorithm'] = algorithm
    row['iteration_type'] = iteration
    row['step'] = step

    df = pd.concat([df, pd.DataFrame({i: [v] for i, v in row.items()})])

    return df
