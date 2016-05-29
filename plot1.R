# Exploratory data
# Assignment 1
# Plot 1

# Load data into R
# First, make sure data file is in working directory
rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                      stringsAsFactors=FALSE, dec=".")
Data <- rawData[rawData$Date %in% c("1/2/2007", "2/2/2007") ,]

# Create plot 1
GAPdata <- as.numeric(Data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GAPdata, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()