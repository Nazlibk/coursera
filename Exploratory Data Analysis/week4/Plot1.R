NEI <- readRDS("summarySCC_PM25.rds")
EmissionMean<-with(NEI, tapply(Emissions, year, sum, na.rm=T))
EmissionMean<-EmissionMean/1000000
year<-c(1999, 2002, 2005, 2008)
png("Plot1.png")
plot(year, EmissionMean, type = 'l', ylab="Total Emission (Millions of Tones)")
title(main="Total emission in United States from 1999 to 2008")
