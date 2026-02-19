# Create a list of books and their borrowers
library_books <- list(
  "The Hobbit" = c("Alice", "Bob"),
  "1984" = c("Charlie", "Alice"),
  "Moby Dick" = c("Bob")
)

# 1. Add a new book with borrowers
library_books[["Harry Potter"]] <- c("David", "Emma")

# 2. Remove a book from the system
library_books[["Moby Dick"]] <- NULL

# 3. Calculate total number of borrowers for each book
borrower_count <- sapply(library_books, length)

# 4. Find book with highest and lowest number of borrowers
highest_borrowed_book <- names(which.max(borrower_count))
lowest_borrowed_book <- names(which.min(borrower_count))

# Print results
cat("Total number of borrowers for each book:\n")
print(borrower_count)

cat("\nBook with highest number of borrowers:", highest_borrowed_book, "\n")
cat("Book with lowest number of borrowers:", lowest_borrowed_book, "\n")
