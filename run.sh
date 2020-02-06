#! /bin/bash

ANALYSIS_HOME=${PWD}
SCRIPT_DIR=${ANALYSIS_HOME}/scripts
DATA_DIR=${ANALYSIS_HOME}/data
QUANT_DIR=${ANALYSIS_HOME}/quant_data
SCORE_DIR=${ANALYSIS_HOME}/score_data
ROH_DIR=${ANALYSIS_HOME}/roh_hg38
OMEGA_MIN_DIR=${ANALYSIS_HOME}/omega_min

RESULTS_DIR=${ANALYSIS_HOME}/results

export SCRIPT_DIR DATA_DIR QUANT_DIR SCORE_DIR ROH_DIR OMEGA_MIN_DIR

${SCRIPT_DIR}/score.sh
ROH_FILTERED=$(mktemp -d --tmpdir=${ANALYSIS_HOME} tmp_filtered_XXXX)
SCORE_FILTERED=$(mktemp -d --tmpdir=${ANALYSIS_HOME} tmp_filtered_XXXX)

${SCRIPT_DIR}/filter_by_roh.sh ${SCORE_DIR} ${ROH_FILTERED}  
${SCRIPT_DIR}/filter_by_score.sh ${ROH_FILTERED} ${SCORE_FILTERED}  
${SCRIPT_DIR}/filter_by_patient_min.sh ${SCORE_FILTERED} ${RESULTS_DIR}  

rm -rf ${ANALYSIS_HOME}/tmp_filtered*
