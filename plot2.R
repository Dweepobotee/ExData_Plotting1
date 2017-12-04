## Reading the data
hpc<-read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",stringsAsFactors = F, dec = ".")
hpc$Date<-as.Date(hpc$Date, format="%d/%m/%Y")
data1<-subset(hpc, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
rm(hpc)

## Creating the datetime variable
datetime<-paste(data1$Date, data1$Time)
data1$datetime<-as.POSIXct(datetime)

## Creating the plot
plot(data1$datetime, data1$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")

## Saving the plot
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
