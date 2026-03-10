library(dplyr)

# Step 1: Create Customers Dataset
customers <- data.frame(
  CustomerName = c("John Doe",
                   "Jane Smith",
                   "Robert Brown",
                   "Emily Davis",
                   "Michael Green"),
  
  Email = c("john.doe@example.com",
            "jane.smith@example.com",
            "robert.brown@example.com",
            "emily.davis@example.com",
            "michael.green@example.com"),
  
  stringsAsFactors = FALSE
)

# Step 2: Create Purchases Dataset
purchases <- data.frame(
  CustomerName = c("John Doe",
                   "Jane Smith",
                   "Robert Brown",
                   "Sarah Johnson",
                   "Emily Davis"),
  
  PurchaseAmount = c(150, 200, 120, 180, 220),
  
  Date = as.Date(c("2023-01-01",
                   "2023-01-02",
                   "2023-01-03",
                   "2023-01-04",
                   "2023-01-05")),
  
  stringsAsFactors = FALSE
)

# Display datasets
print(customers)
print(purchases)

# Left Join
left_join_result <- left_join(customers, purchases, by = "CustomerName")
print(left_join_result)

# Right Join
right_join_result <- right_join(customers, purchases, by = "CustomerName")
print(right_join_result)

# Inner Join
inner_join_result <- inner_join(customers, purchases, by = "CustomerName")
print(inner_join_result)

# Full Outer Join
full_join_result <- full_join(customers, purchases, by = "CustomerName")
print(full_join_result)