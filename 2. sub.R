#function for subtracting of two numbers
sub_num <- function(a,b)
{
  return (a+b)
}

#calling the function for different inputs
result1 <- sub_num(5,10)
result2 <- sub_num(-3,7)
result3 <- sub_num(0,0)
result4 <- sub_num(3.5,2.1)

#printing the result
cat("Result of subtracting 5 and 10: ",result1, "\n")
cat("Result of subtracting -3 and 7: ",result2, "\n")
cat("Result of subtracting 0 and 0: ",result3, "\n")
