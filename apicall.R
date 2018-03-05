getWeather <- function(coords){
  darkSky.base.url <- "https://api.darksky.net/forecast/"
  darkSky.key <- "1347397e6f4d6150a38600f4e7a5a001/"
  response <- GET(paste0(darkSky.base.url, darkSky.key, coords))
  body <- content(response, "text")
  rep.data <- fromJSON(body)
}

stevensPass <- getWeather("47.73723,-121.0951")
snoqualimieSummit <- getWeather("47.42044,-121.4233")
mt.Baker <- getWeather("48.85608,-121.6828")
crystal <- getWeather("46.93533,-121.4770")
missionRidge <- getWeather("47.29245,-120.4020")
whitePass <- getWeather("46.63651,-121.3934")
blueWood <- getWeather("46.07913,-117.8550")
mt.Spokane <- getWeather("47.92110,-117.0970")
forty.nine.north <- getWeather("48.30110,-117.5651")