# This R file contains code to plot all taxes against all years as a stacked barplot 
library(ggplot2)

c2_data <- read_csv("/Users/autia/Desktop/College Books/Win 23/INFO 201/Final Project/exploratory-analysis-timmythehatter/STC_Historical_2021_cleaned.csv")

ggplot(c2_data, aes(fill=Year, y=, x = Name)) + 
  geom_bar(position="stack", stat="identity")
