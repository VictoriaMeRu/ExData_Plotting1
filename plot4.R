
# Load dataset and Filter dates:
powerDT <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
filterPowerDT <- subset(powerDT, Date %in% c("1/2/2007", "2/2/2007"))

# Convert Time to Date
dateTime <- strptime(paste(filterPowerDT$Date, filterPowerDT$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

# subset data:
SubMetering1 <- as.numeric(as.character(filterPowerDT$Sub_metering_1))
SubMetering2 <- as.numeric(as.character(filterPowerDT$Sub_metering_2))
SubMetering3 <- as.numeric(as.character(filterPowerDT$Sub_metering_3))

globalActivePower <- as.numeric(as.character(filterPowerDT$Global_active_power))
globalReactivePower <- as.numeric(as.character(filterPowerDT$Global_reactive_power))
voltage <- as.numeric(as.character(filterPowerDT$Voltage))

# Composite plot:
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

# Plot:
plot(dateTime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power") # plot 4.1.

plot(dateTime, voltage, type = "l", xlab = "datetime", ylab = "voltage") # plot 4.2.

plot(dateTime, SubMetering1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering") # plot 4.3.
        lines(dateTime, SubMetering2, type = "l", col = "red")
        lines(dateTime, SubMetering3, type = "l", col = "blue")
        legend("topright", legend=c("SubMetering1", "SubMetering2", "SubMetering3"), cex=0.8, lty=1, lwd=2, bty="n", col=c("black", "red", "blue"))

plot(dateTime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_Reactive_Power")

# Save plot to .png:
png("plot4.png", width=480, height=480)
dev.off()
