# 2020.02.21
# Seungyeop Lee
# This file makes input.edg.xml

import os
import sys
import optparse
import logging
import pandas as pd
import module.my_xml as xml


FILE_PATH = os.path.dirname(os.path.realpath(__file__))


if 'SUMO_HOME' in os.environ:
    tools = os.path.join(os.environ['SUMO_HOME'], 'tools')
    sys.path.append(tools)
else:
    sys.exit("please declare environment variable 'SUMO_HOME'")


def edges(df: pd.DataFrame):

    temp_df = df[[f'{road}' for road in range(1, 5)]].copy()
    temp_df.drop_duplicates(inplace=True)
    temp_df.reset_index(inplace=True, drop=True)

    print(temp_df)
    print()
    print(f'The number of edge files : {len(temp_df)}')

    # row 순서대로 node 매치
    for index, row in temp_df.iterrows():
        edges = xml.create_document("edges", schema=FILE_PATH + "/schema/edges_file.xsd")

        temp_id = "_".join([str(int(row[f'{r}'])) for r in range(1, 5)])
        edges_file = open(file=FILE_PATH + f"/../network/inputs/input_{temp_id}.edg.xml", mode="w")

        for road in range(1, 5):

            # forward edge
            edge = edges.addChild("edge")

            edge.setAttribute("id", str(road) + "I")
            edge.setAttribute("priority", -1)
            edge.setAttribute("to", 'J0')
            edge.setAttribute("from", 'J' + str(road))
            edge.setAttribute("numLanes", row[f'{road}'])

            oppo_road = road + 2
            if oppo_road > 4:
                oppo_road -= 4

            # backward edge
            edge = edges.addChild("edge")

            edge.setAttribute("id", str(road) + "O")
            edge.setAttribute("priority", -1)
            edge.setAttribute("to", 'J' + str(road))
            edge.setAttribute("from", 'J0')
            edge.setAttribute("numLanes", row[f'{oppo_road}'])

        edges_file.write(edges.toXML())
        edges_file.close()
