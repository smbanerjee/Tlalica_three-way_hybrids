## Mapping script to prepare for PSMC analysis
## See Methods section of Banerjee & Powell et al. in press

#!/bin/bash

# index reference genome
bwa index variatus_scaffolds_combined_unplaced.fasta
samtools faidx variatus_scaffolds_combined_unplaced.fasta
java -jar CreateSequenceDictionary.jar R=variatus_scaffolds_combined_unplaced.fasta O=variatus_scaffolds_combined_unplaced.dict

# map reads to reference
bwa mem -t 3 -M -R '@RG\tID:barcode_trimmed_10X_reads_variatus\tSM:quail_libraryprep\tPL:illumina\tLB:barcode_trimmed_10X_reads_variatus\tPU:illuminaHiSeq' variatus_scaffolds_combined_unplaced.fasta barcode_trimmed_10X_reads_variatus_R1_001_subset.fastq.gz barcode_trimmed_10X_reads_variatus_R2_001_subset.fastq.gz > barcode_trimmed_10X_reads_variatus_R1_001_subset.sam

# sort sam and create bam file
java -jar SortSam.jar INPUT=barcode_trimmed_10X_reads_variatus_R1_001_subset.sam OUTPUT=barcode_trimmed_10X_reads_variatus_R1_001_subset.sorted.bam SORT_ORDER=coordinate

# index bam file
java -jar BuildBamIndex.jar INPUT=barcode_trimmed_10X_reads_variatus_R1_001_subset.sorted.bam

# mark duplicates
java -jar MarkDuplicates.jar INPUT=barcode_trimmed_10X_reads_variatus_R1_001_subset.sorted.bam OUTPUT=barcode_trimmed_10X_reads_variatus_R1_001_subset.sorted.dedup.bam METRICS_FILE=barcode_trimmed_10X_reads_variatus_R1_001_subset.sorted.metrics

# index bam file
java -jar BuildBamIndex.jar INPUT=barcode_trimmed_10X_reads_variatus_R1_001_subset.sorted.dedup.bam