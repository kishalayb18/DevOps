#!/bin/bash

NEW_REPLICAS= 6
FILE="deployment.yaml"

sed -i "s/replicas: [0-9]\+/replicas: $NEW_REPLICAS/" $FILE