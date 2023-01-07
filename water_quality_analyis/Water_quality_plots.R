# Plotting water quality and chemistry from Tlalica and upstream sites
# see Fig 2B and Fig S6 of Banerjee & Powell et al. in press

## set up

require(dplyr)
require(ggplot2)
require(Hmisc)
require(Rmisc)
require(lubridate)
data <- read.csv("waterchem_with_averagedsonde_labmetals_datafix.csv")
DOC <- read.csv("DOC_data_MayJun_2022.csv")

## pick sites (Plank, Plaza, Calnali Low, and Tlalica)
data <- filter(data, Site.Code %in% c("CAPS", "CALL", "PLNK", "TLCD", "PLAZA", "TLLD"))
DOC <- filter(DOC, Site.Code %in% c("CAPS", "CALL", "PLNK", "TLCD", "PLAZA", "TLLD"))

## combine Tlalica and Tlalica down
data$Site.Code <- replace(data$Site.Code, data$Site.Code == "TLCD", "CAPS")
DOC$Site.Code <- replace(DOC$Site.Code, DOC$Site.Code == "TLCD", "CAPS")

## set site codes as factors
data$Site.Code <- factor(data$Site.Code, levels=c("PLNK", "PLAZA", "CALL", "CAPS"))
DOC$Site.Code <- factor(DOC$Site.Code, levels=c("PLNK", "PLAZA", "CALL", "CAPS"))

## filter collection dates to only include data from May and June 2022
data$Date <- dmy(data$Date)
data <- filter(data, Date > "2022-04-01")

## convert units of dissolved metals
data$Cu_dissolved <- data$Cu_dissolved*1000
data$Mn_dissolved <- data$Mn_dissolved*1000
data$As_dissolved <- data$As_dissolved*1000
data$Cd_dissolved <- data$Cd_dissolved*1000
data$Al_dissolved <- data$Al_dissolved*1000
data$Zn_dissolved <- data$Zn_dissolved*1000

## Plot Fig 2B
DOMsonde <- ggplot(data, aes(x=Site.Code, y=fDOM_QSU)) + 
  geom_dotplot(binaxis='y', stackdir='center', dotsize = 1.5) +
  stat_summary(fun.data=mean_se, fun.args = list(mult=1), 
               geom="pointrange", color="red", size =4) +
  theme_bw() +
  theme(axis.text.y = element_text(size = 50)) +
  theme(axis.text.x = element_text(size = 50)) +
  theme(axis.ticks=element_line(size=2)) +
  theme(axis.title=element_text(size=50)) +
  xlab("") +
  ylab("Dissolved Organic Matter (QSU)")

ammonia <- ggplot(data, aes(x=Site.Code, y=NH3)) + 
  geom_dotplot(binaxis='y', stackdir='center', dotsize = 1.5) +
  stat_summary(fun.data=mean_se, fun.args = list(mult=1), 
               geom="pointrange", color="red", size =4) +
  theme_bw() +
  theme(axis.text.y = element_text(size = 50))+
  theme(axis.text.x = element_text(size = 50)) +
  theme(axis.ticks=element_line(size=2)) +
  theme(axis.title=element_text(size=50)) +
  xlab("") +
  ylab("Ammonia (mg N/L)")

copper <- ggplot(data, aes(x=Site.Code, y=	Cu_dissolved)) + 
  geom_dotplot(binaxis='y', stackdir='center', dotsize = 1.5) +
  stat_summary(fun.data=mean_se, fun.args = list(mult=1), 
               geom="pointrange", color="red", size =4) +
  theme_bw() +
  theme(axis.text.y = element_text(size = 50))+
  theme(axis.text.x = element_text(size = 50)) +
  theme(axis.ticks=element_line(size=2)) +
  theme(axis.title=element_text(size=50)) +
  xlab("") +
  ylab("Dissolved copper (ug/L)")

