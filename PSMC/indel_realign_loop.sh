## Submit jobs to realing reads around indels for each chromosome

#!/bin/bash

#make list of chromosomes
grep "chr" variatus_scaffolds_combined_unplaced.fasta | cut -d ">" -f 2 > var.chrom.list

#submit a jobs to realign around indels for each chromosome
for line in $(cat var.chrom.list); do
    echo $line
    sed "s/XXchrXX/$line/g" indel-realign-by-chr.sh | sbatch
done