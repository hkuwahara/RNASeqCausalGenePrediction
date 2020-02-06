#! /bin/bash

INPUT_DIR=$1
OUTPUT_DIR=$2

mkdir -p ${OUTPUT_DIR}

#
# 0.477 = log10(3)
#
threshold="0.477"
samples=( $(basename -s ".tsv" ${INPUT_DIR}/*.tsv) )

for sample_id in ${samples[@]}; 
do	
	awk -v th="${threshold}" 'BEGIN{FS="\t"; OFS="\t";}NR==1{print $0; next;} (($9 >= th) || ($10 >= th)){print $0;}' ${INPUT_DIR}/${sample_id}.tsv > ${OUTPUT_DIR}/${sample_id}.tsv    
done




