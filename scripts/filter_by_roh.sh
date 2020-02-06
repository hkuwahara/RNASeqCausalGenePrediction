#! /bin/bash

INPUT_DIR=$1
OUTPUT_DIR=$2

mkdir -p ${OUTPUT_DIR}

samples=( $(basename -s ".tsv" ${INPUT_DIR}/*.tsv) )

for sample_id in ${samples[@]}; 
do	
	candidate_list=${INPUT_DIR}/${sample_id}.tsv
	filtered_candidates=${OUTPUT_DIR}/${sample_id}.tsv
	roh_file=${ROH_DIR}/${sample_id}.bed
	if [ ! -f ${roh_file} ]; then
		cp ${candidate_list} ${filtered_candidates}
	else 
		awk 'BEGIN{FS="\t"; OFS="\t"; for( i=1; i <= 22; i++) {c["chr" i] = i;} c["chrX"] = "X"; num_roh = 0;} NR==FNR{roh_chr[FNR] = c[$1]; roh_left[FNR] = $2+1; roh_right[FNR] = $3; num_roh++; next;} FNR==1{print $0; next;} {for(i = 1; i <= num_roh; i++){ if( roh_chr[i] == $1 ){ if( !((roh_left[i] > $4) || (roh_right[i] < $3)) ) {print $0;}}}}' ${roh_file} ${candidate_list} > ${filtered_candidates}
	fi
done




