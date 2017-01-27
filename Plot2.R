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
plot(testdata$datetime, testdata$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
