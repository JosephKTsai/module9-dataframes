# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100)
# Hint: use the `paste()` function to produce the list
employees <- c(paste("Employee",1:100))

# Create a vector of 100 random salaries for the year 2014
# Use the `runif()` function to pick a random number between 40000 and 50000
salaries.2014 <- runif(100, 40000, 50000)

# Create a vector of 100 salaries in 2015 that have increased from 2014 by some amount
# Hint: use `runif()` to add a random number to 2014's salaries. Starting from a
# _negative_ number so that salaries may decrease!
salaries.2015 <- (salaries.2014 + runif(100, -10000, 20000))

# Create a data.frame 'salaries' by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!

salaries <- data.frame(employees, salaries.2014, salaries.2015, stringAsFactors = FALSE)

# Create a column 'raise' that stores the size of the raise between 2014 and 2015
salaries$raise <- salaries.2015 - salaries.2014

# Create a column 'got.raise' that is TRUE if the person got a raise
salaries$got.raise <- salaries.2015 > salaries.2014

### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2015 salary of employee 57
employ.sal.57 <- salaries[, salaries$employees == "employee 57"]

# How many employees got a raise?
num.employ.raise <- nrow(salaries[salaries$got.raise, ])

# What was the value of the highest raise?
highest.raise <- max(salaries$raise)

# What was the "name" of the employee who received the highest raise?
employ.with.highest.raise <- salaries$employees[salaries$raise == highest.raise]

# What was the largest decrease in salaries between the two years?
largest.paycut <- min(salaries$raise)

# What was the name of the employee who recieved largest decrease in salary?
employ.with.biggest.paycut <- salaries$employees[salaries$raise == largest.paycut]

# What was the average salary increase?
average.salary.increase <- mean(salaries$raise)

### Bonus ###

# Write a .csv file of your salaries to your working directory
write.csv(salaries, "salaries.csv")

# For people who did not get a raise, how much money did they lose?
average.money.lost.among.paycuts <- mean(salaries$raise[salaries$got.raise != TRUE])
print(average.money.lost.among.paycuts)
