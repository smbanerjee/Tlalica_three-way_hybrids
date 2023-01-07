## Script to run a single bootstrap replicate
## must be submitted using bootstrap_psmc_loop.sh

#!/bin/bash

/psmc/psmc -p "4+25*2+4+6" -b -o barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_majorchr_boot_XXrepXX.psmc barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_majorchr_split.psmcfa