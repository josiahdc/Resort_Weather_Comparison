library(ggmap)
library(ggplot2)
library(ggrepel)

# Get data:
ski.resorts <- read.csv("./coordinates.csv", stringsAsFactors = FALSE, header = TRUE)
wa <- get_googlemap(center = "soap lake wa", zoom = 6, size = c(400, 250), maptype = "roadmap")


# Creates map of WA, & points of ski resorts:
conditions.report <- ggmap(wa) + 
  geom_point(data = ski.resorts, aes(x = long, y = lat), fill = "black", alpha = .7, size = 3, shape = 21) + 
  geom_label_repel(data = ski.resorts, aes(x = long, y = lat, label = name), nudge_x = .5, nudge_y = .15) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)  + ggtitle("Ski Resort Conditions in WA:") + theme(plot.title = element_text(hjust = 0.5, size = 30))

