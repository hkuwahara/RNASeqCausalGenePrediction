#! /bin/bash

TISSUE_TYPES=( "FB" "LCL")

mkdir -p ${SCORE_DIR}

for tissue in ${TISSUE_TYPES[@]};
do	
	gtex_stat=${DATA_DIR}/GTEx_stat_${tissue}.tsv
	awk -v tis="${tissue}" '$2==tis{print $1;}' ${DATA_DIR}/cases.list | parallel ${SCRIPT_DIR}/score_helper.sh ${gtex_stat} {} 
done


