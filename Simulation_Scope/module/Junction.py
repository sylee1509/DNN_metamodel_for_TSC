class Junction:
    def __init__(self, ID: str, split: list, phasenum: int, yellow: list, fixed: bool, mingreen: list, maxgreen: list, totalcycle: int, offset=0):
        self.__ID = ID
        self.__split = split
        self.__phasenum = phasenum
        self.__yellow = yellow
        self.__fixed = fixed
        self.__offset = offset
        # Constraints
        self.__mingreen = mingreen
        self.__maxgreen = maxgreen
        self.__totalcycle = totalcycle

    @property
    def ID(self):
        return self.__ID

    @property
    def split(self):
        return self.__split

    @property
    def phasenum(self):
        return self.__phasenum

    @property
    def yellow(self):
        return self.__yellow

    @property
    def fixed(self):
        return self.__fixed

    @property
    def offset(self):
        return self.__offset

    @property
    def mingreen(self):
        return self.__mingreen

    @property
    def maxgreen(self):
        return self.__maxgreen

    @property
    def totalcycle(self):
        return self.__totalcycle

    @split.setter
    def split(self, split):
        self.__split = split

    @offset.setter
    def offset(self, offset):
        self.__offset = offset

    @fixed.setter
    def fixed(self, fixed):
        self.__fixed = fixed