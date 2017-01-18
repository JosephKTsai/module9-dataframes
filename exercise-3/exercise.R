# Load R's "USPersonalExpenditure" dataset using the "data()" function
# This will produce a data frame called `USPersonalExpenditure`
data(USPersonalExpenditure)

# The variable USPersonalExpenditure is now accessible to you. Unfortunately,
# it's not a data frame (it's actually what is called a matrix)
# Test this using the `is.data.frame()` function
is.data.frame(USPersonalExpenditure)


# Luckily, you can simply pass the USPersonalExpenditure variable as an argument
# to the `data.frame()` function to convert it a data farm. Do this, storing the
# result in a new variable
us.exp <- data.frame(USPersonalExpenditure)

# What are the column names of your dataframe?
colnames(us.exp)


# Why are they so strange? Think about whether you could use a number like 1940
# with dollar notation!
# Answer: Probably the years associated with the expenses

# What are the row names of your dataframe?
rownames(us.exp)


# Create a column "category" that is equal to your rownames
us.exp$category <- rownames(us.exp)

# How much money was spent on personal care in 1940?
personal.care.1940 <- us.exp['Personal Care', 'X1940']

# How much money was spent on Food and Tobacco in 1960?
food.and.tobacco.1960 <- us.exp['Food and Tobacco', 'X1960']

# What was the highest expenditure category in 1960?
# Hint: use the `max()` function to find the largest, then compare that to the column
# Self-Note: We are using the comparrison operator so that it will return a certain INDEX
#            If we didn't use the boolean operator, it would return a number that doesn't 
#            make sense with what we're trying to do (like 1.1 or something)
max.exp <- us.exp$category[max(us.exp$X1960) == us.exp$X1960]

# Define a function `DetectHighest` that takes in a year as a parameter, and
# returns the highest spending category of that year

###### What kind of error am I getting here?
#DetectHighest <- function(year) {
#  formatted.year <- paste0("X",year)
#  return(us.exp$category[max(us.exp$formatted.year) == us.exp$formatted.year])
#}
DetectHighest <- function(year) {
  # need to format it correctly so that we'll get the right columns
  formatted.year <- paste0("X",year)
  # Check every row in that column, and return the matching index to the corresponding category
  return(us.exp$category[max(us.exp[, formatted.year]) == us.exp[, formatted.year]])
}


# Using your function, determine the highest spending category of each year
highest.exp.each.year <- c(DetectHighest(1940), DetectHighest(1945), DetectHighest(1950),
                           DetectHighest(1955), DetectHighest(1960))