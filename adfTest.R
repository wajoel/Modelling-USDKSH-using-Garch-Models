check_stationarity <- function(data, column_name) {
  # Load required library
  if (!requireNamespace("tseries", quietly = TRUE)) {
    install.packages("tseries")
  }
  library(tseries)
  
  # Extract the column as a time series
  series <- data[[column_name]]
  
  # Perform the ADF test
  adf_result <- adf.test(series, alternative = "stationary")
  
  # Extract results
  test_statistic <- adf_result$statistic
  p_value <- adf_result$p.value
  critical_values <- c(`1%` = -3.43, `2.5%` = -2.86, `5%` = -2.57) # Replace with actual critical values if different
  
  # Formulate conclusions for different significance levels
  conclusions <- sapply(names(critical_values), function(level) {
    threshold <- critical_values[level]
    if (test_statistic < threshold) {
      paste("Reject the null hypothesis (Stationary) at", level, "level")
    } else {
      paste("Fail to reject the null hypothesis (Non-stationary) at", level, "level")
    }
  })
  
  # Print results
  cat("\n--- ADF Test Results ---\n")
  cat("ADF Statistic:", test_statistic, "\n")
  cat("p-value:", p_value, "\n")
  cat("Critical Values:\n")
  for (level in names(critical_values)) {
    cat(" ", level, ":", critical_values[level], "\n")
  }
  cat("\nConclusions:\n")
  for (level in names(conclusions)) {
    cat(" ", conclusions[level], "\n")
  }
  
  # Return a list of results
  return(list(
    ADF_Statistic = test_statistic,
    p_value = p_value,
    Critical_Values = critical_values,
    Conclusions = conclusions
  ))
}


