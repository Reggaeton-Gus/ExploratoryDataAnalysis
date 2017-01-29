## Initialise


## Read data
 data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## Subset data for 2007-02-01 and 02-02-2007
testdata <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
times <- testdata["Time"]
##times <- strptime(times[,"Time"],"%H:%M:%S" )
dates <- testdata["Date"]
dates <- as.Date (dates[,"Date"], "%d/%m/%Y")
testdata[["Date"]]<-dates
##testdata[["Time"]]<-times


##PLOT 3
testdata$datetime <- as.POSIXct(paste(testdata$Date, testdata$Time), tz = "UTC")
plot(testdata$datetime, testdata$Sub_metering_1, type = "n", xlab ="", ylab = "Global Active Power (kilowatts)")
lines(testdata$datetime, testdata$Sub_metering_1)
lines(testdata$datetime, testdata$Sub_metering_2, col = "red")
lines(testdata$datetime, testdata$Sub_metering_3, col = "blue")

legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "sub_metering_3"), lty= c(1.5,1.5,1.5), lwd= c(1, 1, 1), col = c("black", "red", "blue"))
