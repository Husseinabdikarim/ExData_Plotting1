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

# Create Plot 3
png("plot3.png", width = 480, height = 480)
plot(subset_data$datetime, subset_data$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(subset_data$datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1)
dev.off()