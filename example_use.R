# Add API key here:
api.key <- " "

source("./processing.R")
coord.frame <- read.csv("./coordinates.csv", stringsAsFactors = FALSE)
weather.frame <- create.weather.frame(coord.frame)


source("./map.R")
print(conditions.report)

