# Step 1: Load dataset
data(iris)

# Step 2: Display first few rows
head(iris)

# Step 3: Summary statistics
summary(iris)

# Step 4: Structure of dataset
str(iris)

# Step 5: Basic plot (Sepal Length vs index)
plot(iris$Sepal.Length, type="l",
     main="Sepal Length over Index",
     xlab="Index",
     ylab="Sepal Length")

# Step 6: Handle missing data
iris_clean <- na.omit(iris)
head(iris_clean)

# Step 7: Scatter plot
plot(iris_clean$Sepal.Length,
     iris_clean$Petal.Length,
     main="Sepal Length vs Petal Length",
     xlab="Sepal Length",
     ylab="Petal Length")

# Add regression line
model <- lm(Petal.Length ~ Sepal.Length, data=iris_clean)
abline(model)

# Step 8: Create bins for Sepal Length
iris_clean$Sepal_Bin <- cut(
  iris_clean$Sepal.Length,
  breaks=c(-Inf,5.0,6.0,7.0,Inf),
  labels=c("Below 5.0","5.0-5.9","6.0-6.9","7.0 and above")
)

# Boxplot
boxplot(Petal.Length ~ Sepal_Bin,
        data=iris_clean,
        main="Petal Length across Sepal Length Bins",
        xlab="Sepal Length Bins",
        ylab="Petal Length")
