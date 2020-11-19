#!/bin/bash
for Med in 750 1250 1750 2000
do
    echo ${Med}
    DM=150
    modelName=DMsimp_s_spin1_monotop_${Med}_${DM}_800
    echo ${modelName}
    cp -r DMsimp_s_spin1_monotop_1500_150_800 DMsimp_s_spin1_monotop_${Med}_${DM}_800

    cd ${modelName}/
    sed -i "296s/.*/                 value =  "${Med}",/g" parameters.py

    cd ../

done
