data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, skip=66637, nrow=69517-66637+1, col.names = colnames(read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, nrow = 1, header = TRUE)))

png("plot4.png")

par(mfcol=c(2,2))
x<-1:nrow(data)
y<-data$Global_active_power
xlabels<-c("Thu", "Fri", "Sat")
at<-c(1, nrow(data)/2, nrow(data))
plot(x,y, type="n", xlab="", ylab="Global Active Power (kilowattz)", xaxt = "n")
axis(side=1, at=at,labels=xlabels)
lines(x,y)

y1<-data$Sub_metering_1
y2<-data$Sub_metering_2
y3<-data$Sub_metering_3
plot(x,y1, type="n", xlab="", ylab="Energy sub metering", xaxt = "n", ylim=range(c(0, 40)))
lines(x,y1)
par(new=TRUE)
plot(x,y2, type="n", xlab="", ylab="Energy sub metering", xaxt = "n", yaxt="n", ylim=range(c(0, 40)))
lines(x,y2, col="red")
par(new=TRUE)
plot(x,y3, type="n", xlab="", ylab="Energy sub metering", xaxt = "n", yaxt="n", ylim=range(c(0, 40)))
lines(x,y3, col="blue")
axis(side=1, at=at,labels=xlabels)
legend("topright", legend = c("sub_metering_1","sub_metering_2", "sub_metering_3"), col=c("black","red","blue"), lty=1, box.lty = 0, inset = 0.01)

y<-data$Voltage
plot(x,y, type="n", xlab="datetime", ylab="Voltage", xaxt = "n")
axis(side=1, at=at,labels=xlabels)
lines(x,y)

y<-data$Global_reactive_power
plot(x,y, type="n", xlab="datetime", ylab="Global_reactive_power", xaxt = "n", ylim=range(c(0, 0.5)))
axis(side=1, at=at,labels=xlabels)
lines(x,y)

dev.off()