#!/bin/bash

for Med in 150 195 200 295 300 495 500 745 750 995 1000 1245 1250 1495 1500 1700 1750 1995 2000 2245 2250 2495 2500 2995 3000
do
    for DM in 50 100 150 250 300 325 500 625 700 750 800 1000 1125 1250 1500 2000
    do
        cardDir=MonotopCards_13p6
        copyDir=mtop_cards
        copyMass=Vector_MonoTop_NLO_Mphi-2500_Mchi-750_gSM-0p25_gDM-1p0_13TeV-madgraph
        targetDir=Vector_MonoTop_NLO_Mphi-${Med}_Mchi-${DM}_gSM-0p25_gDM-1p0_13TeV-madgraph
        newDir=Vector_MonoTop_NLO_Mphi-${Med}_Mchi-${DM}_gSM-0p25_gDM-1p0_13p6TeV-madgraph

        if [ -e MonotopCards/${targetDir} ]; then
            echo "copy cards from = ${copyDir}"
            echo "target directory = ${cardDir}/${targetDir}"

            mkdir -p ${cardDir}/${newDir}
            cp ${copyDir}/${copyMass}_run_card.dat ${cardDir}/${newDir}/${newDir}_run_card.dat
            cp ${copyDir}/${copyMass}_proc_card.dat ${cardDir}/${newDir}/${newDir}_proc_card.dat
            cp ${copyDir}/${copyMass}_customizecards.dat ${cardDir}/${newDir}/${newDir}_customizecards.dat
            cp ${copyDir}/${copyMass}_extramodels.dat ${cardDir}/${newDir}/${newDir}_extramodels.dat
            cp ${copyDir}/${copyMass}_madspin_card.dat ${cardDir}/${newDir}/${newDir}_madspin_card.dat
            #cp ${copyDir}/${copyMass}_reweight_card.dat ${cardDir}/${newDir}/${newDir}_reweight_card.dat
            cp ${copyDir}/${copyMass}_reweight_card_full.dat ${cardDir}/${newDir}/${newDir}_reweight_card.dat

            if [ -e ${cardDir}/${newDir}/${newDir}_proc_card.dat ]; then
                cd ${cardDir}/${newDir}/
                sed -i  "4s/.*/output "${newDir}"/g" ${newDir}_proc_card.dat
                sed -i  "33s/.*/set param_card MY1   "${Med}"/g" ${newDir}_customizecards.dat
                sed -i  "34s/.*/set param_card MXd   "${DM}"/g" ${newDir}_customizecards.dat
            fi
            cd ../../

        fi

    done
done
