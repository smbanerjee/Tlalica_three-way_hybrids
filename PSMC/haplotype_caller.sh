## Script to cal, haplotypes and convert to genotypes broken up by chromosome
## Must be run using haplotype_caller_loop.sh

#!/bin/bash

REF="variatus_scaffolds_combined_unplaced.fasta"

java -jar GenomeAnalysisTK.jar \
-T HaplotypeCaller \
-R $REF \
-I barcode_trimmed_10X_reads_variatus_R1_001_subset.sorted.dedup.bam.XXchrXX.realigned.bam \
--genotyping_mode DISCOVERY \
-L XXchrXX \
-stand_emit_conf 10 \
-stand_call_conf 30 \
-ERC GVCF \
-o barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_XXchrXX.rawvariants.g.vcf.gz

java -jar GenomeAnalysisTK.jar \
-T GenotypeGVCFs \
-R $REF \
--variant barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_XXchrXX.rawvariants.g.vcf.gz \
--sample_ploidy 2 \
--max_alternate_alleles 4 \
--includeNonVariantSites \
--standard_min_confidence_threshold_for_calling 30 \
-o barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_XXchrXX.g.vcf.gz
