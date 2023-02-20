library(ggplot2)
library(scales)

source("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-timmythehatter/main/dataExplored.R")

ggplot(data = energy_per_year) +
  geom_line(aes(x = Year, y = energy_per_year)) +
  labs(title = "U.S. Energy Use Per Year (1960-2020)", x = "Year", y = "Energy Use Per Year (in physical units)") +
  scale_x_continuous(breaks = seq(1960, 2020, 5)) +
  scale_y_continuous(labels = label_number_si())