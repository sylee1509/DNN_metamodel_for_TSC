# 2020.02.21
# Seungyeop Lee
# This file makes input.nod.xml

import os
import sys
import sumolib.xml as xml
import optparse
import logging


FILE_PATH = os.path.dirname(os.path.realpath(__file__))


if 'SUMO_HOME' in os.environ:
    tools = os.path.join(os.environ['SUMO_HOME'], 'tools')
    sys.path.append(tools)
else:
    sys.exit("please declare environment variable 'SUMO_HOME'")


def nodes(number):
    nodes = xml.create_document("nodes", schema=FILE_PATH + "/schema/nodes_file.xsd")

    length = 300

    node = nodes.addChild("node")
    node.setAttribute("id", 'J0')
    node.setAttribute("type", "traffic_light")
    node.setAttribute("x", 0.0)
    node.setAttribute("y", 0.0)

    node = nodes.addChild("node")
    node.setAttribute("id", 'J1')
    node.setAttribute("x", 0.0)
    node.setAttribute("y", length)

    node = nodes.addChild("node")
    node.setAttribute("id", 'J2')
    node.setAttribute("x", length)
    node.setAttribute("y", 0.0)

    node = nodes.addChild("node")
    node.setAttribute("id", 'J3')
    node.setAttribute("x", 0.0)
    node.setAttribute("y", -length)

    node = nodes.addChild("node")
    node.setAttribute("id", 'J4')
    node.setAttribute("x", -length)
    node.setAttribute("y", 0.0)

    nodes_file = open(file=FILE_PATH + "/../network/inputs/input.nod.xml", mode="w")

    nodes_file.write(nodes.toXML())

    nodes_file.close()
