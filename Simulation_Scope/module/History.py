from module.utils import *


class History:  # save cycletime, performance measure, average delay, and average stop count information during tabu search cycle
    def __init__(self, historylength, weights):
        self.__weights = weights
        self.__best = None
        self.historylength = historylength
        self.solution = [None for _ in range(historylength)] # split and offset
        self.historycount = 0

    def printhistory(self):  # print history
        print("history ")
        print("count: ", self.historycount)
        for i in range(self.historycount):
            print("fitness: ", self.solution[i].PM)
            for key, value in self.solution[i].results.items():
                print(key, ':', value)

    def getIndex(self, solution):
        # if the given cycletime exists in the history, return the index key
        # (index key is used to get performance measure, delay, stopcount data of the given cycletime)
        # if the given cycletime appears for the first time, return -1
        maxindex = self.historycount if self.historycount < self.historylength else self.historylength

        for i in range(maxindex):
            check = True
            for j, junction in enumerate(solution.junction_list):
                for phase in range(junction.phasenum):
                    if junction.split[phase] != self.solution[i].junction_list[j].split[phase]:
                        check = False

                if junction.offset != self.solution[i].junction_list[j].offset:
                    check = False

            if check:
                return i

        return -1

    def sethistory(self, solution: Solution):  # set new history
        index = self.historycount % self.historylength

        self.solution[index] = solution
        self.historycount += 1

        if self.__best is None:
            self.__best = solution
        else:
            if self.__best.PM > solution.PM:
                self.__best = solution

    @ property
    def best(self):
        return self.__best

    @ property
    def weights(self):
        return self.__weights

    def get_solution(self, index):   # return the split and offset of history[index]
        return self.solution[index]

    def to_csv(self, row, file, replication):
        df = pd.DataFrame()

        for sol in self.solution:
            if sol is not None:
                # save results in dataframe
                for junction in sol.junction_list:
                    for i in range(junction.phasenum):
                        row[f'{junction.ID}_{i}'] = junction.split[i]

                for seed in range(replication):
                    for measure in ['wait', 'travel', 'stop', 'timeloss', 'speed']:
                        row[f'{measure}{seed}'] = sol.results[measure][seed]

                row['time'] = sol.results['time']
                row['performance measure'] = sol.PM

                df = pd.concat([df, pd.DataFrame({i: [v] for i, v in row.items()})])

        df.to_csv(file)
