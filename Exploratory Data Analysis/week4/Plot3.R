library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
NEIsub<-subset(NEI, fips == "24510")
NEIsub1<-subset(NEIsub, type=="NON-ROAD")
NEIsub2<-subset(NEIsub, type=="NONPOINT")
NEIsub3<-subset(NEIsub, type=="ON-ROAD")
NEIsub4<-subset(NEIsub, type=="POINT")
EmissionMean[1]<-with(NEIsub1, tapply(Emissions, year, sum, na.rm=T))
EmissionMean[1]<-EmissionMean[1]/1000000
EmissionMean[2]<-with(NEIsub2, tapply(Emissions, year, sum, na.rm=T))
EmissionMean[2]<-EmissionMean[2]/1000000
EmissionMean[3]<-with(NEIsub3, tapply(Emissions, year, sum, na.rm=T))
EmissionMean[3]<-EmissionMean[3]/1000000
EmissionMean[4]<-with(NEIsub4, tapply(Emissions, year, sum, na.rm=T))
EmissionMean[4]<-EmissionMean[4]/1000000
year<-c(1999, 2002, 2005, 2008)
type<-c("NON-ROAD", "NONPOINT", "ON-ROAD", "POINT")
maindata<-data.frame(EmissionMean, year, type)

png("Plot3.png")
g<-qplot(maindata, aes(x=year, y=EmissionMean), facets = .~ type, main = "Total emission in Maryland base on types from 1999 to 2008")
print(g)