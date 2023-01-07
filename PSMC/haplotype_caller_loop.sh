## Script to submit one job per chromosome to call haplotypes and genotypes

#!/bin/bash

# make list of chromosomes
grep "chr" variatus_scaffolds_combined_unplaced.fasta | cut -d ">" -f 2 > var.chrom.list

# submit jobs
for line in $(cat var.chrom.list); do
    echo $line
    sed "s/XXchrXX/$line/g" HaplotypeCaller.sh | sbatch
done