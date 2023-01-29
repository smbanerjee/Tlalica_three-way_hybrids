# Pipeline for locacl ancestry calling with *ancestryinfer*

This is a cleaned pipeline for running local ancestry calling using [ancestryinfer](https://github.com/Schumerlab/ancestryinfer). This analysis is presented in Banerjee & Powell et al. *in press*, where we call local ancestry and report global ancestry proportions of *Xiphophorou* individials along the Rio Calnali. Reference genomes, ancestry informative markers, and parental counts used for these *ancestryinfer* runs can be found in [this Dryad repository](https://doi.org/10.5061/dryad.9kd51c5nd).

## Contents

* **ancestryinfer_3way_config_file.cfg**
	* *Description: Configuration file which defines input files and paramaeters used for our local ancestry runs.*

* **run_hmm.sh**
	* *Description: Script we used to submit our ancestryinfer runs to our computing cluster.*

* **tsv_to_ancestry_and_genotypes.sh**
	* *Description: Script to convert .tsv files generated from *ancestryinfer* runs to global ancestry porportions and then to genotypes at each ancestry informative marker.*

* **global_ancestry_proportion.R**
	* *Description: Script to plot global ancestry proportions by individual for individuals with northern swordtail ancestry at Tlalica and from upstream sites.*

* **local_ancestry_plots.R**
	* *Description: Full mapping pipeline, including reference indexing, mapping reads to reference, creating and sorting bam file, marking duplicates, and indexing bam files.*
	
* **FigS4.R**
	* *Description: Script to plot the proportion of the genome inferred to be derived from X. variatus in individuals phenotypically determined to be X. variatus at the Tlalica site upon collection.*
