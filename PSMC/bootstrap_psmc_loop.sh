## Script to run 100 bootsrap replicates of psmc

#!/bin/bash

# randomly subset inout file to increase computational speed
/psmc/utils/splitfa barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_majorchr.psmcfa 5000 > barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_majorchr_split.psmcfa

for i in {1..100}; do
    echo $i
    sed "s/XXrepXX/$i/g" bootstrap_psmc.sh | sbatch
done