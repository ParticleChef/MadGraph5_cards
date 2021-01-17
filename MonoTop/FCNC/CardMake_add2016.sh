#!/bin/bash

for Med in 750 1250 1495 1500 1750 2000
do
    for DM in 150 750 1000
    do
        cardDir=MadGraph5Cards_add2016
        copyDir=MadGraph5Cards_2016/Vector_MonoTop_NLO_Mphi-2000_Mchi-1500_gSM-0p25_gDM-1p0_13TeV-madgraph
        copyMass=Vector_MonoTop_NLO_Mphi-2000_Mchi-1500_gSM-0p25_gDM-1p0_13TeV-madgraph
        modelName=DMsimp_s_spin1_monotop_${Med}_${DM}_800
        targetDir=Vector_MonoTop_NLO_Mphi-${Med}_Mchi-${DM}_gSM-0p25_gDM-1p0_13TeV-madgraph
        echo "copy cards from = ${copyDir}"
        echo "copy model from = ${modelName}"
        echo "target directory = ${cardDir}/${targetDir}"

        if [ -e MonotopModels_add/${modelName} ]; then
            echo ${modelName}
            mkdir -p ${cardDir}/${targetDir}
            cp ${copyDir}/${copyMass}_run_card.dat ${cardDir}/${targetDir}/${targetDir}_run_card.dat
            cp ${copyDir}/${copyMass}_proc_card.dat ${cardDir}/${targetDir}/${targetDir}_proc_card.dat
            cp ${copyDir}/${copyMass}_customizecards.dat ${cardDir}/${targetDir}/${targetDir}_customizecards.dat
            cp ${copyDir}/${copyMass}_extramodels.dat ${cardDir}/${targetDir}/${targetDir}_extramodels.dat
            cp ${copyDir}/${copyMass}_madspin_card.dat ${cardDir}/${targetDir}/${targetDir}_madspin_card.dat
            # echo "cp monot_cards/monotop_300_1000_800_run_card.dat MadGraph5Cards_add/${modelName}_run_card.dat"
            if [ -e ${cardDir}/${targetDir}/${targetDir}_proc_card.dat ]; then
                cd ${cardDir}/${targetDir}/
                echo Hello
                sed -i "" "1s/.*/import "${modelName}"/g" ${targetDir}_proc_card.dat
                sed -i "" "4s/.*/output "${targetDir}"/g" ${targetDir}_proc_card.dat
                sed -i "" "16s/.*/set param_card mass 55   "${Med}"/g" ${targetDir}_customizecards.dat
                sed -i "" "17s/.*/set param_card mass 18   "${DM}"/g" ${targetDir}_customizecards.dat
                if [ -e ${targetDir}_extramodels.dat ]; then
                    rm ${targetDir}_extramodels.dat
                    echo ${modelName}.tgz >> ${targetDir}_extramodels.dat
                else
                    echo ${modelName}.tgz >> ${targetDir}_extramodels.dat
                fi
                cd ../../
                cd MonotopModels_add/
                tar -zcf ${modelName}.tgz ${modelName}
                mv ${modelName}.tgz ../${cardDir}/${targetDir}/
                cd ../
            fi
        fi

    done
done


