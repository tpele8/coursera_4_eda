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

# Answering Question 5:
#   How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
  
# Slicing the data to match the regEx expression for vehicles
  sccDFMod2 <- slice(sccDF, grep(pattern = "Vehicle+", x = sccDF$EI.Sector, value = FALSE))

# Creating joined dataset between datasets
  combinedDF2 <- inner_join(summDF, sccDFMod2, by = "SCC")
  combinedDF2Filtered <- combinedDF2[combinedDF2$fips == "24510",]
  combinedDF2FilteredSum <- tapply(combinedDF2Filtered$Emissions, combinedDF2Filtered$year, FUN = sum)

# Creating plot to visualize the results
  png("plot5.png")
  plot(names(combinedDF2FilteredSum), combinedDF2FilteredSum, type = "l", ylab = "MV Source Emissions", 
       xlab = "Year", main = "Emissions From Motor Vehicle Sources in Baltimore by Year")
  dev.off()
  
# Answer to Question 5:
#   Emissions dropped drastically from 1998 to 2002 from around 350 to 150, then remained steady from 
#   2002 through 2005 and dropped again in 2005 to 2008 levels of less than 100

  
  
  