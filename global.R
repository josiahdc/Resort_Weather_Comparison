library(shiny)

#assign dark sky key to api.key
source("./api_key.R")

# get the data
source("./processing.R")
coord.frame <- read.csv("./coordinates.csv", stringsAsFactors = FALSE)
weather.frame <- create.weather.frame(coord.frame)
resort.names <- weather.frame$name
