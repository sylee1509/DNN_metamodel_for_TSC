# -*- coding: utf-8 -*-
# Eclipse SUMO, Simulation of Urban MObility; see https://eclipse.org/sumo
# Copyright (C) 2011-2019 German Aerospace Center (DLR) and others.
# This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v2.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v20.html
# SPDX-License-Identifier: EPL-2.0

# @file    turndefinitions.py
# @author  Karol Stosiek
# @author  Michael Behrisch
# @date    2011-10-26
# @version $Id$

from __future__ import absolute_import

import logging
import os
import sys

if 'SUMO_HOME' in os.environ:
    tools = os.path.join(os.environ['SUMO_HOME'], 'tools')
    sys.path.append(tools)
else:
    sys.exit("please declare environment variable 'SUMO_HOME'")

# import sumolib
# from . import connections
# from . import collectinghandler
from . import my_xml

LOGGER = logging.getLogger(__name__)


class TurnDefinitions():

    """ Represents a connection of turn definitions. """

    logger = logging.getLogger(__name__)

    def __init__(self):
        """ Constructor. """
        self.turn_definitions = {}

    def add(self, source, destination, probability, original = True):
        """ Adds a turn definition. If the given turn definition is already
            defined (in regard to source and destination), issues
            a warning. """

        self.logger.debug("Adding turn definition for %s -> %s "
                          "with probability %f" % (source, destination, probability))

        if source not in self.turn_definitions:
            self.turn_definitions[source] = {}

        if destination not in self.turn_definitions[source]:
            self.turn_definitions[source][destination] = 0

        # table이 주어졌을 때는 확률을 누적안하고 직접 대입하기
        if original:
            self.turn_definitions[source][destination] += probability
        else:
            self.turn_definitions[source][destination] = probability

        if self.turn_definitions[source][destination] > 100:
            self.logger.warning("Turn probability overflow: %f; lowered to 100" %
                             (self.turn_definitions[source][destination]))
            self.turn_definitions[source][destination] = 100

    def get_sources(self):
        """ Returns all of the turn definitions incoming edges. The result
            will be sorted in alphabetical. """

        sources = sorted(self.turn_definitions.keys())
        return sources

    def get_destinations(self, source):
        """ Returns all of the turn definition's outgoing edges achievable
            from given source. The turn_definition_source must
            have been added before. The result will be sorted in alphabetical
            order."""

        destinations = sorted(self.turn_definitions[source].keys())
        return destinations

    def get_turning_probability(self,
                                source,
                                destination):
        """ Returns the turning probability related to the given
            turn definition. The source and destination must have
            been added before. """

        return self.turn_definitions[source][destination]

    def __eq__(self, other):
        """ Compares this and given object for equality.  """

        if other is None or other.__class__ is not TurnDefinitions:
            self.logger.debug("Checking for equality with "
                              "non-TurnDefinitions object")
            return False

        return self.turn_definitions == other.turn_definitions


# 주어진 connection과 테이블(csv)로부터 route file 만들기
def from_connections(input_connections, table):
    """ Creates a TurnDefinitions object from given Connections' object. """

    LOGGER.info("Creating turn definitions")

    turn_definitions = TurnDefinitions()
    for source in input_connections.get_sources():
        if source[0] == ":":
            continue

        for source_lane in input_connections.get_lanes(source):
            for destination in input_connections.get_destinations(source, source_lane):

                LOGGER.debug("Adding connection %s -> %s " % (source, destination))

                turn_definitions.add(source, destination, table[source[0] + destination[0]], False)

    return turn_definitions


def to_flows_xml(interval, table):
    """ Transforms the given TurnDefinitions object into a string
        containing a valid SUMO turn-definitions file. """

    LOGGER.info("Converting turn definitions to XML")
    # LOGGER.debug("Turn definitions sources number: %i" %
    #              (len(turn_definitions.get_sources())))

    flows_xml = my_xml.create_document("routes", schema="routes_file.xsd")

    flow_element = flows_xml.addChild("vType")
    flow_element.setAttribute("id", "default")
    flow_element.setAttribute("maxSpeed", 13.9)

    id_count = 0

    # for idx, scenario in enumerate(scenarios):
    for source in range(1, 5):
        for dest in range(1, 5):
            if f'{source}_{dest}' in table.index and float(table[f'{source}_{dest}']) > 0:
                flow_element = flows_xml.addChild("flow")

                # 차량을 한 시간당 n대가 나오는 푸아송 분포를 따르도록 설정
                flow_element.setAttribute("from", f'{source}I')
                flow_element.setAttribute("to", f'{dest}O')
                flow_element.setAttribute("probability", float(table[f'{source}_{dest}']) / 3600)
                flow_element.setAttribute("begin", interval[0])
                flow_element.setAttribute("end", interval[1])
                flow_element.setAttribute("id", id_count)
                flow_element.setAttribute("type", "default")

                id_count += 1

    return flows_xml.toXML()



def to_flows_xml_multi(interval, table):
    """ Transforms the given TurnDefinitions object into a string
        containing a valid SUMO turn-definitions file. """

    LOGGER.info("Converting turn definitions to XML")
    # LOGGER.debug("Turn definitions sources number: %i" %
    #              (len(turn_definitions.get_sources())))

    flows_xml = my_xml.create_document("routes", schema="routes_file.xsd")

    flow_element = flows_xml.addChild("vType")
    flow_element.setAttribute("id", "default")
    flow_element.setAttribute("maxSpeed", 13.9)

    id_count = 0

    # for idx, scenario in enumerate(scenarios):
    for source in range(1, 9):
        for dest in range(1, 9):
            if f'{source}_{dest}' in table.index and float(table[f'{source}_{dest}']) > 0:
                flow_element = flows_xml.addChild("flow")

                # 차량을 한 시간당 n대가 나오는 푸아송 분포를 따르도록 설정
                flow_element.setAttribute("from", f'{source}I')
                flow_element.setAttribute("to", f'{dest}O')
                flow_element.setAttribute("probability", float(table[f'{source}_{dest}']) / 3600)
                flow_element.setAttribute("begin", interval[0])
                flow_element.setAttribute("end", interval[1])
                flow_element.setAttribute("id", id_count)
                flow_element.setAttribute("type", "default")

                id_count += 1

    return flows_xml.toXML()
