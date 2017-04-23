# data<-read.csv("getdata_data_ss06hid.csv")
# sdata<-strsplit(names(data), "wgtp")

data<-read.csv("getdata_data_GDP.csv")
sub<-gsub(",","",data$X.3)
nsub<-as.numeric(sub)
m<-mean(nsub, na.rm = TRUE)
# 
# countryNames<-data$X.2
# 
# data1<-read.csv("getdata_data_EDSTATS_Country.csv")
# mergeData<-merge(data1, data, by.x = "CountryCode", by.y = "X", all=TRUE)
# gr<-grep("Fiscal year end",mergeData$Special.Notes)
# fiscal<-mergeData[gr,10]
# June<-grep("June", fiscal)

# library(quantmod)
# amzn = getSymbols("AMZN",auto.assign=FALSE)
# sampleTimes = index(amzn)
# date<-sampleTimes[grep("2012", sampleTimes)]
# weekd<-weekdays(date)
