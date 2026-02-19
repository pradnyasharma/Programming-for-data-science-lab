# TASK 1 — Create Vectors
PatientID <- c("HOS1001","HOS1002","HOS1003","HOS1004","HOS1005",
               "HOS1006","HOS1007","HOS1008","HOS1009","HOS1010")

Name <- c("Arjun Menon","Bhavana Iyer","Chirag Gupta","Devika Nair",
          "Eshwar Rao","Farida Sheikh","Gaurav Kumar",
          "Harini Krishnan","Ishita S","Jatin Verma")

Department <- c("Cardiology","Neurology","Endocrinology","Pulmonology",
                "Cardiology","Endocrinology","Neurology",
                "Pulmonology","Cardiology","Endocrinology")

Diagnosis <- c("Hypertension","Migraine","Type-2 Diabetes","Asthma",
               "Hypertension","Thyroid Disorder","Epilepsy",
               "COPD","Arrhythmia","Type-1 Diabetes")

Test1 <- c(82,71,90,64,95,60,78,68,87,83)
Test2 <- c(76,69,92,70,94,63,82,72,85,79)
Test3 <- c(88,73,86,67,93,61,79,70,90,77)
Test4 <- c(84,75,91,72,96,66,81,69,88,85)

Test3_Score <- Test3

# TASK 2 — Build Data Frame

patients <- data.frame(
  PatientID,
  Name,
  Department,
  Diagnosis,
  Test1,
  Test2,
  Test3,
  Test4,
  Test3_Score,
  stringsAsFactors = FALSE
)

cat("\nSTRUCTURE\n")
str(patients)

cat("\nHEAD\n")
print(head(patients))


# TASK 3 — Patient-Level Metrics

# Select test columns
test_cols <- c("Test1","Test2","Test3","Test4")

# Sum (vectorized)
patients$Sum <- rowSums(patients[, test_cols])

# Average
patients$Average <- round(patients$Sum / 4, 2)

# Rank (Highest Sum = Rank 1)
patients$Rank <- rank(-patients$Sum, ties.method = "min")

cat("\nFULL DATA WITH SUM, AVG, RANK\n")
print(patients)

cat("\nSORTED BY RANK\n")
print(patients[order(patients$Rank), ])

# TASK 4 — Test-Wise Average

test_wise_avg <- colMeans(patients[, test_cols], na.rm = TRUE)

cat("\nTEST-WISE AVERAGE\n")
print(round(test_wise_avg, 2))

# TASK 5 — Department-Wise Averages

dept_test_avg <- aggregate(
  patients[, test_cols],
  by = list(Department = patients$Department),
  FUN = function(x) mean(x, na.rm = TRUE)
)

# Overall average across 4 tests
dept_test_avg$Overall_Average <- 
  rowMeans(dept_test_avg[, test_cols], na.rm = TRUE)

# Sort descending by overall average
dept_test_avg <- 
  dept_test_avg[order(-dept_test_avg$Overall_Average), ]

cat("\nDEPARTMENT-WISE AVERAGES\n")
dept_test_avg[, -1] <- round(dept_test_avg[, -1], 2)
print(dept_test_avg)

