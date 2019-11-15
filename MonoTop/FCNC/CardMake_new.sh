#!/bin/bash
#
#for Med in 195 200 295 300 495 500 995 1000 1995 2000 2495 2500 2995 3000
#do
#    for DM in 100 150 250 500 750 1000 1250 1500
#    do
#        modelName=DMsimp_s_spin1_monotop_${Med}_${DM}_800
#        targetDir=Vector_MonoTop_NLO_Mphi-${Med}_Mchi-${DM}_gSM-0p25_gDM-1p0_13TeV-madgraph
#
#        if [ -e MonotopModels/${modelName} ]; then
#            echo ${modelName}
#            mkdir -p MadGraph5Cards_v2/${targetDir}
#            cp monot_cards/monotop_300_1000_800_run_card.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_run_card.dat
#            cp monot_cards/monotop_300_1000_800_proc_card.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_proc_card.dat
#            cp monot_cards/monotop_300_1000_800_customizecards.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_customizecards.dat
#            cp monot_cards/monotop_300_1000_800_extramodels.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_extramodels.dat
#            cp monot_cards/monotop_300_1000_800_madspin_card.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_madspin_card.dat
#            # echo "cp monot_cards/monotop_300_1000_800_run_card.dat MadGraph5Cards_v2/${modelName}_run_card.dat"
#            if [ -e MadGraph5Cards_v2/${targetDir}/${targetDir}_proc_card.dat ]; then
#                echo Hi
#                cd MadGraph5Cards_v2/${targetDir}/
#                echo Hello
#                sed -i "1s/.*/import "${modelName}"/g" ${targetDir}_proc_card.dat
#                sed -i "4s/.*/output "${targetDir}"/g" ${targetDir}_proc_card.dat
#                sed -i "16s/.*/set param_card mass 55   "${Med}"/g" ${targetDir}_customizecards.dat
#                sed -i "17s/.*/set param_card mass 18   "${DM}"/g" ${targetDir}_customizecards.dat
#                if [ -e ${targetDir}_extramodels.dat ]; then
#                    rm ${targetDir}_extramodels.dat
#                    echo ${modelName}.tgz >> ${targetDir}_extramodels.dat
#                else
#                    echo ${modelName}.tgz >> ${targetDir}_extramodels.dat
#                fi
#                cd ../../
#                cd MonotopModels/
#                tar -zcf ${modelName}.tgz ${modelName}
#                mv ${modelName}.tgz ../MadGraph5Cards_v2/${targetDir}/
#                cd ../
#            fi
#        fi
#
#    done
#done


Med=195
DM=100

modelName=DMsimp_s_spin1_monotop_${Med}_${DM}_800
targetDir=Vector_MonoTop_NLO_Mphi-${Med}_Mchi-${DM}_gSM-0p25_gDM-1p0_13TeV-madgraph

#   if [ -e MonotopModels/${modelName} ]; then
echo ${modelName}
mkdir -p MadGraph5Cards_v2/${targetDir}
cp monot_cards/monotop_300_1000_800_run_card.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_run_card.dat
cp monot_cards/monotop_300_1000_800_proc_card.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_proc_card.dat
cp monot_cards/monotop_300_1000_800_customizecards.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_customizecards.dat
cp monot_cards/monotop_300_1000_800_extramodels.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_extramodels.dat
cp monot_cards/monotop_300_1000_800_madspin_card.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_madspin_card.dat
# echo "cp monot_cards/monotop_300_1000_800_run_card.dat MadGraph5Cards_v2/${modelName}_run_card.dat"
if [ -e MadGraph5Cards_v2/${targetDir}/${targetDir}_proc_card.dat ]; then
    echo Hi
    cd MadGraph5Cards_v2/${targetDir}/
    echo Hello
    sed -i "1s/.*/import "${modelName}"/g" ${targetDir}_proc_card.dat
    sed -i "4s/.*/output "${targetDir}"/g" ${targetDir}_proc_card.dat
    sed -i "16s/.*/set param_card mass 55   "${Med}"/g" ${targetDir}_customizecards.dat
    sed -i "17s/.*/set param_card mass 18   "${DM}"/g" ${targetDir}_customizecards.dat
    if [ -e ${targetDir}_extramodels.dat ]; then
        rm ${targetDir}_extramodels.dat
        echo ${modelName}.tgz >> ${targetDir}_extramodels.dat
    else
        echo ${modelName}.tgz >> ${targetDir}_extramodels.dat
    fi
    #sed -i "1s/.*/Vector_MonoTop_NLO_Mphi-"${Med}"_Mchi-"${DM}"_gSM-0p25_gDM-1p0_13TeV-madgraph_tarball.tar.xz" ${targetDir}_extramodels.dat
    cd ../../
    cd MonotopModels/
    echo ${modelName}

    pwd
    tar -zcf ${modelName}.tgz ${modelName}
    mv ${modelName}.tgz ../MadGraph5Cards_v2/${targetDir}/
    cd ../
fi
      # fi
#        modelName=DMsimp_s_spin1_monotop_${Med}_${DM}_800
#        targetDir=Vector_MonoTop_NLO_Mphi-${Med}_Mchi-${DM}_gSM-0p25_gDM-1p0_13TeV-madgraph
#
#        if [ -e MonotopModels/${modelName} ]; then
#            echo ${modelName}
#            mkdir -p MadGraph5Cards_v2/${targetDir}
#            cp monot_cards/monotop_300_1000_800_run_card.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_run_card.dat
#            cp monot_cards/monotop_300_1000_800_proc_card.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_proc_card.dat
#            cp monot_cards/monotop_300_1000_800_customizecards.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_customizecards.dat
#            cp monot_cards/monotop_300_1000_800_extramodels.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_extramodels.dat
#            cp monot_cards/monotop_300_1000_800_madspin_card.dat MadGraph5Cards_v2/${targetDir}/${targetDir}_madspin_card.dat
#          # echo "cp monot_cards/monotop_300_1000_800_run_card.dat MadGraph5Cards_v2/${modelName}_run_card.dat"
#           if [ -e MonotopModels/${targetDir}/${targetDir}_proc_card.dat ]; then
#               cd MadGraph5Cards_v2/${targetDir}
#               sed -i "1s/.*/import model "${modelName}" --modelname/g" ${targetDir}_proc_card.dat
#               sed -i "4s/.*/output "${targetDir}"/g" ${targetDir}_proc_card.dat
#               sed -i "16s/.*/set param_card mass 55   "${Med}"/g" ${targetDir}_customizecards.dat
#               sed -i "17s/.*/set param_card mass 18   "${DM}"/g" ${targetDir}_customizecards.dat
#               sed -i "1s/.*/Vector_MonoTop_NLO_Mphi-"${Med}"_Mchi-"${DM}"_gSM-0p25_gDM-1p0_13TeV-madgraph_tarball.tar.xz" ${targetDir}_extramodels.dat
#               cd ../../
#           fi
#       fi
