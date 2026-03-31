
# 1) Install and Load ggplot2
if(!require(ggplot2)){
  install.packages("ggplot2")
  library(ggplot2)
} else {
  library(ggplot2)
}

# 2) Create Dataset
data <- data.frame(
  a = 1:10,
  b = c(-0.06255147, 0.69577692, 0.54925271, -0.18723665,
        0.13819408, 0.48775542, 0.31924104, 0.85842312,
        -0.44658948, 0.77177795),
  label = c("k","l","m","n","o","p","q","r","s","t")
)

print(data)

# 3a) Scatter Plot
scatter_plot <- ggplot(data, aes(x = a, y = b)) +
  geom_point() +
  ggtitle("Scatter Plot of a vs b") +
  xlab("Variable a") +
  ylab("Variable b")

print(scatter_plot)

# 3b) Customized Line Plot
line_plot <- ggplot(data, aes(x = a, y = b)) +
  geom_line(color = "red", size = 1.2) +
  ggtitle("Customized Line Plot") +
  xlab("Variable a") +
  ylab("Variable b")

print(line_plot)

# 3c) Customized Bar Plot
bar_plot <- ggplot(data, aes(x = factor(a), y = b)) +
  geom_bar(stat = "identity", fill = "blue") +
  ggtitle("Customized Bar Plot") +
  xlab("Variable a (Category)") +
  ylab("Value of b")

print(bar_plot)

# 3d) Scatter Plot with Smooth Line
smooth_plot <- ggplot(data, aes(x = a, y = b)) +
  geom_point(color = "darkgreen", size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  ggtitle("Scatter Plot with Regression Line") +
  xlab("Variable a") +
  ylab("Variable b")

print(smooth_plot)
