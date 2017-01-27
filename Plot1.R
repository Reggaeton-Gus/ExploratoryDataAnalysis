## Initialise


## Read data
 data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## Subset data for 2007-02-01 and 02-02-2007
testdata <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
times <- testdata["Time"]
times <- strptime(times[,"Time"],"%H:%M:%S" )
dates <- testdata["Date"]
dates <- as.Date (dates[,"Date"], "%d/%m/%y")
testdata[["Date"]]<-dates
testdata[["Time"]]<-times


##PLOT 1
GAP <- testdata$Global_active_power
png(filename = "Plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", res = NA, restoreConsole = TRUE)
hist(GAP, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
