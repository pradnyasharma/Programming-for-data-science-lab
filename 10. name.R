# Define the function
make_full_name <- function(first_name, last_name) {
  return(paste(first_name, last_name))
}

# Test the function with different sets of inputs
result1 <- make_full_name("John", "Doe")
result2 <- make_full_name("Alice", "Smith")
result3 <- make_full_name("Rahul", "Sharma")
result4 <- make_full_name("Emily", "Blunt")

# Print the test results
cat("Full name for John and Doe:", result1, "\n")
cat("Full name for Alice and Smith:", result2, "\n")
cat("Full name for Rahul and Sharma:", result3, "\n")
cat("Full name for Emily and Blunt:", result4, "\n")
