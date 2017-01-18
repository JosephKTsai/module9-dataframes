# Exercise 5: Popular Baby Names Over Time

# Read in the female baby names .csv file into a variable called `female.names`
# Remember to not load the strings as factors!
# the first part of read.csv just gives the relative path to the file that we want
female.names <- read.csv("data/female_names.csv",stringsAsFactors = FALSE)

# Create a vector `years` as the year column of the dataset
years <- female.names$year
# Create a vector `names` as the name column of the datset
names <- female.names$name

# Create a vector `props` as the proportion column of the dataset
props <- female.names$prop

# Create a vector `names.2013` as your names vector where your years vector is 2013
names.2013 <- names[years == 2013]

# Create a vector `prop.2013` as the your props vector where your years vector is 2013
prop.2013 <- props[years == 2013]

# What was the most popular female name in 2013?
# Self-Note: need to make sure that the years match up so that we don't go out of index (too long)
most.popular.female.name.2013 <- names.2013[prop.2013 == max(prop.2013)]
print(most.popular.female.name.2013)

# Write a funciton `most.popular` that takes in a value `my.year`, and returns
# a sentence stating the most popular name in that year. Note how you had to make intermediary variables above.
most.popular <- function(my.year) {
  names.of.year <- names[years == my.year]
  props.of.year <- props[years == my.year]
  most.pop.name.of.the.year <- names.of.year[props.of.year == max(props.of.year)]
  return(paste("The most popular name of", my.year, "was", most.pop.name.of.the.year))
}

# What was the most popular female name in 1994?
print(most.popular(1994))


### Bonus ###

# Write a function `how.popular` that takes in a name and a year, and returns
# a sentence with how popular that name was in that year
how.popular <- function(name, year) {
  prop.of.popularity <- props[names == name & years == year]
  return(paste(name, "had a ratio of popularity of", prop.of.popularity, "in", year))
}

# How popular was the name 'Laura' in 1995?
print(how.popular("Laura", 1995))
