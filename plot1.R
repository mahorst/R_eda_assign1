# Exploratory Data Analysis
# Assignment 1
# Mike Horst
# mahorst@lghealth.org
# Electric power consumption
# Plot 1
### Read in entire file
temp <- read.table("household_power_consumption.txt", colClasses = "character",
                   header = TRUE, na.strings = "?", sep = ";")
### Convert date
temp$date_rev <- as.Date(temp$Date, format = "%d/%m/%Y")
### Select out desired dates for analysis and remove entire file to save memory
powerc <- temp[temp$date_rev >= as.Date("01/02/2007", format = "%d/%m/%Y") &
                       temp$date_rev <= as.Date("02/02/2007", format = "%d/%m/%Y"), ]
rm(temp)
### Convert date and time
powerc$td <- paste(powerc$Date," ", powerc$Time)
powerc$td_rev <- strptime(powerc$td, format = "%d/%m/%Y %T")
### Convert character values to numeric
powerc$Global_active_power <- as.numeric(powerc$Global_active_power)
powerc$Global_reactive_power <- as.numeric(powerc$Global_reactive_power)
powerc$Voltage <- as.numeric(powerc$Voltage)
powerc$Global_intensity <- as.numeric(powerc$Global_intensity)
powerc$Sub_metering_1 <- as.numeric(powerc$Sub_metering_1)
powerc$Sub_metering_2 <- as.numeric(powerc$Sub_metering_2)
powerc$Sub_metering_3 <- as.numeric(powerc$Sub_metering_3)
### Create plot
png(filename = "plot1", width = 480, height = 480)
hist(powerc$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")
dev.off()