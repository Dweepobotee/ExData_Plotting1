## Reading the data
hpc<-read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",stringsAsFactors = F, dec = ".")
hpc$Date<-as.Date(hpc$Date, format="%d/%m/%Y")
data1<-subset(hpc, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
rm(hpc)

## Creating the datetime variable
datetime<-paste(data1$Date, data1$Time)
data1$datetime<-as.POSIXct(datetime)

## Creating the plot
with(data1,{
  plot(Sub_metering_1~datetime, type="l",
       ylab="Energy sub metering", xlab=" ")
  lines(Sub_metering_2~datetime, col='Red')
  lines(Sub_metering_3~datetime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving the plot
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
