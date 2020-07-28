setwd("C:/Users/victo/Desktop/COURSERA/2020 Data Science Specialization/04. Exploratory Data Analysis/Course project/exdata_data_household_power_consumption")

# loading the data set:
powerDT <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
head(powerDT)
str(powerDT)
names(powerDT) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                    "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Filtering dates for 01.02.2007 and 02.02.2007:
subPowerDT <- subset(powerDT, Date %in% c("1/2/2007", "2/2/2007"))

# Calling the basic plot function:
hist(as.numeric(as.character(subPowerDT$Global_active_power)), main = "Global Active Power", 
     col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")

# Saving the plot to a PNG file with a 480 width pixels and 480 height pixels:
png("plot1.png", width=480, height=480)
dev.off()