#!/bin/bash

mkdir -p models/

for Med in 750 1250 1750 2000
do
    #echo ${Med}
    DM=150
    modelName=DMsimp_s_spin1_monotop_${Med}_${DM}_800
    echo ${modelName}
    cp -r DMsimp_s_spin1_monotop_1500_150_800 models/${modelName}

    ### replace number ###
    sed -i "296s/1500/${Med}/g" models/${modelName}/parameters.py
    
    ### print output ###
    sed -n -e 296p models/${modelName}/parameters.py
done
