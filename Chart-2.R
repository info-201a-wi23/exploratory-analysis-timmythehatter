# This R file contains code to plot all taxes against all years as a stacked barplot 
library(ggplot2)
library(scales)

source("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-timmythehatter/main/dataExplored.R")

c2_data <- taxes_removed %>% filter(Name != "US STATE GOVTS")
c2_data <- c2_data %>% filter(Name != "HI STATE GOVT (exhibit)")
c2_data <- c2_data %>% filter(Name != "AK STATE GOVT (exhibit)")

ggplot(data = c2_data) + 
  geom_col(aes(y = as.numeric(C105), x = Name, fill=Year))+ 
  theme(axis.text.x = element_text(size = 7, angle = 45, hjust = 1)) + 
  labs(x = "State Govt", y = "Taxes every year") + 
  scale_y_continuous(labels = label_number_si())

