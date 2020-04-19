library("OUTRIDER");
# get data

input.dir <- "FB";
input.file <- paste( input.dir, "combined.tsv", sep="/");
out.dir <- "results";
output.file <- paste( out.dir, "FB-results.tsv", sep="/");
ctsTable <- read.delim(input.file, row.names=c(1), check.names=FALSE);

ods <- OutriderDataSet(countData=ctsTable);
# filter out non expressed genes
ods <- filterExpression(ods, minCounts=TRUE, filterGenes=TRUE);
# run full OUTRIDER pipeline (control, fit model, calculate P-values)
ods <- OUTRIDER(ods);
res <- results(ods);
write.table(res, output.file );



input.dir <- "LCL";
input.file <- paste( input.dir, "combined.tsv", sep="/");
out.dir <- "results";
output.file <- paste( out.dir, "LCL-results.tsv", sep="/");
ctsTable <- read.delim(input.file, row.names=c(1), check.names=FALSE);

ods <- OutriderDataSet(countData=ctsTable);
# filter out non expressed genes
ods <- filterExpression(ods, minCounts=TRUE, filterGenes=TRUE);
# run full OUTRIDER pipeline (control, fit model, calculate P-values)
ods <- OUTRIDER(ods);
res <- results(ods);
write.table(res, output.file );
