#Electric Power Consumption data in R

ElectricPowerConsumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 

## Subsetting February Electric Power Consumption data 

FebPowerData <- subset(ElectricPowerConsumption, subset=(Date == "1/2/2007" | Date == "2/2/2007")) 

## Converting dates 

FebPowerData$Date <- format(as.Date(FebPowerData$Date, format = "%d/%m/%Y"), "%Y-%m-%d")
DateTime <- strptime(paste(FebPowerData$Date, FebPowerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Plot 3

GlobalActivePower <- as.numeric(FebPowerData$Global_active_power) 
SubMetering1 <- as.numeric(FebPowerData$Sub_metering_1) 
SubMetering2 <- as.numeric(FebPowerData$Sub_metering_2) 
SubMetering3 <- as.numeric(FebPowerData$Sub_metering_3) 
plot(DateTime, SubMetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(DateTime, SubMetering2, type="l", col="red") 
lines(DateTime, SubMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 

## Saving to file 

dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off()