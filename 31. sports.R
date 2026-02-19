# Create a list of teams and their scores
teams <- list(
  "Team A" = c(90, 85, 88),
  "Team B" = c(78, 82, 79),
  "Team C" = c(88, 92, 90)
)

# 1. Add a new team with scores
teams[["Team D"]] <- c(91, 89, 93)

# 2. Remove a team from the list
teams[["Team B"]] <- NULL

# 3. Calculate average score for each team
average_scores <- sapply(teams, mean)

# 4. Rank teams based on average scores (highest to lowest)
ranked_teams <- sort(average_scores, decreasing = TRUE)

# Print results
cat("Average score for each team:\n")
print(round(average_scores, 2))

cat("\nTeam rankings based on average scores:\n")
print(round(ranked_teams, 2))
