#function for addition of two numbers
add_num <- function(a,b)
{
  return (a+b)
}

#calling the function for different inputs
result1 <- add_num(5,10)
result2 <- add_num(-3,7)
result3 <- add_num(0,0)
result4 <- add_num(3.5,2.1)

#printing the result
cat("Result of adding 5 and 10: ",result1, "\n")
cat("Result of adding -3 and 7: ",result2, "\n")
cat("Result of adding 0 and 0: ",result3, "\n")
cat("Result of adding 3.5 and 2.1: ",result4, "\n")

