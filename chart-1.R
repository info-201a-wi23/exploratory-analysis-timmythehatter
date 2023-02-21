library(ggplot2)
library(scales)

# Load the data from the link
tax_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-timmythehatter/main/dataExplored.R")

# Calculate the total taxes paid per year
total_taxes <- with(tax_data, tapply(Taxable_Income, Tax_Year, sum))
total_taxes <- data.frame(year = as.numeric(names(total_taxes)), total_taxes = total_taxes)

# Create a line chart of total taxes paid per year
ggplot(data = total_taxes, aes(x = year, y = total_taxes, group = 1)) +
  geom_line(color = "blue") +
  geom_point(color = "blue", size = 3) +
  scale_x_continuous(breaks = seq(1960, 2020, 5)) +
  labs(title = "Total Taxes Paid per Year", x = "Year", y = "Total Taxes")


