## Script to submit ancestryinfer runs to computing cluster
## See Methods section of Banerjee & Powell et al. in press

#!/bin/bash

module load python/3.9
module load boost/1.76.0
module load armadillo
module load biology
module load samtools
module load bcftools
module load bwa
module load gcc/10.1.0
module load gsl
module load R
module load java

export PATH="/home/groups/schumer/shared_bin/Ancestry_HMM/src:$PATH"
export PATH="/home/groups/schumer/shared_bin:$PATH"

perl /home/groups/schumer/shared_bin/ancestryinfer_July2022/Ancestry_HMM_parallel_v7.pl hmm_configuration_file.cfg