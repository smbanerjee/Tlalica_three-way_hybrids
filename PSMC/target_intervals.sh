## Script to prepare bam files for realignment of reads around indels via the GATK pipeline

#!/bin/bash

BAM="barcode_trimmed_10X_reads_variatus_R1_001_subset.sorted.dedup.bam"
REF="variatus_scaffolds_combined_unplaced.fasta"

java -jar GenomeAnalysisTK.jar \
-T RealignerTargetCreator \
-R $REF \
-I $BAM \
-o target_intervals_xvar.list
