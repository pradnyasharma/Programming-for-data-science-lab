
# Load library
library(ggplot2)
library(hexbin)

# Load dataset
data("midwest")
names(midwest)

# 1) Scatter Plot + Trend Line
p1 <- ggplot(midwest, aes(x = percollege, y = percadultpoverty)) +
  geom_point(color = "red", alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  ggtitle("College Education vs Adult Poverty") +
  xlab("% College Educated") +
  ylab("% Adult Poverty")

print(p1)

# 2) Bar Chart (Population by State)
p2 <- ggplot(midwest, aes(x = state, y = poptotal)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  ggtitle("Total Population by State") +
  xlab("State") +
  ylab("Population")

print(p2)

# 3) Hexagonal Heatmap
p3 <- ggplot(midwest, aes(x = percollege, y = percadultpoverty)) +
  geom_hex() +
  ggtitle("Hexbin: College Education vs Adult Poverty")

print(p3)

# 4) Shared Aesthetic Mapping + Override
base_plot <- ggplot(midwest, aes(x = percollege))

# Default mapping
p4a <- base_plot +
  geom_point(aes(y = percadultpoverty), color = "darkgreen") +
  ggtitle("Shared Aesthetic: Adult Poverty")

print(p4a)

# Override mapping (children poverty)
p4b <- base_plot +
  geom_point(aes(y = percchildbelowpovert), color = "purple") +
  ggtitle("Override: Child Poverty")

print(p4b)

# 5) Color Mapping by State
p5 <- ggplot(midwest, aes(x = percollege, y = percadultpoverty, color = state)) +
  geom_point() +
  ggtitle("Colored by State")

print(p5)

# 6) Custom Color + Transparency
p6 <- ggplot(midwest, aes(x = percollege, y = percadultpoverty)) +
  geom_point(color = "red", alpha = 0.4) +
  ggtitle("Custom Color (Red) with Transparency")

print(p6)
