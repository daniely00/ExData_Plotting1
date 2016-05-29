# Exploratory data
# Assignment 1
# Plot 4

# Load data into R
# First, make sure data file is in working directory
rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                      stringsAsFactors=FALSE, dec=".")
Data <- rawData[rawData$Date %in% c("1/2/2007", "2/2/2007") ,]

# Edit date
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
dateTime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(dateTime)

# Create plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
# Subplot 1
plot(Data$Global_active_power~Data$Datetime, xlab="",
     ylab="Global Active Power", type="l")
# Subplot 2
plot(Data$Voltage~Data$Datetime, xlab="datetime",
     ylab="Voltage", type="l")
# SubPlot 3
plot(Data$Sub_metering_1~Data$Datetime, xlab="",
     ylab="Energy sub metering", type="l")
lines(Data$Sub_metering_2~Data$Datetime, type="l", col="red")
lines(Data$Sub_metering_3~Data$Datetime, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"))
# Subplot 4
plot(Data$Global_reactive_power~Data$Datetime, xlab="datetime",
     ylab="Global_reactive_power", type="l")
dev.off()
