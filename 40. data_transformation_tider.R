library(tidyr)

# PART 1: Wide → Long Transformation

# Create wide dataset
wide_data <- data.frame(
  ID = c(1,2,3),
  Year2019 = c(10,15,20),
  Year2020 = c(12,18,24)
)

print(wide_data)

# Convert wide to long
long_data <- gather(
  data = wide_data,
  key = "Year",
  value = "Value",
  Year2019, Year2020
)

print(long_data)

# PART 2: Long → Wide Transformation

# Create long dataset
long_format <- data.frame(
  ID = c(1,1,2,2,3,3),
  Year = c(2019,2020,2019,2020,2019,2020),
  Value = c(10,12,15,18,20,24)
)

print(long_format)

# Convert long to wide
wide_format <- spread(
  data = long_format,
  key = Year,
  value = Value
)

print(wide_format)