#!/bin/bash
for Med in 1750
do
    echo ${Med}
    DM=700
    modelName=DMsimp_s_spin1_monotop_${Med}_${DM}_800
    echo ${modelName}
    cd MonotopModels_add
    cp -r DMsimp_s_spin1_monotop_1500_150_800 DMsimp_s_spin1_monotop_${Med}_${DM}_800
    ls ${modelName}

    cd ${modelName}/
    ls
    echo change the Med parameter.
    sed -i "296s/.*/                 value =  "${Med}",/g" parameters.py

    cd ../
    ls
    cd ..

done
