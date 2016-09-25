###### Clearing workspace ######
rm(list=ls())
cat("\014")
################################
dev.off()
###### Reading in files which are independent of test/train datasets ######
setwd("/Users/i64425/GitHub/coursera_4_exploratory_data_analysis")
columnNames <- as.matrix(read.table("/Users/i64425/Documents/Coursera/04 - Exploratory Data Analysis/household_power_consumption.txt", nrows = 1, sep = ";"))
usageDF <- read.table("/Users/i64425/Documents/Coursera/04 - Exploratory Data Analysis/household_power_consumption.txt", skip = grep("1/2/2007", readLines("/Users/i64425/Documents/Coursera/04 - Exploratory Data Analysis/household_power_consumption.txt")) - 1, fill = TRUE, nrows = 2880, sep = ";")
colnames(usageDF) <- columnNames

### Setting up a date/time variable dateTime to be used as the x-axis in the graph ###
usageDF$dateTime <- paste(usageDF$Date, usageDF$Time, sep = " ")
usageDF$dateTime <- strptime(usageDF$dateTime, format = "%d/%m/%Y %H:%M:%S")

### Creating the plot and writing it out to a file ###
png("plot4.png")
par(mfrow = c(2,2))
plot(usageDF$dateTime, usageDF$Global_active_power, type = "n", ylab = "Global Active Power", xlab = "")
lines(usageDF$dateTime, usageDF$Global_active_power)

plot(usageDF$dateTime, usageDF$Voltage, type = "n", ylab = "Voltage", xlab = "datetime")
lines(usageDF$dateTime, usageDF$Voltage, type = "l")

plot(usageDF$dateTime, usageDF$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(usageDF$dateTime, usageDF$Sub_metering_1, type = "l")
lines(usageDF$dateTime, usageDF$Sub_metering_2, type = "l", col = "red")
lines(usageDF$dateTime, usageDF$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

plot(usageDF$dateTime, usageDF$Global_reactive_power , type = "n", ylab = "Global_reactive_power", xlab = "datetime")
lines(usageDF$dateTime, usageDF$Global_reactive_power, type = "l")
dev.off()
