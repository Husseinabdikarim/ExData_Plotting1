## Reading the data
## Only read the data for the dates 2007-02-01 and 2007-02-02

# Read the data
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7)))

# Convert Date and Time variables
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# Subset the data for the dates 2007-02-01 and 2007-02-02
subset_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

# Create Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Top-left plot
plot(subset_data$datetime, subset_data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

# Top-right plot
plot(subset_data$datetime, subset_data$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

# Bottom-left plot
plot(subset_data$datetime, subset_data$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(subset_data$datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1,
       bty = "n")

# Bottom-right plot
plot(subset_data$datetime, subset_data$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()