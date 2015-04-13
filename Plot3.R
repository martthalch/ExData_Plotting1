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
reducedData<-subset(data, DateTime >= "2007-02-01 00:00:00" & Date <= "2007-02-03 00:00:00")

#Create plot3:energy sub metering
png("plot3.png")
plot(reducedData$DateTime, reducedData$Sub_metering_1, pch=".", xlab = "", ylab = "Energy Sub Metering")
lines(reducedData$DateTime, reducedData$Sub_metering_1, col = "black")
lines(reducedData$DateTime, reducedData$Sub_metering_2, col = "red")
lines(reducedData$DateTime, reducedData$Sub_metering_3, col = "blue")
legend(
  "topright", 
  lwd=c(2.5,2.5),
  col=c("black", "red", "blue"), 
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()