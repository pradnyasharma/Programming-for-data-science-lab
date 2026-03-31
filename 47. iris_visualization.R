# 1) Install and Load Libraries
packages <- c("ggplot2","plotly","htmlwidgets")

for(p in packages){
  if(!require(p, character.only = TRUE)){
    install.packages(p)
    library(p, character.only = TRUE)
  }
}

# 2) Load Dataset
data(iris)

# 3) Static Plot (ggplot2)
p <- ggplot(iris, aes(x = Sepal.Width, y = Petal.Width, color = Species)) +
  geom_point(size = 3) +
  ggtitle("Static Scatter Plot (ggplot2)") +
  xlab("Sepal Width") +
  ylab("Petal Width")

print(p)

# 4) Convert to Interactive (ggplotly)
interactive_plot <- ggplotly(p)

# 5) Interactive Plot using plot_ly()
plotly_plot <- plot_ly(
  data = iris,
  x = ~Sepal.Width,
  y = ~Petal.Width,
  color = ~Species,
  type = "scatter",
  mode = "markers"
) %>%
  layout(
    title = "Iris Data Set Visualization",
    xaxis = list(title = "Sepal Width", ticksuffix = " cm"),
    yaxis = list(title = "Petal Width", ticksuffix = " cm")
  )

# 6) SAVE + OPEN 
library(htmlwidgets)

# Save both plots
saveWidget(interactive_plot, "ggplotly_iris.html", selfcontained = TRUE)
saveWidget(plotly_plot, "plotly_iris.html", selfcontained = TRUE)

# Open in browser
browseURL("plotly_iris.html")
