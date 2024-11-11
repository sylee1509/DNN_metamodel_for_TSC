# 2022.03.21
# Seungyeop Lee
# This file makes input.con.xml

import os
import sys
import optparse
import logging
import csv
import module.my_xml as xml
import pandas as pd


FILE_PATH = os.path.dirname(os.path.realpath(__file__))


if 'SUMO_HOME' in os.environ:
    tools = os.path.join(os.environ['SUMO_HOME'], 'tools')
    sys.path.append(tools)
else:
    sys.exit("please declare environment variable 'SUMO_HOME'")


def connections(df: pd.DataFrame):

    print()
    print(f'The number of connections files : {len(df)}')

    for index, row in df.iterrows():
        connections = xml.create_document("connections", schema=FILE_PATH + "/schema/connections_file.xsd")
        connections_file = open(file=FILE_PATH + f"/../network/inputs/input_{row['id']}.con.xml", mode="w")

        # connection 설정
        for road in range(1, 5):
            # column 순서는 from to fromlane tolane
            lane = 0

            for direction in ['r', 's', 'l']:
                for _ in range(row[f'{road}{direction}']):
                    connection = connections.addChild("connection")

                    connection.setAttribute("from", f'{road}I')
                    connection.setAttribute("fromLane", lane)

                    # road
                    if direction == 'r':
                        next_road = road + 3
                    elif direction == 's':
                        next_road = road + 2
                    elif direction == 'l':
                        next_road = road + 1
                    else:
                        print('Invalid direction!')
                        exit()

                    if next_road > 4:
                        next_road -= 4

                    oppo_of_next_road = next_road + 2

                    if oppo_of_next_road > 4:
                        oppo_of_next_road -= 4

                    # lane
                    if direction == 'r':
                        next_lane = lane
                    elif direction == 's':
                        next_lane = lane
                    elif direction == 'l':
                        next_lane = row[f'{oppo_of_next_road}'] - (row[f'{road}'] - lane)
                    else:
                        print('Invalid direction!')
                        exit()

                    connection.setAttribute("to", f'{next_road}O')
                    connection.setAttribute("toLane", next_lane)

                    connection.setAttribute("contPos", 0)

                    lane += 1

        connections_file.write(connections.toXML())
        connections_file.close()
