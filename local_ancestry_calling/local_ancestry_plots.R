## Script to produce local ancestry plots for a selected chromosome for selected individuals
## See Fig. 3C of Banerjee & Powell et al. in press

# read in data
data<-read.csv(file="genotypes_allchrs_swt-CAPS_Jan2022.txt_transposed",sep="\t",head=TRUE)
data1<-read.csv(file="plaz_genotypes_3way_all.txt_transposed",sep="\t",head=TRUE)

# subset data to selected chromosome
data<-subset(data,data$chrom=="ScyDAA6-1508-HRSCAF-1794")
data1<-subset(data1,data1$chr=="ScyDAA6-1508-HRSCAF-1794")

# select X.mal x X.bir hybrid individual
indiv<-na.omit(cbind(data$pos,data[,6]))

# plot X.mal x X.bir hybrid individual
plot(indiv[,1]/1e6,indiv[,2],type="l",col="blue",lwd=2,ylim=c(0,5),xlab="Position",ylab="Genotype")

# select three-way hybrid individual
indiv<-na.omit(cbind(data$pos,data[,14]))

# plot three-way hybrid individual
plot(indiv[,1]/1e6,indiv[,2],type="l",col="blue",lwd=2,ylim=c(0,5),xlab="Position",ylab="Genotype")

# select backcross individual
indiv<-na.omit(cbind(data1$pos,data1[,3]))

# plot backcross individual
plot(indiv[,1]/1e6,indiv[,2],type="l",col="blue",lwd=2,ylim=c(0,5),xlab="Position",ylab="Genotype")