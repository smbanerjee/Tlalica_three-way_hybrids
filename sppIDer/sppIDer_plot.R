## Script to plot the reuslts of sppIDer analysis confirming three way hybird ancestry in high coverage whole genome sequences from males identified at Tlalica
## See Fig. S5 of Banerjee & Powell et al. in press

# set up
options(stringAsFactors=FALSE)
require(ggplot2)
require(modes)
plot <- ggplot()
args <- commandArgs(TRUE)
outputPrefix <- args[1]
workingDir <- "~/sppIDer/"
setwd(workingDir)
outputPrefix <- "CAPS-V-21-M02_xbirXmalXvar_deNovo"

#Read in data, get info on window size and spread of mean values. Add log2 and a rescaled mean column to be plotted later.
windowedDataFileName <- paste(workingDir, outputPrefix, "_winAvgDepth-d.txt", sep="")
if (file.exists(windowedDataFileName)){
  bedData <- read.table(windowedDataFileName, header=F, skip=2, col.names = c("Genome_Pos", "species", "chrom", "start",  "end", "meanValue", "log2rawCov", "max", "median"))
} else {
  windowedDataFileName <- paste(workingDir, outputPrefix, "_winAvgDepth-g.txt", sep="")
  bedData <- read.table(windowedDataFileName, header=F, skip=2, col.names = c("Genome_Pos", "species", "chrom", "start",  "end", "meanValue", "log2rawCov", "max", "median"))
}

limitValue <- 100
bedData$meanValueLimited <- bedData$meanValue
bedData$meanValueLimited[bedData$meanValueLimited>limitValue] <- limitValue

uniSpecies <- unlist(list(unique(bedData$species)))
uniSpecies <- factor(uniSpecies, levels=uniSpecies)
speciesBreaks <- c()
speciesLabelPos <- c()
#Go though by species and determine mean depth and chromosome lengths.
#Which species will be included on the stacked plots is determined by if the species 99% mean depth is greater than the overall mean depth.
for (i in uniSpecies){
  index <- which(uniSpecies %in% i)
  speciesName <- i
  speciesData <- subset(bedData, species==speciesName)
  speciesStart <- speciesData$Genome_Pos[1]
  speciesBreaks <- append(speciesBreaks, speciesStart)
  speciesEnd <- speciesData$Genome_Pos[length(speciesData$Genome_Pos)]
  speciesMidpoint <- speciesStart+(speciesEnd-speciesStart)/2
  speciesLabelPos <- append(speciesLabelPos, speciesMidpoint)
}

xaxis <- scale_x_continuous(breaks=speciesLabelPos, labels=c("X. birchmann", "X. malinche", "X. variatus"), name="Genome Position", limits=c(0,NA))
pointLegend <- scale_color_manual(name="Species", values=c(rgb(58/255,107/255,198/255), rgb(156/255,8/255,23/255), "goldenrod1"), breaks=uniSpecies, labels=gsub("_", " ", uniSpecies), guide = "none")

ggplot(bedData, aes(x=Genome_Pos, y=meanValueLimited, color=species)) + geom_point(alpha=0.75, size=0.75) + theme_bw() + xaxis + geom_vline(xintercept = c(speciesBreaks, max(bedData$Genome_Pos)), alpha=0.7) + pointLegend + ylab("Average Depth of Coverage (limited to 100X)") +theme(axis.text.x=element_text(face="italic"))
ggsave("CAPS-V-21-M02_xbirXmalXvar.pdf", height=6, width=12)