# RNASeqCausalGenePrediction
alpha/beta-based scoring and filtering of candidate genes.

## How to run the main script
To run the scoring and filtering pipeline, cd to the top directory and type in ./run.sh in a linux environment.  
Some of the scripts use parallel (O. Tange (2011): GNU Parallel - The Command-Line Power Tool,;login: The USENIX Magazine, February 2011:42-47.)

## Information about the subdirectories:
* results -- contains the causal gene prediction results after running ./run.sh.
* scripts -- contains scripts to score and filter candidate genes. 
* data -- contains misc data files for scoring and filtering such as the 2nd percentile omega values of the LCL and skin fibroblast samples from GTEx .
* quant_data -- contains 5 omega quantified genes for 5 known cases and 6 unknown cases.
* roh_hg38 -- contains files for positional filtering.  The coordinates are in hg38, which were converted from hg19 using UCSB online LiftOver tool.  
* omega_min -- contains the minimum omega value of each coding gene from the 11 in-house RNA-seq datasets which were generated from RNA samples with RIN > 8.5.

