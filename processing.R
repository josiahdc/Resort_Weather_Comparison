library(dplyr)
source("./apicall.R")

# calls the dark sky api once for each ski resort in coordinates.csv
# constructs a data frame of weather values to be used in calculating the score
create.weather.frame <- function(coord.frame) {
  # create vectors
  num <- nrow(coord.frame)
  temp <- vector(length = num)
  precip <- vector(length = num)
  precip.type <- vector(length = num)
  clouds <- vector(length = num)
  vis <- vector(length = num)
  wind <- vector(length = num)
  rating <- vector(length = num)
  
  # add values to vectors
  for(i in 1:num) {
    coords <- paste0(coord.frame$lat[i], ",", coord.frame$long[i])
    weather.raw <- getWeather(coords)
    temp[i] <- weather.raw$currently$temperature
    vis[i] <- weather.raw$currently$visibility
    clouds[i] <- weather.raw$currently$cloudCover
    precip[i] <- weather.raw$currently$precipIntensity
    wind[i] <- weather.raw$currently$windSpeed
    if(precip[i] == 0) {
      precip.type[i] <- 'none'
    } else {
      precip.type[i] <- weather.raw$currently$precipType
    }
    
    # rate the resorts
    rating[i] <- assign.rating(temp[i], vis[i], clouds[i], precip[i], precip.type[i], wind[i])
  }
  
  # add vectors to finished frame
  weather.frame <- coord.frame
  weather.frame$temperature <- temp
  weather.frame$precipitation <- precip
  weather.frame$precipitation_type <- precip.type
  weather.frame$clouds <- clouds
  weather.frame$visibility <- vis
  weather.frame$wind_speed <- wind
  weather.frame$rating <- rating

  return(weather.frame)
}

# assigns the resort a rating based on weather conditions
assign.rating <- function(temp, vis, clouds, precip, precip.type, wind) {
  rating <- 10
  
  # test if above freezing
  if(!is.na(temp) & temp > 32) {
    rating = rating - 1
  }
  
  # test if vis is good
  if(!is.na(vis) & vis < 5) {
    rating = rating - 1
  }
  
  # test to see if there are clouds in the sky
  if(!is.na(clouds) & clouds > .1) {
    rating = rating - 1
  }
  
  # test to find out if it is raining or snowing and how hard
  if(!is.na(precip.type) & precip.type != 'none') {
    if(!is.na(precip.type) & precip.type == 'snow') {
      if(!is.na(precip) & precip >= .01) {
        rating = rating - 1
      }
    } else {
      rating = rating - 2
      if(!is.na(precip) & precip >= .01) {
        rating = rating - 3
      }
    }
  }
  
  # test if winds are strong
  if(!is.na(wind) & wind >= 10) {
    rating = rating - 1
  }
  
  return(rating)
}


