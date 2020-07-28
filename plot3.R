
# Load dataset and Filter dates:
powerDT <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
filterPowerDT <- subset(powerDT, Date %in% c("1/2/2007", "2/2/2007"))

# Convert Time to Date
dateTime <- strptime(paste(filterPowerDT$Date, filterPowerDT$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

# Plot and legend
SubMetering1 <- as.numeric(as.character(filterPowerDT$Sub_metering_1))
SubMetering2 <- as.numeric(as.character(filterPowerDT$Sub_metering_2))
SubMetering3 <- as.numeric(as.character(filterPowerDT$Sub_metering_3))

plot(dateTime, SubMetering1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering", main = "Energy Sub Metering")
   lines(dateTime, SubMetering2, type = "l", col = "red")
   lines(dateTime, SubMetering3, type = "l", col = "blue")
   legend("topright", c("SubMetering1", "SubMetering2", "SubMetering3"), lty=1, lwd=1, col=c("black", "red", "blue"))

# Save plot to .png:
png("plot3.png", width=480, height=480)
dev.off()
