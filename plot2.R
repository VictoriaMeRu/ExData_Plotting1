
# Load dataset and Filter dates:
powerDT <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
filterPowerDT <- subset(powerDT, Date %in% c("1/2/2007", "2/2/2007"))

# Convert Time to Date
dateTime <- strptime(paste(filterPowerDT$Date, filterPowerDT$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

# Plot
plot(dateTime, as.numeric(as.character(filterPowerDT$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts")

# Save plot to .png:
png("plot2.png", width=480, height=480)
dev.off()
