# Exploratory data
# Assignment 1
# Plot 2

# Load data into R
# First, make sure data file is in working directory
rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                      stringsAsFactors=FALSE, dec=".")
Data <- rawData[rawData$Date %in% c("1/2/2007", "2/2/2007") ,]

# Edit date
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
dateTime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(dateTime)

# Create plot 2
png("plot2.png", width=480, height=480)
plot(Data$Global_active_power~Data$Datetime, xlab="",
     ylab="Global Active Power (kilowatts)", type="l")
dev.off()