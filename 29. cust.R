# Create a list of customers and their purchases
customers <- list(
  Alice = c(200, 150, 300),
  Bob = c(100, 80, 150),
  Charlie = c(250, 300, 100)
)

# 1. Add a new customer and purchases
customers$David <- c(180, 220)

# 2. Remove a customer
customers$Bob <- NULL

# 3. Calculate total purchase amount for each customer
total_purchases <- sapply(customers, sum)

# 4. Find customer with highest and lowest total purchases
highest_customer <- names(which.max(total_purchases))
lowest_customer <- names(which.min(total_purchases))

# Print results
cat("Total purchase amount for each customer:\n")
print(total_purchases)

cat("\nCustomer with highest total purchases:", highest_customer, "\n")
cat("Customer with lowest total purchases:", lowest_customer, "\n")
