library(dplyr)

# Step 1: Select relevant columns
data_selected <- starwars %>%
  select(name, species, height, mass, homeworld, gender)
print(data_selected)

# Step 2: Keep species with more than 2 characters
data_filtered <- data_selected %>%
  group_by(species) %>%
  filter(n() > 2)
print(data_filtered)

# Step 3: Create new columns
data_transformed <- data_filtered %>%
  mutate(
    height_m = height / 100,
    weight_category = case_when(
      mass < 60 ~ "Underweight",
      mass >= 60 & mass < 80 ~ "Normal",
      mass >= 80 & mass < 100 ~ "Overweight",
      mass >= 100 ~ "Obese",
      TRUE ~ NA_character_
    )
  )
print(data_filtered)

# Step 4: Average height for species-gender combination
avg_height_species_gender <- data_transformed %>%
  group_by(species, gender) %>%
  summarise(avg_height = mean(height, na.rm = TRUE))

print(avg_height_species_gender)

# Step 5: Top 3 species with highest average height
top_species_height <- data_transformed %>%
  group_by(species) %>%
  summarise(avg_height = mean(height, na.rm = TRUE)) %>%
  arrange(desc(avg_height)) %>%
  slice(1:3)

print(top_species_height)