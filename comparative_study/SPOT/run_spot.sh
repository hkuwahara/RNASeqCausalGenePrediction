#! /bin/bash -l

spot_dir=""
prefix_name=""

junc_data_dir=junc_data
results_dir=results
mkdir -p ${results_dir}

juncfile_orig=${junc_data_dir}/${prefix_name}_perind_numers.counts.gz
juncfile=${junc_data_dir}/${prefix_name}_spot_input.counts
zcat ${juncfile_orig} | awk 'NR==1{print "CLUSTER", $0; next;} {print $0;}' >  ${juncfile}
python spot.py --juncfile ${juncfile} --outprefix ${results_dir}/${prefix_name}



