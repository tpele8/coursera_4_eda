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

# Answering Question 4:
#   Across the United States, how have emissions from coal combustion-related sources changed 
#   from 1999–2008?

# Determining which columns hold the coal combustion-related data
  test <- sccDF %>% distinct(EI.Sector)

# Filtering the sccDF dataframe to only contain the coal based sources
  sccDFMod <- slice(sccDF, grep(pattern = "Coal+", x = sccDF$EI.Sector, value = FALSE))

# Joining the sccDFMod and the summDF dataframes
  summDF$SCC <- factor(summDF$SCC)
  combinedDF <- inner_join(summDF, sccDFMod, by = "SCC")
  combinedDFSum <- tapply(combinedDF$Emissions, combinedDF$year, FUN = sum)

# Plotting the data to determine the answer
  png("plot4.png")
  plot(names(combinedDFSum), combinedDFSum, type = "l", ylab = "Coal Combustion-Related Emissions", xlab = "Year", main = "Emissions From Coal Combustion-Related Sources by Year")
  dev.off()
  
# Answer to Question 4:
#   Emissions from coal combustion related sources stayed fairly steady between the years 1998 and 2005
#   hovering around 550,000, but since then they dropped drasticallyl until in 2008 they reached a low
#   of close to 350,000.
