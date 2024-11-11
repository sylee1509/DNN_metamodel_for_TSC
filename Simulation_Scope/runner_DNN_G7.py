# 2021.02.08
# @Copyright Seungyeop Lee

import os
import sumolib
import Run_sumo
import duarouter.generateTurnDefs
from module.utils import *
from module import *
from module.Junction import *
from module.Solution import *


def main(filename, scenario_filename):
    df_parameter = pd.read_csv(f"parameter/{filename}")
    df_scenario = pd.read_csv(scenario_filename, index_col=0)

    for idx in df_parameter.index:
        parameter = df_parameter.loc[idx]
        target = parameter['target']
        run_type = parameter['runType']

        # Version
        scenarios = list(map(int, str(parameter['scenario']).split(',')))

        # Parameters
        warmup = parameter['warmup']  # warmup period (seconds)
        stoptime = parameter['stoptime']  # simulation period (seconds)
        interval = parameter['interval']
        intervals = [*[[warmup + i * interval, warmup + (i + 1) * interval] if i > 0 else [0, warmup + interval] for i, scenario in enumerate(scenarios)]]
        nonstationary = parameter['nonstationary']
        replication = parameter['replication']
        pattern = list(map(int, str(parameter['testPattern']).split(',')))
        num_iter = parameter['iteration']

        # SUMO setting
        nowarning = parameter['nowarning']
        nogui = parameter['nogui']
        duration_log = parameter['durationLog']
        step_log = parameter['stepLog']

        # Performance measure information
        weights = dict()
        weights['wait'] = float(parameter['w1'])        # Waiting time
        weights['travel'] = float(parameter['w2'])      # Travel time
        weights['stop'] = float(parameter['w3'])        # Stop count
        weights['timeloss'] = float(parameter['w4'])    # Time Loss
        weights['speed'] = float(parameter['w5'])       # Speed

        # Model information
        random.seed(int(parameter['seed']))  # Fix seed to get reproductive results
        historylength = parameter['historyLength']

        print(f"===================== TARGET: {target} =====================")

        df_results = pd.DataFrame()

        df_mingreen = pd.read_csv(f"parameter/mingreen.csv", index_col=0).fillna(0).astype(int)
        df_maxgreen = pd.read_csv(f"parameter/maxgreen.csv", index_col=0).fillna(0).astype(int)

        mingreen = {i: df_mingreen[['p1', 'p2', 'p3', 'p4', 'p5', 'p6']].loc[i].values.tolist() for i in df_mingreen.index}
        maxgreen = {i: df_maxgreen[['p1', 'p2', 'p3', 'p4', 'p5', 'p6']].loc[i].values.tolist() for i in df_maxgreen.index}

        # State information
        df_cycle_info = pd.read_csv(f"parameter/cycle.csv", index_col=0).fillna(0)

        cycle = df_cycle_info['cycle']
        yellow = df_cycle_info[['y1', 'y2', 'y3', 'y4', 'y5', 'y6']]
        fixed = df_cycle_info['fixed']

        cycle_green = cycle - yellow.sum(axis=1)

        test_scen = list()

        if nonstationary:
            test_scen.append(scenarios)
        else:
            for i, scenario in enumerate(scenarios):
                test_scen.append([scenario])

        for scen in test_scen:
            input_data = df_scenario[df_scenario['id'] == target].iloc[scen[0]]

            if nonstationary:
                scenarioNum = 'nonstationary'
            else:
                scenarioNum = scen[0]

            print("-----------------------  Scenario " + str(scenarioNum) + "  -----------------------")

            # In this code, it is assumed that network.net.xml and route.rou.xml are already made
            # Read networkfile
            net = sumolib.net.readNet(f'network/{target}.net.xml', withPrograms=True)

            duarouter.generateTurnDefs.main(input_data, intervals[0], target)

            print("generateTurn done.")

            veh_generated = list()

            for seed in range(replication):
                os.system(f'duarouter '
                          f'--seed {seed} '
                          f'-n network/{target}.net.xml '
                          f'-r duarouter/{target}.flows.xml '
                          f'-e {stoptime} '
                          f'--departlane best '
                          f'--departspeed max '
                          f'-o route/{target}_{scenarioNum}_{seed}.rou.xml ')

                veh_generated.append(Run_sumo.read_route(f'route/{target}_{scenarioNum}_{seed}.rou.xml', warmup, stoptime))

            # InitSol = get_initial('guideline', target, pattern, mingreen, maxgreen, cycle, scenarioNum)

            # Create history
            history = History.History(historylength, weights)

            # J1

            split = input_data[['p1', 'p2', 'p3', 'p4']]
            print(split)
            J1 = Junction(ID=target, split=split, phasenum=4, yellow=yellow.loc[target], fixed=fixed.loc[target],
                              mingreen=mingreen[target], maxgreen=maxgreen[target], totalcycle=cycle_green[target], offset=0)
            InitSol = Solution([J1])

            for trafficIndex in pattern:
                # Create domain
                # print("Creating domain ... ", end="")
                # domain = get_domain(InitSol.junction_list)
                # print("done.")

                if not checkValidity(InitSol):
                    print("Not valid initial!")
                    sys.exit()

                param = set_options(target, nogui, duration_log, step_log, trafficIndex, stoptime, nowarning)
                param = getParam(trafficIndex, InitSol, net, param, target)
                results = Run_sumo.RUN_SUMO(run_type, param, warmup, stoptime, replication, scenarioNum, trafficIndex, InitSol, target)
                InitSol.setPM(results, history)

            history.to_csv(input_data, f'output/G7_{target}_{idx}_{scen[0]}.csv', replication)


if __name__ == "__main__":
    # filename = 'parameter_sample_network.csv'
    filename = 'parameter_real_network.csv'
    scenario_filename = 'additional/opt_real_another_pm_grid_7.csv'
    main(filename=filename, scenario_filename=scenario_filename)
