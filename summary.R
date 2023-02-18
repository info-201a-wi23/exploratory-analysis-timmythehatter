# Load Libraries

library("dplyr")
library("stringr")
library("tidyverse")

# Load Data Sets
taxes <- read.csv("C:/Users/Tim/Documents/Info201code/final-project-proposal-timmythehatter/STC_Historical_2021_cleaned.csv")
energy <-read.csv("https://www.eia.gov/state/seds/sep_use/total/csv/use_all_phy.csv")

# Remove X's from years in energy dataframe
colnames(energy) <- sub("X", "", colnames(energy))

# Remove all commas from taxes
taxes <- taxes%>%mutate(C105 = str_replace_all(taxes$C105, ",", ""))
taxes <- taxes%>%mutate(T15 = str_replace_all(taxes$T15, ",", ""))

# Remove first row of taxes
taxes_removed <- taxes%>%slice(-1)

# Number of columns in energy -3 (to calculate the years evaluated)
num_years_energy_data <- ncol(energy) - 3

# Number of years evaluated in taxes
num_years_tax_data <- taxes%>%summarise(num_years = length(unique(Year)))%>%pull(num_years)

# Maximum tax collected
max_tax <- taxes_removed%>%filter(C105 == max(C105))%>%pull(C105)

# Number of observations in Energy ie different categories of energy usage
num_categories_energy <- nrow(energy)

# Number of columns in taxes - 4 ie different categories of taxes collected
num_categories_taxes <- ncol(taxes) - 4
                                                         