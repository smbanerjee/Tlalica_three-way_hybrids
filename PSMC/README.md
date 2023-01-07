# Pipeline for PSMC analysis

This is a cleaned pipeline for running Pairwise Sequential Markovian Coalescence analysis. This analysis is presented in Banerjee & Powell et al. *in press*, where we compare demographic histories of *Xiphophorus variatus* to *X. malinche* and *X. birchmanni*.

## Contents

* **mapping_for_PSMC.sh**
	* *Description: Full mapping pipeline, including reference indexing, mapping reads to reference, creating and sorting bam file, marking duplicates, and indexing bam files.*

* **target_intervals.sh**
	* *Description: Script conducts a pre-processing step in the GATK pipeline to find intervals that may need realignment.*

* **indel_realign_by_chr.sh**
	* *Description: Script to realigns reads around indels for one chromosome at a time.*

* **indel_realign_loop.sh**
	* *Description: Script to submit jobs to realign reads broken up by chromosome for each chromosome.*

* **haplotype_caller.sh**
	* *Description: Script to call haplotypes and convert to genotypes broken up by chromosome.*

* **haplotype_caller_loop.sh**
	* *Description: Script to submit jobs to call haplotypes and convert to genotypes broken up by chromosome for each chromosome.*

* **combine_vcfs.sh**
	* *Description: Script to combine vcf files generated for each chromosome into one.*

* **get_coverage.sh**
	* *Description: Script to calculate coverage of reads aligned to genome.*

* **insnp_v10_gatk3.4_gvcf.py**
	* *Description: Script to convert vcf files to custom insnp format. This script is called by the following script convert_vfc_to_PSMC_format.sh.*

* **convert_vfc_to_PSMC_format.sh**
	* *Description: Script to convert vcf files to custom insnp format, then to fasta format, then to fastq format, then finally to input format require to run PSMC. This script needs to be adjested based on the results of get_coverage.sh. See comments within script for details*

* **run_psmc.sh**
	* *Description: Script to run psmc*

* **bootstrap_psmc.sh**
	* *Description: Script to run one bootstrap replicate of psmc* 

* **bootstrap_psmc_loop.sh**
	* *Description: Script to run 100 bootsrap replicates of psmc* 

* **PSMC_plot.R**
	* *Description: Script to plot psmc results from this analysis with results for X. birchmanni and X. malinche from Schumer et al. 2018* 
	
* **calc_longterm_Ne.R**
	* *Description: Script to calculate longerm Ne from PSMC results.*
