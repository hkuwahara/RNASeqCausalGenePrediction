#! /bin/bash

BERYL_HOME=""

#
# normalized scores are assumed to be placed in ./results
#
results_dir=results
case_id=$1

target_list=($(basename -s "_normalized.txt" ${results_dir}/${case_id}*_normalized.txt ))

for target in ${target_list[@]}
do
	input=${results_dir}/${target}_normalized.txt
	filtered=${results_dir}/${target}_filtered.txt
	candidates=${results_dir}/${target}_sig_genes.list

	python ${BERYL_HOME}/Analysis/FilterSpliceJunctions.py -splice_file=${input} -include_normalized -filter_n_reads=5 -normalized_minimum=0.05 -n_samples=8 | awk -v s="${case_id}" 'BEGIN{FS="\t";} ($6 != "Both annotated"){if(index($8, s) > 0){print $0;}}' | awk 'BEGIN{FS=","; OFS="\t"}{$1=$1; print $0;}' | awk 'BEGIN{FS="\t";}{s1=0; s2=0; num=$7; for( i = 8; i < num + 7; i++){if( !($i ~ /SRR/) ) {s1++;} else {s2++;} } if( (s1 < 2 ) && (s2 < 5)){print $0;} }' > ${filtered}
	cut -f2 ${filtered} | sort -u > ${candidates}
done

cat ${results_dir}/${case_id}_chr*_sig_genes.list > ${results_dir}/${case_id}_all_sig_genes.list


