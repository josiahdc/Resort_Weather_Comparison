library(shiny)
library(dplyr)

shinyServer(function(input, output) {
  
  # render the weather map
  output$map <- renderPlot({
    source("./map.R")
    return(conditions.report)
  })
  
  output$description <- renderText({
    working.row <- weather.frame %>% filter(name == input$resort)
    sentance.one <- paste("The temperature at", working.row$name, "is currently",
                            working.row$temperature, "degrees fahrenheit.")
    if(working.row$precipitation_type == "none") {
      sentance.two <- "It is not currently raining or snowing."
    } else {
      sentance.two <- paste("The resort is getting", format(working.row$precipitation, scientific = FALSE),
                              "inches of", working.row$precipitation_type, "per hour.")
    }
    sentance.three <- paste0("The sky is ", (working.row$clouds * 100), "% occluded by clouds.")
    if(working.row$visibility == 10) {
      sentance.four <- paste("Visibility is ideal.")
    } else {
      sentance.four <- paste("Visibility is clear out to", working.row$visibility, "miles.")
    }
    sentance.five <- paste("Winds are blowing at", working.row$wind_speed, "miles per hour.")
    Sentance.six <- paste("Overall conditions are rated", working.row$rating, "out of 7.")
    return(
      paste(sentance.one, sentance.two, sentance.three, sentance.four, sentance.five, Sentance.six)
    )
  })
})
