## Script to calculate long term Ne
## See Results of Banerjee & Powell et al. in press

library(tidyverse)
library(cowplot)
library(scales)

psmc_intervals <- read.csv(file = "xvar_xbir_xmal_psmc_results.csv",header = T) %>%
  group_by(Species, Population) %>%
  mutate(length = lead(YBP) - YBP) %>%
  drop_na()

psmc_intervals <- psmc_intervals[,-1]

harmeanic <- psmc_intervals %>%
  summarise(harmonic_mean = (sum(length * (Ne_e4)^-1)/sum(length))^-1)

trunc_intervals <- filter(psmc_intervals, YBP > 2000, YBP < 100000)

trunc_harmeanic <- trunc_intervals %>%
  summarise(harmonic_mean = (sum(length * (Ne_e4)^-1)/sum(length))^-1)