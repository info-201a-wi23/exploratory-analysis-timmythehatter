# Load Libraries

library("dplyr")
library("stringr")
library("tidyverse")

# Load Data Sets
taxes <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-timmythehatter/main/STC_Historical_2021_cleaned.csv")
energy <- read.csv("https://www.eia.gov/state/seds/sep_use/total/csv/use_all_phy.csv")

# Remove X's from years in energy dataframe
colnames(energy) <- sub("X", "", colnames(energy))

# Remove all commas from taxes
taxes <- taxes%>%mutate(C105 = str_replace_all(taxes$C105, ",", ""))
taxes <- taxes%>%mutate(T15 = str_replace_all(taxes$T15, ",", ""))

# Remove first row of taxes
taxes_removed <- taxes%>%slice(-1)

# Find the total per year of energy used
energy_per_year <- apply(energy[, 4:length(energy)], 2, sum, na.rm = TRUE)
energy_per_year <- data.frame(energy_per_year)
years <- data.frame(Year = as.numeric(row.names(energy_per_year)))
energy_per_year <- cbind(energy_per_year, years)

# Find the taxes per year
taxes_per_year <- taxes_removed%>%group_by(Year)%>%summarize(average_taxes = mean(as.double(C105), na.rm = TRUE))

# Public Utility Tax per year
utility_per_year <- taxes_removed%>%group_by(Year)%>%summarize(average_taxes = mean(as.double(T15), na.rm = TRUE))

# Ratio Per Year of Taxes to Energy
tax_v_energy <- left_join(energy_per_year, taxes_per_year, by = "Year")
tax_v_enery_ratio <- tax_v_energy%>%mutate(ratio = average_taxes / energy_per_year)

# Utility Tax v energy
utax_v_energy <- left_join(energy_per_year, utility_per_year, by = "Year")
utax_v_enery_ratio <- utax_v_energy%>%mutate(ratio = average_taxes / energy_per_year)

