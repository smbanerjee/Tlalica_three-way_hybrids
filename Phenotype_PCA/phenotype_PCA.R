# PCA of male Phenotypes
# see Fig 2A and Table S4 of Banerjee & Powell et al. in press

## data wrangling 
require(dplyr)
pheno <- read.csv("/path/to/xvar_xmal_xbir_phenotyes.csv")
pheno[pheno=="N/A"]=NA 
pheno[pheno=="NA"]=NA 


## remove CHIC-A3 which are lab reared fish
pheno <- subset(pheno, pheno$population != "xmal-CHIC-A3")

## separate by sex 
fem <- subset(pheno, pheno$sex=="F")
male <- subset(pheno, pheno$sex=="M")

## PCA 
require(ggplot2)
require(ggbiplot)
size <- male[,c(4:10)]

popgroup <- male$species
pca <- princomp(size) 
male_by_spp <- ggbiplot(pca, groups = popgroup, ellipse = T, ellipse.prob = .95, var.axes = F) + 
  scale_color_manual(name="popgroup", values= c(rgb(58/255,107/255,198/255,alpha=1), "orchid4", "black",  rgb(156/255,8/255,23/255,alpha=1),"goldenrod1")) + 
  geom_point(aes(colour= popgroup, fill= popgroup), pch = 16, size=4) +
  theme_classic() +
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=14,face="bold")) +
  theme(legend.text=element_text(size=12))+
  expand_limits(x = c(-2, 2.2)) + 
  ggtitle("Males by spp with sword")

## get loadings for supplementary table ##
size <- male[,c(4:10)]
popgroup <- male$species
pca <- princomp(size) 
pca$loadings