Turbidity <- ggplot(filter(data, Turbidity_instrument == "sonde"), aes(x=Site.Code, y=Turbidity)) + 
  geom_dotplot(binaxis='y', stackdir='center', dotsize = 1.5) +
  stat_summary(fun.data=mean_se, fun.args = list(mult=1), 
               geom="pointrange", color="red", size =4) +
  theme_bw() + 
  theme(axis.text.y = element_text(size = 50)) +
  theme(axis.text.x = element_text(size = 50)) +
  theme(axis.ticks=element_line(size=2)) +
  theme(axis.title=element_text(size=50)) +
  xlab("") +
  ylab("Turbidity (FNU)")

multiplot(DOMsonde, ammonia, copper, Turbidity, cols = 2)

## Plot Fig S6
DOClab <- ggplot(DOC, aes(x=Site.Code, y=DOC_lab)) + 
  geom_dotplot(binaxis='y', stackdir='center') +
  stat_summary(fun.data=mean_se, fun.args = list(mult=1), 
               geom="pointrange", color="red") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 50))+
  theme(axis.text.x = element_text(size = 50)) +
  theme(axis.ticks=element_line(size=2)) +
  theme(axis.title=element_text(size=50)) +
  xlab("") +
  ylab("Dissolved organic carbon (mg/L)")

nitrite <- ggplot(data, aes(x=Site.Code, y=NO2)) + 
  geom_dotplot(binaxis='y', stackdir='center') +
  stat_summary(fun.data=mean_se, fun.args = list(mult=1), 
               geom="pointrange", color="red") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 50))+
  theme(axis.text.x = element_text(size = 50)) +
  theme(axis.ticks=element_line(size=2)) +
  theme(axis.title=element_text(size=50)) +
  xlab("") +
  ylab("Nitrite (mg N/L)") 

Mn <- ggplot(data, aes(x=Site.Code, y=data$Mn_dissolved)) + 
  geom_dotplot(binaxis='y', stackdir='center') +
  stat_summary(fun.data=mean_se, fun.args = list(mult=1), 
               geom="pointrange", color="red") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 50)) +
  theme(axis.text.x = element_text(size = 50)) +
  theme(axis.ticks=element_line(size=2)) +
  theme(axis.title=element_text(size=50)) +
  xlab("") +
  ylab("Manganese (ug/L)")

As <- ggplot(data, aes(x=Site.Code, y=data$As_dissolved)) + 
  geom_dotplot(binaxis='y', stackdir='center') +
  stat_summary(fun.data=mean_se, fun.args = list(mult=1), 
               geom="pointrange", color="red") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 50)) +
  theme(axis.text.x = element_text(size = 50)) +
  theme(axis.ticks=element_line(size=2)) +
  theme(axis.title=element_text(size=50)) +
  xlab("") +
  ylab("Arsenic (ug/L)")

Cd <- ggplot(data, aes(x=Site.Code, y=data$Cd_dissolved)) + 
  geom_dotplot(binaxis='y', stackdir='center') +
  stat_summary(fun.data=mean_se, fun.args = list(mult=1), 
               geom="pointrange", color="red") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 50)) +
  theme(axis.text.x = element_text(size = 50)) +
  theme(axis.ticks=element_line(size=2)) +
  theme(axis.title=element_text(size=50)) +
  xlab("") +
  ylab("Cadmium (ug/L)")

Al <- ggplot(data, aes(x=Site.Code, y=data$Al_dissolved)) + 
  geom_dotplot(binaxis='y', stackdir='center') +
  stat_summary(fun.data=mean_se, fun.args = list(mult=1), 
               geom="pointrange", color="red") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 50)) +
  theme(axis.text.x = element_text(size = 50)) +
  theme(axis.ticks=element_line(size=2)) +
  theme(axis.title=element_text(size=50)) +
  xlab("") +
  ylab("Aluminum (ug/L)")

Zn <- ggplot(data, aes(x=Site.Code, y=data$Zn_dissolved)) + 
  geom_dotplot(binaxis='y', stackdir='center') +
  stat_summary(fun.data=mean_se, fun.args = list(mult=1), 
               geom="pointrange", color="red") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 50)) +
  theme(axis.text.x = element_text(size = 50)) +
  theme(axis.ticks=element_line(size=2)) +
  theme(axis.title=element_text(size=50)) +
  xlab("") +
  ylab("Zinc (ug/L)")

multiplot(DOClab, nitrite, Mn, As, Cd, Al, Zn, cols = 4)