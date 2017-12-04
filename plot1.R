## Reading the data
hpc<-read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",stringsAsFactors = F)
hpc$Date<-as.Date(hpc$Date, format="%d/%m/%Y")
data<-subset(hpc, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
rm(hpc)

## Plotting the data
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency", col="Red")

## Saving the plot
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()