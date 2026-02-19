# Function to get floating point input from the user
getfloatinpt <- function() {
  user_input <- readline(prompt = "Enter a floating point number: ")
  float_input <- as.numeric(user_input)
  return(float_input)
}

# Call the function (user enters value when prompted)
result <- getfloatinpt()

# Print the result
cat("You entered the floating point number:", result, "\n")
