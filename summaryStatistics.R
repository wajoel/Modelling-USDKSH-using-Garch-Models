# functions.R

# Load necessary libraries
library(dplyr)
library(e1071)  # For skewness and kurtosis

# Define the summary_statistics function
summary_statistics <- function(data) {
  # Calculate summary statistics for numeric columns
  stats <- data %>%
    summarise(
      Observations = n(),                          # Number of observations
      Mean = mean(Price, na.rm = TRUE),            # Mean
      Median = median(Price, na.rm = TRUE),        # Median
      SD = sd(Price, na.rm = TRUE),                # Standard Deviation
      Variance = var(Price, na.rm = TRUE),         # Variance
      Min = min(Price, na.rm = TRUE),              # Minimum
      Max = max(Price, na.rm = TRUE),              # Maximum
      Skewness = skewness(Price, na.rm = TRUE),    # Skewness
      Kurtosis = kurtosis(Price, na.rm = TRUE)     # Kurtosis
    )
  
  return(stats)
}
