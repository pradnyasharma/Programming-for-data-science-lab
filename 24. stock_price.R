# Given closing prices
closing_prices <- c(
  120, 122, 118, 121, 119, 117, 123, 125, 126, 124,
  128, 130, 129, 131, 135, 134, 136, 137, 140, 138,
  139, 141, 142, 144, 143, 145, 146, 148, 147, 149
)

# Calculate daily returns (percentage change)
daily_returns <- diff(closing_prices) / closing_prices[-length(closing_prices)] * 100

# Identify highest and lowest returns
highest_return <- max(daily_returns)
lowest_return <- min(daily_returns)

highest_day <- which.max(daily_returns) + 1
lowest_day <- which.min(daily_returns) + 1

# Calculate cumulative return over the month
cumulative_return <- (last(closing_prices) - first(closing_prices)) / first(closing_prices) * 100

# Print results
cat("Daily Returns (%):\n")
print(round(daily_returns, 2))

cat("\nHighest daily return:", round(highest_return, 2), "% on Day", highest_day, "\n")
cat("Lowest daily return:", round(lowest_return, 2), "% on Day", lowest_day, "\n")

cat("\nCumulative return over the month:", round(cumulative_return, 2), "%\n")
