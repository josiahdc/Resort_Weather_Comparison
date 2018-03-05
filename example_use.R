# api.key <- "put your api key here"
source("./processing.R")

coord.frame <- read.csv("./coordinates.csv", stringsAsFactors = FALSE)
weather.frame <- create.weather.frame(coord.frame)

source("./map.R")

print(conditions.report)