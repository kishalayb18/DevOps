#!/bin/bash

NEW_REPLICAS=5
FILE="deployment.yaml"

sed -i "s/replicas: [0-9]\+/replicas: $NEW_REPLICAS/" $FILE