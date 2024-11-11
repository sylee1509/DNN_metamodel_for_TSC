# 2022.04.05
# Seungyeop Lee
# This file makes input.tll.xml

import os
import sys
import sumolib.xml as xml
import optparse
import logging
import csv
import pandas as pd
import numpy as np

FILE_PATH = os.path.dirname(os.path.realpath(__file__))

if 'SUMO_HOME' in os.environ:
    tools = os.path.join(os.environ['SUMO_HOME'], 'tools')
    sys.path.append(tools)
else:
    sys.exit("please declare environment variable 'SUMO_HOME'")


def tls(df: pd.DataFrame):
    print()
    print(f'The number of tls files : {len(df)}')

    green = 15
    yellow = 3

    for index, row in df.iterrows():
        # only use phase sequence 1

        tlLogics = xml.create_document("tlLogics", schema=FILE_PATH + "/schema/tllogic_file.xsd")
        tlLogics_file = open(file=FILE_PATH + f"/../network/inputs/input_{row['id']}.tll.xml", mode="w")

        tlLogic = tlLogics.addChild("tlLogic")
        tlLogic.setAttribute("id", 'J0')
        tlLogic.setAttribute("programID", 0)
        tlLogic.setAttribute("type", "static")

        ### phase sequence 1
        # phase 1
        # initialize
        state = list()
        state.extend(['r' * row['1r'], 'r' * row['1s'], 'G' * row['1l']])  # road 1
        state.extend(['G' * row['2r'], 'r' * row['2s'], 'r' * row['2l']])  # road 2
        state.extend(['r' * row['3r'], 'r' * row['3s'], 'G' * row['3l']])  # road 3
        state.extend(['G' * row['4r'], 'r' * row['4s'], 'r' * row['4l']])  # road 4

        phase = tlLogic.addChild("phase")
        phase.setAttribute("state", ''.join(state))
        phase.setAttribute("duration", green)

        # yellow phase
        state = list()
        state.extend(['r' * row['1r'], 'r' * row['1s'], 'Y' * row['1l']])  # road 1
        state.extend(['Y' * row['2r'], 'r' * row['2s'], 'r' * row['2l']])  # road 2
        state.extend(['r' * row['3r'], 'r' * row['3s'], 'Y' * row['3l']])  # road 3
        state.extend(['Y' * row['4r'], 'r' * row['4s'], 'r' * row['4l']])  # road 4

        phase = tlLogic.addChild("phase")
        phase.setAttribute("state", ''.join(state))
        phase.setAttribute("duration", yellow)

        # phase 2
        # initialize
        state = list()
        state.extend(['G' * row['1r'], 'G' * row['1s'], 'r' * row['1l']])  # road 1
        state.extend(['r' * row['2r'], 'r' * row['2s'], 'r' * row['2l']])  # road 2
        state.extend(['G' * row['3r'], 'G' * row['3s'], 'r' * row['3l']])  # road 3
        state.extend(['r' * row['4r'], 'r' * row['4s'], 'r' * row['4l']])  # road 4

        phase = tlLogic.addChild("phase")
        phase.setAttribute("state", ''.join(state))
        phase.setAttribute("duration", green)

        # yellow phase
        state = list()
        state.extend(['G' * row['1r'], 'Y' * row['1s'], 'r' * row['1l']])  # road 1
        state.extend(['r' * row['2r'], 'r' * row['2s'], 'r' * row['2l']])  # road 2
        state.extend(['G' * row['3r'], 'Y' * row['3s'], 'r' * row['3l']])  # road 3
        state.extend(['r' * row['4r'], 'r' * row['4s'], 'r' * row['4l']])  # road 4

        phase = tlLogic.addChild("phase")
        phase.setAttribute("state", ''.join(state))
        phase.setAttribute("duration", yellow)

        # phase 3
        # initialize
        state = list()
        state.extend(['G' * row['1r'], 'r' * row['1s'], 'r' * row['1l']])  # road 1
        state.extend(['r' * row['2r'], 'r' * row['2s'], 'G' * row['2l']])  # road 2
        state.extend(['G' * row['3r'], 'r' * row['3s'], 'r' * row['3l']])  # road 3
        state.extend(['r' * row['4r'], 'r' * row['4s'], 'G' * row['4l']])  # road 4

        phase = tlLogic.addChild("phase")
        phase.setAttribute("state", ''.join(state))
        phase.setAttribute("duration", green)

        # yellow phase
        state = list()
        state.extend(['Y' * row['1r'], 'r' * row['1s'], 'r' * row['1l']])  # road 1
        state.extend(['r' * row['2r'], 'r' * row['2s'], 'Y' * row['2l']])  # road 2
        state.extend(['Y' * row['3r'], 'r' * row['3s'], 'r' * row['3l']])  # road 3
        state.extend(['r' * row['4r'], 'r' * row['4s'], 'Y' * row['4l']])  # road 4

        phase = tlLogic.addChild("phase")
        phase.setAttribute("state", ''.join(state))
        phase.setAttribute("duration", yellow)

        # phase 4
        # initialize
        state = list()
        state.extend(['r' * row['1r'], 'r' * row['1s'], 'r' * row['1l']])  # road 1
        state.extend(['G' * row['2r'], 'G' * row['2s'], 'r' * row['2l']])  # road 2
        state.extend(['r' * row['3r'], 'r' * row['3s'], 'r' * row['3l']])  # road 3
        state.extend(['G' * row['4r'], 'G' * row['4s'], 'r' * row['4l']])  # road 4

        phase = tlLogic.addChild("phase")
        phase.setAttribute("state", ''.join(state))
        phase.setAttribute("duration", green)

        # yellow phase
        state = list()
        state.extend(['r' * row['1r'], 'r' * row['1s'], 'r' * row['1l']])  # road 1
        state.extend(['G' * row['2r'], 'Y' * row['2s'], 'r' * row['2l']])  # road 2
        state.extend(['r' * row['3r'], 'r' * row['3s'], 'r' * row['3l']])  # road 3
        state.extend(['G' * row['4r'], 'Y' * row['4s'], 'r' * row['4l']])  # road 4

        phase = tlLogic.addChild("phase")
        phase.setAttribute("state", ''.join(state))
        phase.setAttribute("duration", yellow)

        tlLogics_file.write(tlLogics.toXML())
        tlLogics_file.close()
