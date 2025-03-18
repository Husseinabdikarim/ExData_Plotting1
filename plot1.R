## Reading the data
## Only read the data for the dates 2007-02-01 and 2007-02-02

# Read the data
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7)))

# Convert Date and Time variables
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data for the dates 2007-02-01 and 2007-02-02
subset_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

# Create Plot 1
png("plot1.png", width = 480, height = 480)
hist(subset_data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()