library(jsonlite)

# Set working directory
setwd(getwd())

# Read existing inventory
inventory <- fromJSON("inventory.json")

print(inventory)

# Add new product
new_product <- data.frame(
  product_id = 105,
  name = "Wireless Mouse",
  category = "Electronics",
  price = 25.99,
  stock = 120
)

updated_inventory <- rbind(inventory, new_product)

# Write updated inventory
write_json(updated_inventory,
           path = "updated_inventory.json",
           pretty = TRUE,
           auto_unbox = TRUE)

# Verify updated file
verified_inventory <- fromJSON("updated_inventory.json")

print(verified_inventory)