#Med=1500
#DM=150
#
#modelName=DMsimp_s_spin1_monotop_${Med}_${DM}_800
#targetDir=Vector_MonoTop_NLO_Mphi-${Med}_Mchi-${DM}_gSM-0p25_gDM-1p0_13TeV-madgraph
#
##   if [ -e MonotopModels/${modelName} ]; then
#echo ${modelName}
#mkdir -p MadGraph5Cards_add/${targetDir}
#cp monot_cards/monotop_300_1000_800_run_card.dat MadGraph5Cards_add/${targetDir}/${targetDir}_run_card.dat
#cp monot_cards/monotop_300_1000_800_proc_card.dat MadGraph5Cards_add/${targetDir}/${targetDir}_proc_card.dat
#cp monot_cards/monotop_300_1000_800_customizecards.dat MadGraph5Cards_add/${targetDir}/${targetDir}_customizecards.dat
#cp monot_cards/monotop_300_1000_800_extramodels.dat MadGraph5Cards_add/${targetDir}/${targetDir}_extramodels.dat
#cp monot_cards/monotop_300_1000_800_madspin_card.dat MadGraph5Cards_add/${targetDir}/${targetDir}_madspin_card.dat
## echo "cp monot_cards/monotop_300_1000_800_run_card.dat MadGraph5Cards_add/${modelName}_run_card.dat"
#if [ -e MadGraph5Cards_add/${targetDir}/${targetDir}_proc_card.dat ]; then
#    echo Hi
#    cd MadGraph5Cards_add/${targetDir}/
#    echo Hello
#    sed -i "1s/.*/import "${modelName}"/g" ${targetDir}_proc_card.dat
#    sed -i "4s/.*/output "${targetDir}"/g" ${targetDir}_proc_card.dat
#    sed -i "16s/.*/set param_card mass 55   "${Med}"/g" ${targetDir}_customizecards.dat
#    sed -i "17s/.*/set param_card mass 18   "${DM}"/g" ${targetDir}_customizecards.dat
#    if [ -e ${targetDir}_extramodels.dat ]; then
#        rm ${targetDir}_extramodels.dat
#        echo ${modelName}.tgz >> ${targetDir}_extramodels.dat
#    else
#        echo ${modelName}.tgz >> ${targetDir}_extramodels.dat
#    fi
#    #sed -i "1s/.*/Vector_MonoTop_NLO_Mphi-"${Med}"_Mchi-"${DM}"_gSM-0p25_gDM-1p0_13TeV-madgraph_tarball.tar.xz" ${targetDir}_extramodels.dat
#    cd ../../
#    cd MonotopModels/
#    echo ${modelName}
#
#    pwd
#    tar -zcf ${modelName}.tgz ${modelName}
#    mv ${modelName}.tgz ../MadGraph5Cards_add/${targetDir}/
#    cd ../
#fi
      # fi
#        modelName=DMsimp_s_spin1_monotop_${Med}_${DM}_800
#        targetDir=Vector_MonoTop_NLO_Mphi-${Med}_Mchi-${DM}_gSM-0p25_gDM-1p0_13TeV-madgraph
#
#        if [ -e MonotopModels/${modelName} ]; then
#            echo ${modelName}
#            mkdir -p MadGraph5Cards_add/${targetDir}
#            cp monot_cards/monotop_300_1000_800_run_card.dat MadGraph5Cards_add/${targetDir}/${targetDir}_run_card.dat
#            cp monot_cards/monotop_300_1000_800_proc_card.dat MadGraph5Cards_add/${targetDir}/${targetDir}_proc_card.dat
#            cp monot_cards/monotop_300_1000_800_customizecards.dat MadGraph5Cards_add/${targetDir}/${targetDir}_customizecards.dat
#            cp monot_cards/monotop_300_1000_800_extramodels.dat MadGraph5Cards_add/${targetDir}/${targetDir}_extramodels.dat
#            cp monot_cards/monotop_300_1000_800_madspin_card.dat MadGraph5Cards_add/${targetDir}/${targetDir}_madspin_card.dat
#          # echo "cp monot_cards/monotop_300_1000_800_run_card.dat MadGraph5Cards_add/${modelName}_run_card.dat"
#           if [ -e MonotopModels/${targetDir}/${targetDir}_proc_card.dat ]; then
#               cd MadGraph5Cards_add/${targetDir}
#               sed -i "1s/.*/import model "${modelName}" --modelname/g" ${targetDir}_proc_card.dat
#               sed -i "4s/.*/output "${targetDir}"/g" ${targetDir}_proc_card.dat
#               sed -i "16s/.*/set param_card mass 55   "${Med}"/g" ${targetDir}_customizecards.dat
#               sed -i "17s/.*/set param_card mass 18   "${DM}"/g" ${targetDir}_customizecards.dat
#               sed -i "1s/.*/Vector_MonoTop_NLO_Mphi-"${Med}"_Mchi-"${DM}"_gSM-0p25_gDM-1p0_13TeV-madgraph_tarball.tar.xz" ${targetDir}_extramodels.dat
#               cd ../../
#           fi
#       fi
