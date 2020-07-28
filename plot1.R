
# Load dataset and Filter dates:
powerDT <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
filterPowerDT <- subset(powerDT, Date %in% c("1/2/2007", "2/2/2007"))

# Plot:
hist(as.numeric(as.character(filterPowerDT$Global_active_power)), main = "Global Active Power", 
     col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")

# Save plot to .png:
png("plot1.png", width=480, height=480)
dev.off()