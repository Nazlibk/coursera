NEI <- readRDS("summarySCC_PM25.rds")
NEIsub<-subset(NEI, fips == "24510")
EmissionMean<-with(NEIsub, tapply(Emissions, year, sum, na.rm=T))
EmissionMean<-EmissionMean/1000
year<-c(1999, 2002, 2005, 2008)
png("Plot2.png")
dev.off()
plot(year, EmissionMean, type = 'l', ylab="Total Emission (Thousands of Tones)")
title(main="Total emission in Maryland from 1999 to 2008")
