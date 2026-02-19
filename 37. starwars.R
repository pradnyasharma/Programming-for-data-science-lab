library(dplyr)

# Step 1: Load dataset
data("starwars", package = "dplyr")

# Step 2: Display first rows
head(starwars)

# Step 3: Summary statistics
summary(starwars[, c("height","mass")])

# Step 4: Structure
str(starwars)

# Step 5: Filter Human characters
human_data <- starwars %>%
  filter(species == "Human")

# Step 6: Calculate Lean Mass Index (LMI)
# LMI assumed similar to BMI: mass / (height in meters)^2
human_data <- human_data %>%
  mutate(LMI = mass / (height/100)^2)

# Step 7: Average LMI by homeworld
avg_lmi <- human_data %>%
  group_by(homeworld) %>%
  summarize(avg_LMI = mean(LMI, na.rm = TRUE))

print(avg_lmi)

# Step 8: Histogram of LMI
hist(human_data$LMI,
     breaks = 10,
     main = "Histogram of LMI (Human Characters)",
     xlab = "Lean Mass Index",
     col = "lightblue")

# Step 9: Density Plot grouped by homeworld
plot(density(na.omit(human_data$LMI)),
     main="Density Plot of LMI (Humans)",
     xlab="Lean Mass Index")

# Add density lines by homeworld
homeworlds <- unique(human_data$homeworld)

for(hw in homeworlds){
  hw_data <- human_data$LMI[human_data$homeworld == hw]
  hw_data <- na.omit(hw_data)
  if(length(hw_data) > 1){
    lines(density(hw_data))
  }
}

# Step 10: Height bins
human_data$Height_Bin <- cut(
  human_data$height,
  breaks = c(-Inf,150,180,210,Inf),
  labels = c("Below 150 cm","150–179 cm","180–209 cm","210 cm or above")
)

# Compute average LMI per height bin
bin_avg <- aggregate(LMI ~ Height_Bin,
                     data = human_data,
                     FUN = function(x) mean(x, na.rm=TRUE))

# Bar chart
barplot(bin_avg$LMI,
        names.arg = bin_avg$Height_Bin,
        main="Average LMI by Height Bin",
        xlab="Height Category",
        ylab="Average LMI",
        col="orange")
