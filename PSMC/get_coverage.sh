## Calculate depth of coverage of reads mapping to reference genome

#!/bin/bash

OUTDIR="coverage_stats"
REF="variatus_scaffolds_combined_unplaced.fasta"

java -jar GenomeAnalysisTK.jar \
-T DepthOfCoverage \
-R $REF \
-I bam.list \
-o $OUTDIR/barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var-coverage.txt \
-omitBaseOutput
