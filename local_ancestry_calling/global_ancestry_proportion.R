## Script to plot global ancestry proportions by individual for individuals with northern swordtail ancestry at Tlalica and from upstream sites.
## See Fig. 3A & 3B of Banerjee & Powell et al. in press. 

# set colors and read in data
bircol <- rgb(58/255,107/255,198/255,alpha=1)
malcol <- rgb(156/255,8/255,23/255,alpha=1)
varcol <- "goldenrod1"
data <- read.csv("master_ancestry_proportions_list.csv", header = T, stringsAsFactors=FALSE, fileEncoding="latin1")

# remove low read count
data <- subset(data, data$Pass_fail_read_count == "PASS")

# remove expected pure X.var
data <- subset(data, data$swt_or_platy == "swt")

# remove expected pure X.mal and X.bir
data <- subset(data, data$up_down_CAPS != "parental")

# split into Tlalica (caps) vs upstream
up <- subset(data, data$up_down_CAPS == "UP")
caps <- subset(data, data$up_down_CAPS == "CAPS")

# remove pure X.var from Tlalica dataset
caps<-subset(caps,caps$par3<0.99)

# subset upstream data set for plot:
n=length(caps[,1])
up<-up[sample(nrow(up),n),]
up<-up[order(-up$par3),]

# make plot of subset of individuals from upstream sites 
barplot(t(cbind(up$par1,up$par2,up$par3)),col=c(bircol,malcol,varcol))

# make plot of subset of individuals with Northern swordtail ancestry from Tlalica 
caps<-caps[order(-caps$par3),]
barplot(t(cbind(caps$par1,caps$par2,caps$par3)),col=c(bircol,malcol,varcol))

# format legend
barplot(t(cbind(caps$par1,caps$par2,caps$par3)),col=c(bircol,malcol,varcol),ylim=c(0,10))
legend("topright",c("X. birchmanni","X. malinche","X. variatus"),col=c(bircol,malcol,varcol),pch=15,cex=3)
