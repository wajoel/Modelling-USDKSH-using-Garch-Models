# Time series plot function for all features (dynamic columns)
time_series_plot <- function(data) {
  # Select all numeric columns excluding the 'Date' column
  numeric_columns <- names(data)[sapply(data, is.numeric)]
  
  # Create the base plot with Date on x-axis
  p <- ggplot(data, aes(x = as.Date(Date, format = "%m/%d/%Y"))) +
    theme_minimal() +
    labs(
      title = "Daily EUR/USD",
      x = "Time",
      y = "Price",
      color = "Variable"
    ) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate date labels
  
  # Add a line for each numeric column
  for (col in numeric_columns) {
    p <- p + geom_line(aes(y = .data[[col]], color = col))  # Using .data[[col]] for dynamic column referencing
  }
  
  # Print the plot
  print(p)
}
