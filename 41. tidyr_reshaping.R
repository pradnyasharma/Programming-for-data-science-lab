library(tidyr)
library(dplyr)

# Create messy dataset
messy <- data.frame(
  StudentID = 1:4,
  Name      = c("Alice", "Bob", "Charlie", "Dana"),
  Math_2020 = c(85, 90, NA, 70),
  Math_2021 = c(88, NA, 78, 75),
  Eng_2020  = c(80, 92, 85, NA),
  Eng_2021  = c(82, 95, NA, 77),
  ExtraInfo = c("A-2020-S1", "B-2021-S2", "C-2020-S1", NA),
  stringsAsFactors = FALSE
)

print(messy)

# gather(): Wide to Long
long1 <- messy %>%
  gather(key = "SubjectYear", value = "Score", Math_2020:Eng_2021)

# separate(): Split SubjectYear
long2 <- long1 %>%
  separate(col = SubjectYear, into = c("Subject","Year"), sep = "_")

# drop_na(): Remove missing scores
long_clean <- long2 %>%
  drop_na(Score)

# Optional parsing of ExtraInfo
long_parsed <- long_clean %>%
  separate(ExtraInfo,
           into = c("Initial","InfoYear","Section"),
           sep = "-",
           remove = FALSE)

# spread(): Long to Wide
wide_by_year <- long_parsed %>%
  select(StudentID, Name, Subject, Year, Score) %>%
  spread(key = Year, value = Score)

# unite(): Combine Name and Subject
wide_united <- wide_by_year %>%
  unite("Name_Subject", Name, Subject, sep = " - ")

print(wide_united)

# Example for fill()
progress <- data.frame(
  StudentID  = c(1,1,1,2,2,2,3,3),
  Term       = c("T1","T2","T3","T1","T2","T3","T1","T2"),
  Attendance = c("Present", NA, NA, "Absent", NA, "Present", NA, "Present"),
  stringsAsFactors = FALSE
)

progress_filled <- progress %>%
  group_by(StudentID) %>%
  arrange(Term, .by_group = TRUE) %>%
  fill(Attendance, .direction = "down") %>%
  ungroup()

print(progress_filled)