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

# Answering Question 3:
#   Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, 
#   which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#   Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
#   a plot answer this question.

# Creating visualization
  png("plot3.png")
  g <- ggplot(data = summDF, aes(x = year, y = Emissions, color = type)) 
  g + geom_line(stat = "summary", fun.y = "sum") + ggtitle("Total Emissions in Baltimore from 1999 - 2008")
  dev.off()

# Answer to Question 3:
#   Fromo the graph, it appears that the most significant decreases in emissions occurred in Non-Point
#   and Point types.  Non-Road and On-Road experienced very little if any decrease in emissions during
#   this time period.