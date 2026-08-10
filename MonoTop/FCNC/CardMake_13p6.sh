#!/bin/bash

# mass file
massfile="masses_260810_v1.txt"


# Directories
cardDir=MonotopCards_13p6_0810
copyCardDir=mtop_cards
copyModelDir=MonotopModels
copyMassCards=Vector_MonoTop_NLO_Mphi-2500_Mchi-750_gSM-0p25_gDM-1p0_13TeV-madgraph
copyMassModel=DMsimp_s_spin1_monotop_2500_750_800

while read Med DM; do
    [[ -z "$Med" || -z "$DM" ]] && continue
    [[ "$Med" =~ ^# ]] && continue

    #targetDir=Vector_MonoTop_NLO_Mphi-${Med}_Mchi-${DM}_gSM-0p25_gDM-1p0_13TeV-madgraph
    newDir=Vector_MonoTop_NLO_Mphi-${Med}_Mchi-${DM}_gSM-0p25_gDM-1p0_13p6TeV-madgraph

        echo "===> [${Med}, ${DM}]"

        mkdir -p ${cardDir}/${newDir}
        cp ${copyCardDir}/${copyMassCards}_run_card.dat        ${cardDir}/${newDir}/${newDir}_run_card.dat
        cp ${copyCardDir}/${copyMassCards}_proc_card.dat       ${cardDir}/${newDir}/${newDir}_proc_card.dat
        cp ${copyCardDir}/${copyMassCards}_customizecards.dat  ${cardDir}/${newDir}/${newDir}_customizecards.dat
        cp ${copyCardDir}/${copyMassCards}_extramodels.dat     ${cardDir}/${newDir}/${newDir}_extramodels.dat
        cp ${copyCardDir}/${copyMassCards}_madspin_card.dat    ${cardDir}/${newDir}/${newDir}_madspin_card.dat
        cp ${copyCardDir}/${copyMassCards}_reweight_card_full.dat ${cardDir}/${newDir}/${newDir}_reweight_card.dat

        if [ -e ${cardDir}/${newDir}/${newDir}_proc_card.dat ]; then
            cd ${cardDir}/${newDir}/
            sed -i "4s|.*|output ${newDir}|" ${newDir}_proc_card.dat
            sed -i "33s|.*|set param_card MY1   ${Med}|" ${newDir}_customizecards.dat
            sed -i "34s|.*|set param_card MXd   ${DM}|" ${newDir}_customizecards.dat
        fi
        cd ../../

        cp -r ${copyModelDir}/${copyMassModel} ${cardDir}/${newDir}/DMsimp_s_spin1_monotop_${Med}_${DM}_800

        if [ -e ${cardDir}/${newDir}/DMsimp_s_spin1_monotop_${Med}_${DM}_800/parameters.py ]; then
            cd ${cardDir}/${newDir}/DMsimp_s_spin1_monotop_${Med}_${DM}_800
            sed -i "288s/750.0/${DM}/" parameters.py
            sed -i "296s/2500/${Med}/" parameters.py
            cd ..
            tar -zcf DMsimp_s_spin1_monotop_${Med}_${DM}_800.tgz DMsimp_s_spin1_monotop_${Med}_${DM}_800
            rm -r DMsimp_s_spin1_monotop_${Med}_${DM}_800/
        fi
        cd ../../
        pwd


done < "$massfile"

