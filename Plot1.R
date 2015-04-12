#Load Data
data<- read.table("household_power_consumption.txt", 
                  header = TRUE, 
                  sep = ";", 
                  colClasses = c(rep("character", 2), rep("numeric", 5)),
                  na.strings = "?")

#Convert the date to a date format
data$Date<- as.Date(data$Date,format = "%d/%m/%Y")

#Subset the data and only get the applicable dates: 2007-02-01 and 2007-02-02
reducedData<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#Load Libraries
library (graphics)

#Create plot1:Histogram Global Active Powe vs Frequency
png("plot1.png")
hist(reducedData$Global_active_power, 
     col = "Red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()
