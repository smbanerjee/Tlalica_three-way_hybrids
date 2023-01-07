## Script to convert .tsv files generated from *ancestryinfer* runs to global ancestry porportions and then to genotypes at each ancestry informative marker
## See Methods section of Banerjee & Powell et al. in press. 
## perl scripts are part of *ancestryinfer* pipeline

#!/bin/bash

perl /home/groups/schumer/shared_bin/Lab_shared_scripts/parse_3way_tsv_ancestry.pl allchrs.tsv 0.9 > ancestry_proportions.txt

perl /home/groups/schumer/shared_bin/Lab_shared_scripts/parse_3way_tsv_to_genotypes_file.pl allchrs.tsv 0.9 > genotypes.txt