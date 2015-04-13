#Load Libraries
library(lubridate)
library (graphics)

#Load Data
data<- read.table("household_power_consumption.txt", 
                  header = TRUE, 
                  sep = ";", 
                  colClasses = c(rep("character", 2), rep("numeric", 5)),
                  na.strings = "?")

#Convert the date & time formats and concatenate
data$DateTime <- dmy_hms(sprintf('%s %s', data$Date, data$Time))

#Subset the data and only get the applicable dates: 2007-02-01 and 2007-02-02
reducedData<-subset(data, DateTime >= "2007-02-01 00:00:00" & DateTime <= "2007-02-03 00:00:00")

#Create plot4: 1) Global Active Power, 2) datetime vs voltage, 3) Energy Submetering, 4) datetime vs Global_reactive_power
png("plot4.png")
par(mfrow = c(2,2))

#1) Global Active Power
plot(reducedData$DateTime, reducedData$Global_active_power, pch=".", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(reducedData$DateTime, reducedData$Global_active_power)

#2) datetime vs voltage
plot(reducedData$DateTime, reducedData$Voltage, pch=".", xlab = "datetime", ylab = "Voltage")
lines(reducedData$DateTime, reducedData$Voltage, pch=".", xlab = "datetime", ylab = "Voltage")

#3) Energy Submetering
plot(reducedData$DateTime, reducedData$Sub_metering_1, pch=".", xlab = "", ylab = "Energy Sub Metering")
lines(reducedData$DateTime, reducedData$Sub_metering_1, col = "black")
lines(reducedData$DateTime, reducedData$Sub_metering_2, col = "red")
lines(reducedData$DateTime, reducedData$Sub_metering_3, col = "blue")
legend(
  "topright", 
  lwd=c(2.5,2.5),
  col=c("black", "red", "blue"), 
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4) datetime vs Global_reactive_power
plot(reducedData$DateTime, reducedData$Global_reactive_power, pch=".", xlab = "datetime", ylab = "Global_reactive_power")
lines(reducedData$DateTime, reducedData$Global_reactive_power, pch=".", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()