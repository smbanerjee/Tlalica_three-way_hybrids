## Realign reads around indels
## Must be run using indel_realign_loop.sh

#!/bin/bash

BAM="barcode_trimmed_10X_reads_variatus_R1_001_subset.sorted.dedup.bam"

java -jar /home/groups/schumer/shared_bin/GenomeAnalysisTK.jar \
-T IndelRealigner \
-R variatus_scaffolds_combined_unplaced.fasta \
-L XXchrXX \
-I $BAM \
-targetIntervals target_intervals_xvar.list \
-o "$BAM".XXchrXX.realigned.bam
