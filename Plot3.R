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
data$Date <- dmy_hms(sprintf('%s %s', data$Date, data$Time))

#Subset the data and only get the applicable dates: 2007-02-01 and 2007-02-02
reducedData<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#Create plot2:Histogram Global Active Power vs Frequency
png("plot3.png")
plot(reducedData$Date, reducedData$Sub_metering_1, pch=".", xlab = "", ylab = "Energy Sub Metering")
lines(reducedData$Date, reducedData$Sub_metering_1, col = "black")
lines(reducedData$Date, reducedData$Sub_metering_2, col = "red")
lines(reducedData$Date, reducedData$Sub_metering_3, col = "blue")
legend(
  "topright", 
  lwd=c(2.5,2.5),
  col=c("black", "red", "blue"), 
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()