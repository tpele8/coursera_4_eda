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
png("plot2.png")
plot(usageDF$dateTime, usageDF$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(usageDF$dateTime, usageDF$Global_active_power)
dev.off()
