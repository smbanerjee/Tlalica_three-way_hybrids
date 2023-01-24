# Designing and testing the three-way mode of *ancestryinfer*

The updated version of *ancestryinfer* which includes a three reference genome mode can be found at https://github.com/Schumerlab/ancestryinfer.git . Simulations acan also be found here. Additional information about designing and testing can be found in the methods section, Supporting information 1, and Appendix1_User_manual_3way_ancestryinfer.pdf from Banerjee & Powell et al. in press. All test datasets were ran with the same input files and paramaters designed in the ../local_ancestry_calling/ancestryinfer_3way_config_file.cfg.

## Plotting Scripts

* **FigS2.R**
	* *Description: Script to plot ancestry porportions determined by three-way ancestryinfer on pure parental species not used in training or filtering datasets.*

* **FigS3.R**
	* *Description: Script to plot results of applying ancestryinfer in the three source population mode to X. birchmanni x X. malinche hybrid populations that are not sympatric with X. variatus.*

* **FigS4.R**
	* *Description: Script to plot the proportion of the genome inferred to be derived from X. variatus in individuals phenotypically determined to be X. variatus at the Tlalica site upon collection.*

* **FigS7.R**
	* *Description: Script to plot the error rates for local ancestry inference in simulations of early generation three way hybrids and of X.mal x X. bir hybrids.*

* **FigS8.R**
	* *Description: Script to plot the error rates for local ancestry inference from simulations using incorect priors for time of initial admixture and incorrect intial admixture proportions.*

* **FigS9.R**
	* *Description: Script to plot the error rates for local ancestry inference from simulations where initial admixture was 25 and 50 generations between the present.*
