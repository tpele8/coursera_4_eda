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

# Answering Question 2:
#   Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") 
#   from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Calculating the totals for visualization
  df <- summDF[summDF$fips == "24510",]
  dfSum <- tapply(df$Emissions, df$year, FUN = sum)
  
# Creating plot to visualize results
  png("plot2.png")
  plot(names(dfSum), dfSum, type = "l", ylab = "Total Emissions", xlab = "Year", main = "PM2.5 Emissions by Year for Baltimore, MD")
  dev.off()

# Answer to Question 2:
#   Overall, yes, the emissions have gone down from 1999 to 2008, however there was a significant
#   spike in emissions in 2005 that may warrant further investigation.
