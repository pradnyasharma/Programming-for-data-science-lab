# STUDENT MARKS ANALYTICS SYSTEM (BASE R ONLY)

# TASK 1 — Create Data Frame

# Character vectors
RegNo <- c("24BCE1001","24BCE1002","24BCE1003","24BCE1004","24BCE1005",
           "24BCE1006","24BCE1007","24BCE1008","24BCE1009","24BCE1010")

Name <- c("Aadesh Kumar","Bhavya Reddy","Charan Iyer","Divya Sharma",
          "Esha Nair","Farhan Khan","Gayathri Raj",
          "Harish Kumar","Ishita Menon","Jai Verma")

Programme <- rep("B.Tech", 10)

Specialization <- c("CSE","AI","DS","IT","CSE",
                    "ECE","Cyber","AI","DS","IT")

# Numeric vectors
Assess1 <- c(18,15,20,14,20,12,17,16,19,18)
Assess2 <- c(17,16,19,15,20,14,18,17,18,17)
Assess3 <- c(19,14,18,15,19,13,17,16,19,16)
Assess4 <- c(18,18,20,16,20,16,19,15,18,19)

# Combine into data frame
students <- data.frame(
  RegNo,
  Name,
  Programme,
  Specialization,
  Assess1,
  Assess2,
  Assess3,
  Assess4,
  stringsAsFactors = FALSE
)

cat("\nSTRUCTURE OF STUDENTS DATA\n")
str(students)

cat("\nHEAD OF STUDENTS DATA\n")
print(head(students))

# TASK 2 — Write Input CSV

write.csv(students,
          file = "students_input.csv",
          row.names = FALSE,
          na = "")

# TASK 3 — Read CSV for Analytics

students_in <- read.csv("students_input.csv",
                        stringsAsFactors = FALSE)

# Validate required columns
required_cols <- c("RegNo","Name","Programme","Specialization",
                   "Assess1","Assess2","Assess3","Assess4")

if (!all(required_cols %in% colnames(students_in))) {
  stop("Required columns missing in CSV file!")
}

# Ensure assessment columns are numeric
assessment_cols <- c("Assess1","Assess2","Assess3","Assess4")
students_in[assessment_cols] <-
  lapply(students_in[assessment_cols], as.numeric)

# TASK 4 — Per-Student Analytics

# Total
students_in$Total <-
  rowSums(students_in[assessment_cols], na.rm = TRUE)

# Average
students_in$Average <- students_in$Total / 4

# Rank (Highest Total = Rank 1)
students_in$Rank <-
  rank(-students_in$Total, ties.method = "min")

# Sort by Rank, then RegNo to stabilize ties
students_sorted <-
  students_in[order(students_in$Rank,
                    students_in$RegNo), ]

# Save ranked students
write.csv(students_sorted,
          file = "students_by_rank.csv",
          row.names = FALSE)


# TASK 5 — Assessment-Wise Averages

assessment_avg_vector <-
  colMeans(students_in[assessment_cols],
           na.rm = TRUE)

assessment_avg_df <- data.frame(
  Assessment = names(assessment_avg_vector),
  Average = as.numeric(assessment_avg_vector),
  row.names = NULL
)

write.csv(assessment_avg_df,
          file = "assessment_wise_averages.csv",
          row.names = FALSE)

# TASK 6 — Specialization-Wise Averages

spec_avg <- aggregate(
  students_in[assessment_cols],
  by = list(Specialization =
              students_in$Specialization),
  FUN = function(x) mean(x, na.rm = TRUE)
)

# Add overall average
spec_avg$Overall_Average <-
  rowMeans(spec_avg[assessment_cols], na.rm = TRUE)

# Sort by Overall_Average descending
spec_avg <-
  spec_avg[order(-spec_avg$Overall_Average), ]

write.csv(spec_avg,
          file = "specialization_wise_averages.csv",
          row.names = FALSE)

