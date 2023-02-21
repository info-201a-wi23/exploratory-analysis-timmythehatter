library(ggplot2)
library(scales)
library(dplyr)

# Read the data from the CSV file
taxes <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-timmythehatter/main/STC_Historical_2021_cleaned.csv")

# Create a scatter plot
ggplot(data = taxes_per_year, aes(x = Year, y = average_taxes)) +
  geom_point(alpha = 2) +
  labs(title = "Average Taxes per Year",
       x = "Year",
       y = "Average Taxes (in millions of dollars)",
       caption = "Source: STC_Historical_2021_cleaned.csv") +
  theme_minimal() +
  scale_y_continuous(labels = label_number_si()) +
  expand_limits(y = 0)
  
