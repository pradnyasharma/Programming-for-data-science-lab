# 1) Install and Load ggplot2
if(!require(ggplot2)){
  install.packages("ggplot2")
  library(ggplot2)
} else {
  library(ggplot2)
}

# 2) Create Dataframe
plant_data <- data.frame(
  Plant_ID = c(1,2,3,4,5),
  Growth_Rate = c(3.2, 1.8, 2.6, 0.9, 3.8),
  Condition_Label = c("Sunny","Shade","Rainy","Drought","Cloudy")
)

print(plant_data)

# 3) Create Scatter Plot
plot <- ggplot(plant_data, aes(x = Plant_ID, y = Growth_Rate)) +
  
  # Points
  geom_point(color = "dodgerblue", size = 4) +
  
  # Labels below points
  geom_text(aes(label = Condition_Label),
            color = "darkorange",
            vjust = 1.5) +
  
  # Titles and labels
  ggtitle("Scatter Plot of Plant Growth Data") +
  xlab("Plant ID") +
  ylab("Growth Rate")

print(plot)
