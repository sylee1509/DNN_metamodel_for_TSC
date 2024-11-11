import copy
import module.utils


class Solution:
    # attributes: junction list, pm(performance measure), d(delay value), sc(stopcount value)
    def __init__(self, junction_list: list):
        self.__junction_list = copy.deepcopy(junction_list)
        self.__results = None
        self.__pm = None
        self.__PM = None

    def setPM(self, results, history):
        self.__results = results
        self.__pm = module.utils.get_performance_measure(results, history)

        if history.getIndex(self) == -1:
            history.sethistory(self)

    def print(self):
        for junction in self.__junction_list:
            print(junction.ID + " split: ", end=" ")
            print(junction.split, end=" ")
            print(" offset: " + str(junction.offset))

    def print_results(self):
        print(self.__results)

    @property
    def junction_list(self):
        return self.__junction_list

    @property
    def PM(self):
        return sum(self.__pm) / len(self.__pm)

    @property
    def pm(self):
        return self.__pm

    @property
    def results(self):
        return self.__results
