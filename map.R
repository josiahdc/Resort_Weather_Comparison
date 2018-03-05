library(ggmap)
library(ggplot2)
library(ggrepel)

setwd("~/desktop/info201/ski-blade/")

ski.resorts <- read.csv("./coordinates.csv", stringsAsFactors = FALSE, header = TRUE)
wa <- get_googlemap(center = "wenatchee wa", zoom = 6, size = c(400, 250), maptype = "roadmap")

# Creates map of WA, & points of ski resorts:
ggmap(wa) + 
  geom_point(data = ski.resorts, aes(x = lon, y = lat), fill = "blue", alpha = .7, size = 5, shape = 21) + 
  geom_label_repel(data = ski.resorts, aes(x = lon, y = lat, label = name), nudge_x = -.6, nudge_y = .2) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)  + ggtitle("Ski Resort Conditions in WA:") + 
  theme(plot.title = element_text(hjust = 0.5, size = 30))


