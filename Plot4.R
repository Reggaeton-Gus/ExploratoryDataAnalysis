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


##PLOT 2
testdata$datetime <- as.POSIXct(paste(testdata$Date, testdata$Time), tz = "UTC")


png(filename = "Plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", res = NA, restoreConsole = TRUE)

par(mfrow =c(2,2))
plot(testdata$datetime, testdata$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
plot(testdata$datetime, testdata$Voltage, type = "l", xlab ="datetime", ylab = "Voltage")


plot(testdata$datetime, testdata$Sub_metering_1, type = "n", xlab ="", ylab = "Global Active Power (kilowatts)")
lines(testdata$datetime, testdata$Sub_metering_1)
lines(testdata$datetime, testdata$Sub_metering_2, col = "red")
lines(testdata$datetime, testdata$Sub_metering_3, col = "blue")

legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "sub_metering_3"), lty= c(1.5,1.5,1.5), lwd= c(1, 1, 1), col = c("black", "red", "blue"))


plot(testdata$datetime, testdata$Global_reactive_power, type = "l", xlab ="datetime", ylab = "Global_reactive_power")

dev.off()
