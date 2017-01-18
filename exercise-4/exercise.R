# Exercise 4: Gates Foundation Educational Grants

# Read the data from the `data/gates_money.csv` file into a variable called
# `grants` using the `read.csv()` function
# Be sure to set your working directory, and do NOT treat strings as factors!

grants <- read.csv("data/gates_money.csv", stringsAsFactors = FALSE)
# Use the View function to look at the loaded data
View(grants)


# Create a variable `organization` as the `organizationtotal.amount` column of the dataset
####### Not sure what this means
organization <- grants$organization

# Confirm that the "organization" column is a vector using the `is.vector()`
# This is a useful debugging tip if you hit errors later!
is.vector(organization)


### Now you can ask some more interesting questions about the dataset.  Store your answers in variables ###

# What was the mean grant value?
mean.grant.value <- mean(grants$total_amount)

# What was the dollar amount of the largest grant?
largest.grant <- max(grants$total_amount)

# What was the dollar amount of the smallest grant?
smallest.grant <- min(grants$total_amount)

# Which organization received the largest grant?
# Self-Note: We can use the organization vector we made before because the conditional
#            statement will give us an index that also corresponds withour organization vector
largest.grant.organzation <- organization[grants$total_amount == largest.grant]

# Which organization received the smallest grant?
smallest.grant.organzation <- organization[grants$total_amount == smallest.grant]

# How many grants were awarded in 2010?s
# We don't need the column argument because we already put that in the rows portion of the call
# Counting how many years in grants$start_year that equals 2010, column indirectly defined 
# in rows
nrow(grants[grants$start_year == 2010, ])
