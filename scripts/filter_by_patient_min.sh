#! /bin/bash


INPUT_DIR=$1
OUTPUT_DIR=$2

mkdir -p ${OUTPUT_DIR}
samples=( $(basename -s ".tsv" ${INPUT_DIR}/*.tsv) )

for sample_id in ${samples[@]}; 
do	
	tissue=$(grep ${sample_id} ${DATA_DIR}/cases.list | cut -f2)
	awk 'BEGIN{FS="\t"; OFS="\t";}NR==1{next;} NR==FNR{a[$5] = $7; next;} FNR==1{print $0; next;} ($7 <= a[$5]){print $0;}' ${OMEGA_MIN_DIR}/${tissue}.tsv ${INPUT_DIR}/${sample_id}.tsv > ${OUTPUT_DIR}/${sample_id}.tsv   	
done

