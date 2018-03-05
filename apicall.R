library(jsonlite)
library(httr)

getWeather <- function(coords){
  darkSky.base.url <- "https://api.darksky.net/forecast/"
  darkSky.key <- api.key
  response <- GET(paste0(darkSky.base.url, darkSky.key, "/", coords))
  body <- content(response, "text")
  rep.data <- fromJSON(body)
  return(rep.data)
}