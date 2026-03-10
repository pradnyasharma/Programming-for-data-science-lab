library(dplyr)

# Step 1: Create Donors Dataset
donors <- data.frame(
  name = c("Alice", "Bob", "Charlie", "David", "Emma"),
  email = c("alice@gmail.com",
            "bob@gmail.com",
            "charlie@gmail.com",
            "david@gmail.com",
            "emma@gmail.com"),
  stringsAsFactors = FALSE
)

# Step 2: Create Donations Dataset
donations <- data.frame(
  name = c("Alice", "Bob", "Charlie", "Eve", "Frank"),
  donation_amount = c(100, 200, 300, 150, 250),
  donation_date = as.Date(c("2024-01-10",
                            "2024-02-15",
                            "2024-03-20",
                            "2024-04-05",
                            "2024-05-01")),
  stringsAsFactors = FALSE
)

# Step 3: Donors who made contributions
donors_with_donations <- inner_join(donors, donations, by = "name")
print(donors_with_donations)

# Step 4: Donations with missing donor details
missing_donor_details <- anti_join(donations, donors, by = "name")
print(missing_donor_details)

# Step 5: Perfect matches between both datasets
perfect_matches <- inner_join(donors, donations, by = "name")
print(perfect_matches)

# Step 6: Records without matching counterparts
all_records <- full_join(donors, donations, by = "name")
print(all_records)

# Additional Insights
# Donors without donations
donors_without_donations <- anti_join(donors, donations, by = "name")
print(donors_without_donations)

# Total donations per donor
donation_summary <- donations %>%
  group_by(name) %>%
  summarise(total_donated = sum(donation_amount))

print(donation_summary)