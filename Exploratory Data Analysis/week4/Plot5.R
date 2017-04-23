NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Index<-grepl("Motor", SCC$Short.Name)
data<-SCC[Index, ]
mdata<-merge(NEI, data, by="SCC")
NEIsub<-subset(mdata, fips == "24510")
year<-c(1999, 2002, 2005, 2008)
png("Plot5.png")
MotorEmissions<-with(NEIsub, tapply(Emissions, year, sum, na.rm=T))
EmissionMean<-EmissionMean/1000000
plot(year, MotorEmissions, type='l', ylab = "Totall Emissions (millions of Tones)")
title(main="Emissions from motor vehicle sources from 1999 to 2008 in Baltimore City")