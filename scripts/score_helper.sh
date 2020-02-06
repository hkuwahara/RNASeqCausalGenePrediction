#! /bin/bash

GTEX_STAT=$1
SUBJECT=$2

awk 'function log10(x){ return log(x)/log(10); } BEGIN{FS="\t"; OFS="\t"; epsilon=1e-2;} NR==1{next;} NR==FNR{omega_a[$3] = $5+epsilon; rate_a[$3] = $6+epsilon; next;} FNR==1{print "chr", "strand", "start", "end", "gene_id", "gene_symbol", "omega", "rate", "log10(alpha)", "log10(beta)"; next;} ($7 >= 1e-15){alpha=log10(omega_a[$5]/($7+epsilon)); beta=log10(rate_a[$5]/($8+epsilon)); print $0, alpha, beta;}' ${GTEX_STAT} ${QUANT_DIR}/${SUBJECT}.tsv > ${SCORE_DIR}/${SUBJECT}.tsv



