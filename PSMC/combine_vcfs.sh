## Script to combine vcf files

#!/bin/bash

# make list of single chromosome vcf files
ls *g.vcf.gz > vcf.list

# combine vcfs
bcftools concat -o barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_allchr.g.vcf -f vcf.list