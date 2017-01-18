# Exercise 6: Husky Football 2015 Season
# Read in the Husky Football 2015 game data into a variable called `husky.games.2015`
husky.games.2015 <- read.csv("data/huskies_2015.csv", stringsAsFactors = FALSE)


# Create a vector of the teams that the Huskies played against during that season
opponents <- husky.games.2015$opponent



# Create a vector of the their final scores for the games
# Call this variable `husky.scores`
husky.score <- husky.games.2015$uw_score


# Create 2 variables called `rushing.yards` and `passing.yards` to represent the yards the Huskies rushed and passed
rushing.yards <- husky.games.2015$rushing_yards
passing.yards <-husky.games.2015$passing_yards


# Create a variable called `combined.yards` that is the total yardage of the Huskies for each game
combined.yards <- rushing.yards + passing.yards


# Add the `combined.yards` vector to the dataframe with the column name being `combined`
husky.games.2015$combined <- combined.yards


# Write the dataframe to a new `.csv` file called `huskies_2015_improved.csv` into the `data directory`
# Self-Note: If we put the directory name and then the file name, this also works instead of switching back and
#            forth between directories
write.csv(husky.games.2015, "data/huskies_2015_improved.csv")
# What is the score of the game where the Huskies had the most combined yards?
opponent.score.for.game <- husky.games.2015$opponent_score[combined.yards == max(combined.yards)]
husky.score.for.game <- husky.games.2015$uw_score[combined.yards == max(combined.yards)]
print (paste("The score of the game where the Huskies had the most combined yards was", opponent.score.for.game, 
      "for the opponents and", husky.score.for.game, "for the huskies"))

# Define a function `MostYardsScore` that takes in an argument `games` (a data frame) and
# returns a descriptive sentence about the game that was played that had the most yards earned in it.
MostYardsScore <- function(games) {
  # Creating temporary variables that correspond to the game with the must yards earned in it
  combined.yards <- games$passing_yards + games$rushing_yards
  husky.points <- games$uw_score[combined.yards == max(combined.yards)]
  date <- games$date[combined.yards == max(combined.yards)]
  opponent <- games$opponent[combined.yards == max(combined.yards)]
  opponent.points <- games$opponent_score[combined.yards == max(combined.yards)]
  passing <- games$passing_yards[combined.yards == max(combined.yards)]
  rushing <- games$rushing_yards[combined.yards == max(combined.yards)]
  fumbles <- games$fumbles[combined.yards == max(combined.yards)]
  return(paste("UW's game that had the most rushing hards in it this season was against", opponent, 
              ".In the game, UW scored", husky.points, "and", opponent, "scored", opponent.points, 
              ". UW passed for", passing, "yards and ran for", rushing, 
              "yards. The game was played on", date, "and there were a total of", fumbles, "fumbles."))
}

# Challenge!
# What was the highest yardage game so far this season?
# Hint: Read in the dataset titled `huskies_2016.csv` and save it as a variable
husky.games.2016 <- read.csv("data/huskies_2016.csv", stringsAsFactors = FALSE)
highest.yardage.game <- MostYardsScore(husky.games.2016)
print(highest.yardage.game)