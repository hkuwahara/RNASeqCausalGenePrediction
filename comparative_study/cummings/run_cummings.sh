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

	python ${BERYL_HOME}/Analysis/FilterSpliceJunctions.py -splice_file=${input} -include_normalized -filter_n_reads=2 -normalized_minimum=0.05 -times_last=2.0 -sample_with_highest_normalized_read_support=SUB_${case_id} | awk 'BEGIN{FS="\t";} ($6 == "Both annotated") || ($6 == "One annotated"){print $0;}'  > ${filtered}
	cut -f2 ${filtered} | sort -u > ${candidates}
done

cat ${results_dir}/${case_id}_chr*_sig_genes.list > ${results_dir}/${case_id}_all_sig_genes.list


