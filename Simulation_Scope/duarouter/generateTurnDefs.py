#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Eclipse SUMO, Simulation of Urban MObility; see https://eclipse.org/sumo
# Copyright (C) 2011-2019 German Aerospace Center (DLR) and others.
# This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v2.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v20.html
# SPDX-License-Identifier: EPL-2.0

# @file    generateTurnDefs.py
# @author  Karol Stosiek
# @date    2011-10-26
# @version $Id$

from __future__ import absolute_import

import logging
import os
import sys

sys.path.append(os.path.join(os.environ["SUMO_HOME"], "tools"))

import pandas
from duarouter import turndefinitions

LOGGER = logging.getLogger(__name__)


def foo_callback(option, value, parser):
    setattr(parser.values, option.dest, value.split(','))


def main(scenario, interval, target: str):
    cur_location = os.path.dirname(os.path.realpath(__file__)) + "\\"
    network_file = cur_location + f"../network/{target}.net.xml"
    flows = f"{target}.flows.xml"
    flows_file = cur_location + flows

    connections_file = open(network_file, "r")
    flows_file = open(flows_file, "w")
    flows_xml = turndefinitions.to_flows_xml(interval, scenario)

    flows_file.write(flows_xml)
    connections_file.close()
    flows_file.close()


def main_multi(scenario, interval, target: str):
    cur_location = os.path.dirname(os.path.realpath(__file__)) + "\\"
    network_file = cur_location + f"../network/{target}.net.xml"
    flows = f"{target}.flows.xml"
    flows_file = cur_location + flows

    connections_file = open(network_file, "r")
    flows_file = open(flows_file, "w")
    flows_xml = turndefinitions.to_flows_xml_multi(interval, scenario)

    flows_file.write(flows_xml)
    connections_file.close()
    flows_file.close()


if __name__ == "__main__":
    scenarios = [1, 2, 3, 4, 5, 6, 7, 8]
    intervals = [[0, 2400], *[[600 + i * 1800, 600 + (i + 1) * 1800] for i in range(1, 8)]]
    stoptime = intervals[-1][1]
    cur_location = os.path.dirname(os.path.realpath(__file__)) + "\\"
    target = 'J1'
    # inputfile = f"input_{target}.csv"

    main(scenarios, intervals, target)

    replication = 3

    for seed in range(replication):
        os.system(f"duarouter -c {target}.duarcfg" +
                  f" --seed {seed}" +
                  f" --output-file ../route/{target}_nonstationary_{seed}.rou.xml" +
                  f" -e {stoptime}")