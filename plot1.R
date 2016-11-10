# Read and subset data for the plot
subsetPowerData <- read.csv("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", nrows = 2880, skip = 66636)
names(subsetPowerData) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Create the plot
par(mfcol = c(1,1))

# Create the plot
hist(as.numeric(subsetPowerData$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Copy my plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)

# Closing the PNG device
dev.off()