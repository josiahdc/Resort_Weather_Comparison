library(shiny)

#assign dark sky key to api.key, make a file called api_key.R and put it in the working directory
source("./api_key.R")

# get the data
source("./processing.R")
coord.frame <- read.csv("./coordinates.csv", stringsAsFactors = FALSE)
weather.frame <- create.weather.frame(coord.frame)
resort.names <- weather.frame$name
