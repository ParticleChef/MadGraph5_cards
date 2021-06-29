#!/bin/bash

for Med in 195 200 295 300 495 500 750 995 1000 1250 1495 1500 1700 1750 1995 2000 2495 2500 2995 3000
do
    for DM in 50 100 150 250 300 500 700 750 800 1000 1250 1500 2000
    do
        cardDir=MonotopCards_New
        copyDir=sebastian_cards
        copyMass=Vector_MonoTop_NLO_Mphi-2500_Mchi-750_gSM-0p25_gDM-1p0_13TeV-madgraph
        targetDir=Vector_MonoTop_NLO_Mphi-${Med}_Mchi-${DM}_gSM-0p25_gDM-1p0_13TeV-madgraph

        if [ -e MonotopCards/${targetDir} ]; then
            echo "copy cards from = ${copyDir}"
            echo "target directory = ${cardDir}/${targetDir}"

            mkdir -p ${cardDir}/${targetDir}
            cp ${copyDir}/${copyMass}_run_card.dat ${cardDir}/${targetDir}/${targetDir}_run_card.dat
            cp ${copyDir}/${copyMass}_proc_card.dat ${cardDir}/${targetDir}/${targetDir}_proc_card.dat
            cp ${copyDir}/${copyMass}_customizecards.dat ${cardDir}/${targetDir}/${targetDir}_customizecards.dat
            cp ${copyDir}/${copyMass}_extramodels.dat ${cardDir}/${targetDir}/${targetDir}_extramodels.dat
            cp ${copyDir}/${copyMass}_madspin_card.dat ${cardDir}/${targetDir}/${targetDir}_madspin_card.dat
            cp ${copyDir}/${copyMass}_reweight_card.dat ${cardDir}/${targetDir}/${targetDir}_reweight_card.dat

            if [ -e ${cardDir}/${targetDir}/${targetDir}_proc_card.dat ]; then
                cd ${cardDir}/${targetDir}/
                sed -i  "4s/.*/output "${targetDir}"/g" ${targetDir}_proc_card.dat
                sed -i  "33s/.*/set param_card MY1   "${Med}"/g" ${targetDir}_customizecards.dat
                sed -i  "34s/.*/set param_card MXd   "${DM}"/g" ${targetDir}_customizecards.dat
            fi
            cd ../../

        fi

    done
done
