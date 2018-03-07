library(jsonlite)
library(httr)

getWeather <- function(coords){
  darkSky.base.url <- "https://api.darksky.net/forecast/"
  response <- GET(paste0(darkSky.base.url, api.key, "/", coords))
  body <- content(response, "text")
  rep.data <- fromJSON(body)
  return(rep.data)
}
