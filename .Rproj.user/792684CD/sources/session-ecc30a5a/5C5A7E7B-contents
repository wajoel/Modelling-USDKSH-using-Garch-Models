# main.R
options(warn = -1)
# Load necessary libraries
library(readr)

# Source the functions.R script
source("currencies.R")  # Update the path to where functions.R is located

# Read the data
data <- read_csv("C:/Users/BRAILER/Downloads/EUR_USDHistoricalData.csv")

# Call the clean_data function
processed_data <- clean_data(data, to_clipboard = FALSE)
head(processed_data, 10)