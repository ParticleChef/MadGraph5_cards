#!/bin/bash
for Med in 1700
do
    echo ${Med}
    DM=800
    modelName=DMsimp_s_spin1_monotop_${Med}_${DM}_800
    echo ${modelName}
    cp -r DMsimp_s_spin1_monotop_1500_150_800 DMsimp_s_spin1_monotop_${Med}_${DM}_800

    cd ${modelName}/
    sed -i "296s/.*/                 value =  "${Med}",/g" parameters.py

    cd ../

done
