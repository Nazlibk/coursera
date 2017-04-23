data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, skip=66637, nrow=69517-66637+1, col.names = colnames(read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, nrow = 1, header = TRUE)))

png("plot1.png")
hist(as.numeric(data$Global_active_power), col="red", xlab="Global Active Power (kilowattz)", ylab="Frequency", main="Global Active Power", breaks=12)
dev.off()
