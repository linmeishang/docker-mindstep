#!/bin/bash

exec python3 data_preparation.py &

sleep 30 # add a delay to make sure all data are saved before training

exec python3 train.py

