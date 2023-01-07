## Script to convert vcf to fasta to fastq to PSMC input format
## Script requires adjustment based on the results from the get_coverage.sh script (see below for specific instructions)

#!/bin/bash

# convert vcf to cutom insnp format
# the third and fourth numbers listed in the script need to be adjusted based on the rsults in the *_summary file generated from the get_coverage.sh
# the mean value in *_summary from the get_coverage.sh script represents 1x coverage
# the third number in the line below should represent 0.5x coverage (so 23 for Banerjee & Powell et al's analyis)
# the fourth number in the line below should represent 2x coverage (so 83 for Banerjee & Powell et al's analyis)
python insnp_v10_gatk3.4_gvcf.py barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_allchr.g.vcf  barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_allchr.g.vcf.insnp 20 20 21 83 40 10 10 4 -12.5 -8.0 5

# convert insnp to fasta format
seqtk mutfa variatus_scaffolds_combined_unplaced.fasta barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_allchr.g.vcf.insnp > barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_allchr.fasta

#convert fasta format to fastq format
# fasta_to_fastq.pl can be found at https://github.com/Schumerlab/Lab_shared_scripts
perl fasta_to_fastq.pl barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_allchr.fasta > barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_allchr.fastq

#make list of chromosomes
grep "chr" variatus_scaffolds_combined_unplaced.fasta | cut -d ">" -f 2 > var.chrom.list

# trim fastq file to only include major reads mapped to a major chromosome
seqtk subseq barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_allchr.fastq var.chrom.list > barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_majorchr.fastq

# convert fastq file to PSMC's required input format
/psmc/utils/fq2psmcfa -q20 barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_majorchr.fastq > barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_majorchr.psmcfa