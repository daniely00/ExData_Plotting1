# Exploratory data
# Assignment 1
# Plot 3

# Load data into R
# First, make sure data file is in working directory
rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                      stringsAsFactors=FALSE, dec=".")
Data <- rawData[rawData$Date %in% c("1/2/2007", "2/2/2007") ,]

# Edit date
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
dateTime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(dateTime)

# Create plot 3
png("plot3.png", width=480, height=480)
plot(Data$Sub_metering_1~Data$Datetime, xlab="",
     ylab="Energy sub metering", type="l")
lines(Data$Sub_metering_2~Data$Datetime, type="l", col="red")
lines(Data$Sub_metering_3~Data$Datetime, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"))
dev.off()