# Define the function
calculate_square <- function(number) {
  return(number * number)
}

# Test the function with different sets of inputs
num1 <- 4
num2 <- -3
num3 <- 0
num4 <- 5.7

result1 <- calculate_square(num1)
result2 <- calculate_square(num2)
result3 <- calculate_square(num3)
result4 <- calculate_square(num4)

# Print the test results
cat("Square of 4:", result1, "\n")
cat("Square of -3:", result2, "\n")
cat("Square of 0:", result3, "\n")
cat("Square of 5.7:", result4, "\n")
