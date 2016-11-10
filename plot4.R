# Read and subset data for the plot
subsetPowerData <- read.csv("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", nrows = 2880, skip = 66636)
names(subsetPowerData) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Create the plots (column oriented)
par(mfcol = c(2,2))

# Plot 1
plot(subsetPowerData$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1, at = c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"))

# Plot 2
plot(subsetPowerData$Sub_metering_1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(subsetPowerData$Sub_metering_2, col = "red")
lines(subsetPowerData$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at = c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"))

# Plot 3
plot(subsetPowerData$Voltage, type = "l", xaxt = "n", xlab = "", ylab = "Voltage")
axis(1, at = c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"))

# Plot 4
plot(subsetPowerData$Global_reactive_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Reactive Power")
axis(1, at = c(1, 1441, 2881), labels = c("Thu", "Fri", "Sat"))

# Copy my plot to a PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480)

# Closing the PNG device
dev.off()