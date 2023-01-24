## Script to plot the error rates for local ancestry inference in simulations of early generation three way hybrids and of X.mal x X. bir hybrids.
## See Fig. S7 in Banerjee & Powell et al. in press

## Fig S7A

data<-read.csv(file="~/Swordtail Dropbox/Schumer_lab_resources/Project_files/CAPS_3way_hybrids/Data/results_summary_admixture_SELAM_sim_bed_list_correct_priors",sep="\t",head=FALSE)
indiv<-unique(data$V1)
accuracy<-{}
for(x in 1:length(indiv)){
focal<-subset(data,data$V1==indiv[x])
acc<-sum(focal$V12)/(sum(focal$V12)+sum(focal$V11))
accuracy<-c(accuracy,acc)
}
dense<-density(accuracy)
plot(dense,col="cornflowerblue",xlim=c(0,0.3),ylab="Density",cex.lab=1.3,cex.axis=1.2,main="",xlab="Error rate")
polygon(dense, col="cornflowerblue", border=NA)
abline(v=median(accuracy),lty=2,lwd=2,col="red")

## Fig S7B
data<-read.csv(file="~/Swordtail Dropbox/Schumer_lab_resources/Project_files/CAPS_3way_hybrids/Data/results_summary_admixture_SELAM_calnali_sim_bed_list",sep="\t",head=FALSE)
indiv<-unique(data$V1)
accuracy<-{}
for(x in 1:length(indiv)){
focal<-subset(data,data$V1==indiv[x])
acc<-sum(focal$V12)/(sum(focal$V12)+sum(focal$V11))
accuracy<-c(accuracy,acc)
}
dense<-density(accuracy)
plot(dense,col="cornflowerblue",xlim=c(0,0.3),ylab="Density",cex.lab=1.3,cex.axis=1.2,main="",xlab="Error rate")
polygon(dense, col="cornflowerblue", border=NA)
abline(v=median(accuracy),lty=2,lwd=2,col="red")