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
png("plot2.png")
  plot(reducedData$DateTime, reducedData$Global_active_power, pch=".", xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(reducedData$DateTime, reducedData$Global_active_power)
dev.off()