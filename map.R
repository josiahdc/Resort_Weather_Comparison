library(ggmap)
library(ggplot2)
library(ggrepel)

# Get Data for Washington Map:
wa <- get_googlemap(center = "soap lake wa", zoom = 6, size = c(400, 250), maptype = "roadmap")

# Creates base map, to be layered on later with ski resorts.
base.map <- ggmap(wa) + ggtitle("Ski Resort Conditions in WA:") + 
  theme(plot.title = element_text(hjust = 0.5, size = 15))

# Creates map of WA, & points of ski resorts:
conditions.report <- ggmap(wa) + 
  geom_point(data = weather.frame, aes(x = long, y = lat, fill = rating, color = rating), alpha = .7, size = 5, shape = 21) + 
  geom_label_repel(data = weather.frame, aes(x = long, y = lat, label = name), nudge_x = .5, nudge_y = .15) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)  + ggtitle("Ski Resort Conditions in WA:") + theme(plot.title = element_text(hjust = 0.5, size = 30)) +
  scale_fill_gradient(low = "red", high = "green", limits=c(1, 10)) +
  scale_color_gradient(low = "red", high = "green",limits=c(1, 10))

print(conditions.report)
