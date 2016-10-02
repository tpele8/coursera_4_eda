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

# Answering Question 6:
#   Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
#   sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater 
#   changes over time in motor vehicle emissions?

# Slicing the data to match the regEx expression for vehicles
  sccDFMod <- slice(sccDF, grep(pattern = "Vehicle+", x = sccDF$EI.Sector, value = FALSE))

# Creating dataset for Baltimore data
  combinedDF2 <- inner_join(summDF, sccDFMod, by = "SCC")
  combinedDF2Filtered <- combinedDF2[combinedDF2$fips == "24510",]
  combinedDF2FilteredSum <- tapply(combinedDF2Filtered$Emissions, combinedDF2Filtered$year, FUN = sum)

# Creating dataset for LA data
  combinedDF2FilteredLA <- combinedDF2[combinedDF2$fips == "06037",]
  combinedDF2FilteredLASum <- tapply(combinedDF2FilteredLA$Emissions, combinedDF2FilteredLA$year, FUN = sum)

# Creating plot to visualize the data
  png("plot6.png")
  par(mfrow = c(1,2))
  plot(names(combinedDF2FilteredSum), combinedDF2FilteredSum, col = "red", type = "l", ylab = "MV Source Emissions", 
       xlab = "Year", main = "Baltimore")
  plot(names(combinedDF2FilteredLASum), combinedDF2FilteredLASum, col = "blue", type = "l", ylab = "MV Source Emissions", 
       xlab = "Year", main = "LA")
  dev.off()
  
# Answer to Question 6:
#   While Baltimore's emission levels dropped from around 350 to less than 100, the emission levels
#   from LA rose dramatically from 1998 to 2005 from about 3900 to bout 4600, the dropped from 2006
#   to 2008 to about 4100.

