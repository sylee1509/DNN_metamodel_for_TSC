# A Simulation Optimization Framework for Traffic Signal Control Problem Using a DNN-based Metamodel

## Overview
This repository contains the source code for the simulation-optimization framework proposed in the paper "A Simulation Optimization Framework for Traffic Signal Control Problem Using a DNN-based Metamodel". The framework aims to address traffic congestion in modern cities by optimizing traffic signal control systems. Traditional simulation optimization approaches often face two significant challenges: designing a simulation environment and running the simulator during the optimization process. This framework overcomes these challenges by utilizing a deep neural network (DNN)-based metamodel to approximate the simulator's output.

## Framework Summary
The proposed simulation-optimization framework consists of five key steps:

1. Parameterizing Real-World Features: Representing road networks and traffic demands as input features for the simulation.
2. Constructing Sample Intersections: Creating simulation environments to mimic real-world traffic conditions.
3. Gathering Training Data: Running a simulator to generate data for training the DNN model.
4. Fitting the Metamodel: Using the generated data to train a DNN-based model that predicts simulator outputs.
5. Optimizing Traffic Signals: Using the trained DNN model to optimize traffic signal control in real time when new data is provided.

The framework is designed to be computationally efficient while maintaining high accuracy in both prediction and optimization. Its performance is robust across different road networks and traffic demands. Below is a visual summary of the framework:

<p align="center">
  <img src="figures/proposed_framework.png" alt="Framework Diagram" width="500"/>
  <br />
  <figcaption><strong>Figure 1:</strong> The framework flowchart illustrating the simulation-optimization process using a DNN-based metamodel..</figcaption>
</p>

## Requirements
To run the code, you will need:
* Python 3.8+
* SUMO 1.12.0


## Directory Strucutre

This repository is organized into the following key directories:

### DNN-based Metamodel
Predictive models are provided along with training and test data. These codes are used to train the DNN-based metamodel for predicting simulation outputs. The trained metamodels are uesd to optimize phase durations for isolated intersections.

### Simulation Scope directory
Simulation models are provided to generate the data used for training the predictive models in the `DNN-based Metamodel` directory. These simulation models mimic real-world traffic conditions and generate the necessary data for the metamodel.
