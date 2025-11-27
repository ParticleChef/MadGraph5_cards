#!/bin/bash

for Med in 150 195 200 295 300 495 500 745 750 995 1000 1245 1250 1495 1500 1700 1750 1995 2000 2245 2250 2495 2500 2995 3000
do
    for DM in 50 100 150 250 300 325 500 625 700 750 800 1000 1125 1250 1500 2000
    do
        cardDir=MonotopCards_13p6
        copyDir=MonotopModels
        copyMass=DMsimp_s_spin1_monotop_2500_750_800
        targetDir=Vector_MonoTop_NLO_Mphi-${Med}_Mchi-${DM}_gSM-0p25_gDM-1p0_13p6TeV-madgraph

        if [ -e ${cardDir}/${targetDir} ]; then
            echo "copy model from = ${copyDir}"
            echo "target directory = ${cardDir}/${targetDir}"

            cp -r ${copyDir}/${copyMass} ${cardDir}/${targetDir}/DMsimp_s_spin1_monotop_${Med}_${DM}_800

            if [ -e ${cardDir}/${targetDir}/${targetDir}_proc_card.dat ]; then
                cd ${cardDir}/${targetDir}/DMsimp_s_spin1_monotop_${Med}_${DM}_800
                sed -i  "288s/750.0/"${DM}"/g" parameters.py
                sed -i  "296s/2500/"${Med}"/g" parameters.py
            fi
            cd ../
            tar -zcf DMsimp_s_spin1_monotop_${Med}_${DM}_800.tgz DMsimp_s_spin1_monotop_${Med}_${DM}_800
            rm -r DMsimp_s_spin1_monotop_${Med}_${DM}_800/
            cd ../../

        fi

    done
done
