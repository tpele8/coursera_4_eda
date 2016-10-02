###### Clearing workspace ######
rm(list=ls())
cat("\014")
################################

library(dplyr)
library(ggplot2)

# Reading in files
  setwd("/Users/i64425/GitHub/coursera_4_eda/Project 2/SCC_PM25 Data")
  summDF <- readRDS("summarySCC_PM25.rds")
  sccDF <- readRDS("Source_Classification_Code.rds")

# Answering Question 1:
#   Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#   Using the base plotting system, make a plot showing the total PM2.5 emission from all 
#   sources for each of the years 1999, 2002, 2005, and 2008.

# Computing the totals for visualization
  totByYear <- tapply(summDF$Emissions, summDF$year, FUN = sum)
  
# Creating plot to visualize results
  png("plot1.png")
  plot(names(totByYear), totByYear, type = "l", ylab = "Total Emissions", xlab = "Year", main = "PM2.5 Emissions by Year")
  dev.off()
  