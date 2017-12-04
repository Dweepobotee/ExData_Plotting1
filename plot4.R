##Reading the data
hpc<-read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",stringsAsFactors = F, dec = ".")
hpc$Date<-as.Date(hpc$Date, format="%d/%m/%Y")
data1<-subset(hpc, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
rm(hpc)

##Creating datetime variable
datetime<-paste(data1$Date, data1$Time)
data1$datetime<-as.POSIXct(datetime)

##Creating the plot##
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
plot(data1$datetime,data1$Global_active_power,type='l',xlab=" ",ylab="Global Active Power",cex=0.2)
plot(data1$datetime, data1$Voltage,type='l', xlab="datetime", ylab="Voltage")
plot(data1$datetime, data1$Sub_metering_1,type='l',ylab="Energy Submetering",xlab="")
lines(data1$datetime, data1$Sub_metering_2, type='l',col="red")
lines(data1$datetime, data1$Sub_metering_3, type='l', col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=1, lwd=1, col=c("black","red","blue"),bty="n")
plot(data1$datetime,data1$Global_reactive_power, type='l',xlab="datetime",ylab="Global_reactive_power")

##Saving the plot
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
