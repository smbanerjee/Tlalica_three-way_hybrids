## Script to plot psmc results from this analysis with results for X. birchmanni and X. malinche from Schumer et al. 2018
## See Fig.1B of Banerjee & Powell et al. in press

library(tidyverse)
library(cowplot)
library(scales)

# formatting main psmc results for X. variatus
xvar_main <- read_delim(file = "barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_combined.0.txt", delim = "\t", col_names = F) 
colnames(xvar_main) = c("YBP", "Ne_e4", "I", "Dont", "Know")
xvar_main <- xvar_main %>% mutate(Species = "variatus", Population = "Coacuilco")

# formatting main psmc results for X. birchmanni
xbir_main <- read_delim(file="xmal_xcorHUIC_xbirCOAC_fullData_PSMC.txt", delim = "\t")
xbir_main <- subset(xbir_main, xbir_main$indNum == "10F")
xbir_main <- xbir_main[,-8]
colnames(xbir_main) = c("YBP", "Ne_e4", "I", "Dont", "Know", "Species", "Population")

# formatting main psmc results for X. malinche 
xmal_main <- read_delim(file="xmal_xcorHUIC_xbirCOAC_fullData_PSMC.txt", delim = "\t")
xmal_main <- subset(xmal_main, xmal_main$species == "xmal")
xmal_main <- xmal_main[,-8]
colnames(xmal_main) = c("YBP", "Ne_e4", "I", "Dont", "Know", "Species", "Population")

# formatting bootstrap psmc results for X. variatus
xvar_boot <- lapply(1:100, FUN=function(num) {
  out <- read_delim(file = paste("barcode_trimmed_10X_reads_variatus_R1_001_subset_mapped_var_combined.",num,".txt", sep = ""), 
                    col_names = c("YBP", "Ne_e4", "I", "Dont", "Know"), delim = "\t") %>%
    mutate(Species = "variatus", Population = "Coacuilco", rep = as.character(num))
  out
}) %>%
  bind_rows()

# formatting bootstrap psmc results for X. birchmanni
xbir_boot <- read_delim(file="xmal_xcorHUIC_xbirCOAC_fullData_PSMC.txt", delim = "\t")
xbir_boot <- subset(xbir_boot, xbir_boot$species == "xbir")
xbir_boot <- subset(xbir_boot, xbir_boot$indNum != "10F")
xbir_boot$rep <- as.numeric(as.factor(xbir_boot$indNum))
xbir_boot <- xbir_boot[,-8]
colnames(xbir_boot) = c("YBP", "Ne_e4", "I", "Dont", "Know", "Species", "Population", "rep")

# formatting bootstrap psmc results for X. birchmanni
xmal_boot <- read_delim(file ="/Users/shreyabanerjee/Documents/PSMC_CAPS/xmalCHIC_boostrapData.txt", delim ="\t")

# combine main results into one file
psmc_samps <- rbind(xvar_main, xbir_main, xmal_main)
write.csv(psmc_samps, "xvar_xbir_xmal_psmc_results.csv")

# combine bootstrap results into one file
boot_samps <- rbind(xvar_boot, xbir_boot, xmal_boot)
write.csv(boot_samps, "xvar_xbir_xmal_psmc_bootstrap.csv")

# set colors for plotting
psmc_colors <- c("xbir" = rgb(58/255,107/255,198/255), "variatus" = "goldenrod1","xmal" = rgb(156/255,8/255,23/255))

# filter results to only include conservative estimates
conservative_psmc <- filter(psmc_samps, YBP > 2000, YBP < 100000) 
conservative_boot <- filter(boot_samps, YBP > 2000, YBP < 100000)

# plot results
final_psmc <- ggplot(conservative_psmc, aes(x = YBP, y = Ne_e4, group = Species, color = Species)) +
  theme_cowplot() +
  theme(panel.border = element_rect(colour = "black"),
        axis.line = element_blank(),
        legend.position = c(0.1, 0.75)) +
  xlab("Years Before Present") +
  ylab(expression(paste("Effective Population Size (×",10^4,")"))) +
  annotation_logticks(sides = "b") +
  scale_color_manual(values = psmc_colors) +
  scale_y_continuous(breaks = seq(1,25), 
                     labels = c(rep("",4),"5",rep("",4),"10",rep("",4),"15",rep("",4),"20",rep("",4),"25")) +
  geom_step(data = conservative_boot, aes(group = interaction(rep,Species)), alpha = 0.1, size=1.75) +
  geom_step(size = 3) +
  ylim(0, 15) +
  xlim(0, 98145.6) +
  scale_x_log10(labels=trans_format('log10',math_format(10^.x)), breaks = c(10000, 100000)) +
  theme(axis.text.y = element_text(size = 75)) +
  theme(axis.text.x = element_text(size = 75)) +
  theme(axis.ticks=element_line(size=2)) +
  theme(axis.title=element_text(size=75)) 




