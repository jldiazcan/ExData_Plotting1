#Electric Power Consumption data in R

ElectricPowerConsumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 

## Subsetting February Electric Power Consumption data 

FebPowerData <- subset(ElectricPowerConsumption, subset=(Date == "1/2/2007" | Date == "2/2/2007")) 

## Converting dates 

FebPowerData$Date <- format(as.Date(FebPowerData$Date, format = "%d/%m/%Y"), "%Y-%m-%d")
DateTime <- strptime(paste(FebPowerData$Date, FebPowerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Plot 1 

hist(FebPowerData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 

## Saving to file 

dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
