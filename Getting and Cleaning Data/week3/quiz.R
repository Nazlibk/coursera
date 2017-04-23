# data<-read.csv("getdata_data_ss06hid.csv")
# agricultureLogical<-data$ACR == 3 & data$AGS == 6
# jp<-readJPEG("getdata_jeff.jpg ", native = TRUE)
# q<-quantile(jp, probs=c(0.3, 0.8))
library(dplyr)
data1<-read.csv("getdata_data_EDSTATS_Country.csv", na.strings = c("", "NA"))
data2<-read.csv("getdata_data_GDP.csv", na.strings = c("", "NA"))
mergeData<-merge(data1, data2, by.x = "CountryCode", by.y = "X", all=TRUE)
print(nrow(mergeData))
mergeData<-mergeData[-which(is.na(mergeData$Gross.domestic.product.2012)),]
print(nrow(mergeData))
mergeData<-mergeData[1:190,]
# na.omit(mergeData)
# mergeData<-mergeData[rowSums(is.na(mergeData)) != ncol(mergeData),]
mergeData<-mutate(mergeData, G=as.numeric(as.character(mergeData$Gross.domestic.product.2012)))
sorted<-arrange(mergeData, desc(G))
# bad=is.empty.model(mergeData$Gross.domestic.product.2012)
# mergeData <-mergeData(!bad)

# m<-data.frame()
# m<-match(data1$CountryCode, data2$X)
# result<-data2$X[m]
# sortresult<-sort(result)

# m=arrange(desc(m))
# m=sort(m)
# result=arrange(result, desc(result))
# high<-filter(mergeData, Income.Group == "High income: OECD" & Income.Group == "High income: nonOECD")
high<-group_by(mergeData, Income.Group)
a<-summarize(high, avg=mean(as.numeric(Gross.domestic.product.2012), na.rm=TRUE))
f1<-filter(mergeData, Income.Group == "High income: OECD")
f2<-filter(mergeData, Income.Group == "High income: nonOECD")
m1=mean(as.numeric(f1$Gross.domestic.product.2012), na.rm=TRUE)
m2=mean(as.numeric(f2$Gross.domestic.product.2012), na.rm=TRUE)

c<-cut(as.numeric(mergeData$Gross.domestic.product.2012), breaks = 5)
f<-filter(mergeData, Income.Group == "Lower middle income")
t<-table(c, mergeData$Income.Group)
# q<-quantile(mergeData$Gross.domestic.product.2012, probs=c(0, 0.2, 0.4, 0.6, 1))
