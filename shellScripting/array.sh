#! /bin/bash
echo 'hi'
index_array=(1 2 3 4 5 6)
echo ${index_array[@]}

set=(sit uat)
echo ${set[@]}

for var in "${set[@]}"; do
echo $var.yaml
done
