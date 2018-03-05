library(ggmap)
library(ggplot2)
library(ggrepel)

# Get Data for Washington Map:
wa <- get_googlemap(center = "soap lake wa", zoom = 6, size = c(400, 250), maptype = "roadmap")

# Creates base map, to be layered on later with ski resorts.
base.map <- ggmap(wa) + ggtitle("Ski Resort Conditions in WA:") + 
  theme(plot.title = element_text(hjust = 0.5, size = 15))


# Reads status of each resort into a dataframe.
resort.conditions <- read.csv("./statuses.csv", stringsAsFactors = FALSE, header = TRUE)
status <- resort.conditions$status

# Plots point based off weather conditions & sets its color as green, yellow, or red:
PlotPoints <- function(results) {
  if (results == "good") {
      base.map <- base.map + 
      geom_point(data = ski.resorts, aes(x = long, y = lat), fill = "green", alpha = .7, size = 3, shape = 21) + 
      geom_label_repel(data = ski.resorts, aes(x = long, y = lat, label = name), nudge_x = .5, nudge_y = .15) 
  } else if (results == "okay") {
      base.map <- base.map + 
      geom_point(data = ski.resorts, aes(x = long, y = lat), fill = "yellow", alpha = .7, size = 3, shape = 21) + 
      geom_label_repel(data = ski.resorts, aes(x = long, y = lat, label = name), nudge_x = .5, nudge_y = .15)
  } else if (results == "bad"){
      base.map <- base.map + 
      geom_point(data = ski.resorts, aes(x = long, y = lat), fill = "red", alpha = .7, size = 3, shape = 21) + 
      geom_label_repel(data = ski.resorts, aes(x = long, y = lat, label = name), nudge_x = .5, nudge_y = .15)
  }
}



#apply(resort.conditions, 1, PlotPoints(status))
#print(base.map)

