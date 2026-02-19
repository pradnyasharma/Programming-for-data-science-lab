install.packages("dplyr")
library(dplyr)

#step 1: load dataset and see details
data("starwars", package = "dplyr")
View(starwars)
dim(starwars)
ncol(starwars)
nrow(starwars)
head(starwars)
tail(starwars)

#step 2: view only name, species, height, mass, homeworld columns
starwars_data <- starwars%>%
  select(name, species,height,mass, homeworld)
View(starwars_data)

#step 3: view only the human characters
human_data <- starwars%>%
  filter(species == "Human")
View(human_data)

#step 4: calculate BMI and store in a new column for all humans
human_data <- human_data%>%
  mutate(BMI = mass/(height/100)^2)
View(human_data)  

#step 5: average BMI
summary_data <- human_data%>%
  group_by(homeworld)%>%
  summarize(avg_BMI = mean(BMI, na.rm = TRUE))
View(summary_data)