# Sample sensor readings for 60 minutes
temperature <- c(28, 29, 30, 31, 32, 33, 29, 28, 27, 31,
                 32, 34, 35, 33, 31, 30, 29, 28, 27, 26,
                 31, 32, 33, 34, 35, 36, 34, 33, 32, 31,
                 30, 29, 28, 27, 26, 25, 31, 32, 33, 34,
                 35, 36, 37, 35, 34, 33, 32, 31, 30, 29,
                 28, 27, 26, 25, 24, 23, 22, 21, 20, 19)

humidity <- c(45, 44, 43, 42, 41, 39, 38, 37, 36, 35,
              34, 33, 32, 31, 30, 29, 40, 42, 44, 46,
              38, 36, 35, 34, 33, 32, 31, 30, 29, 28,
              45, 44, 43, 42, 41, 40, 39, 38, 37, 36,
              35, 34, 33, 32, 31, 30, 29, 28, 27, 26,
              25, 24, 23, 22, 21, 20, 19, 18, 17, 16)

pressure <- c(1010, 1011, 1012, 1011, 1013, 1014, 1015, 1013, 1012, 1011,
              1010, 1009, 1008, 1007, 1006, 1005, 1006, 1007, 1008, 1009,
              1010, 1011, 1012, 1013, 1014, 1015, 1016, 1015, 1014, 1013,
              1012, 1011, 1010, 1009, 1008, 1007, 1006, 1005, 1004, 1003,
              1002, 1001, 1000, 999, 998, 997, 996, 995, 994, 993,
              992, 991, 990, 989, 988, 987, 986, 985, 984, 983)

time <- 1:60   # minutes

# 1. Calculate average readings
avg_temp <- mean(temperature)
avg_humidity <- mean(humidity)
avg_pressure <- mean(pressure)

# 2. Identify time intervals
critical_intervals <- which(temperature > 30 & humidity < 40)

# 3. Plot sensor readings
plot(time, temperature, type = "l", xlab = "Time (minutes)", ylab = "Reading",
     main = "Sensor Readings Over Time")
lines(time, humidity)
lines(time, pressure)

# Print results
cat("Average Temperature:", round(avg_temp, 2), "°C\n")
cat("Average Humidity:", round(avg_humidity, 2), "%\n")
cat("Average Pressure:", round(avg_pressure, 2), "hPa\n")

cat("\nTime intervals where Temperature > 30°C and Humidity < 40%:\n")
print(critical_intervals)
