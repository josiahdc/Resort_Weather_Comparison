library(shiny)
library(shinythemes)

shinyUI(
  navbarPage("Washington Ski Resort Weather", theme = shinytheme("slate"),
    tabPanel("Map",
      # add a title
      sidebarLayout(
        sidebarPanel(
          
          # add a widget to display more detailed information on a resort
          radioButtons('resort',
                       "Detailed report by resort",
                       resort.names
                      ),
          a("Powered by Dark Sky", href = 'https://darksky.net/poweredby/')
        ),
        
        # create the map
        mainPanel(
          plotOutput('map', width = "100%"),
          h3(textOutput('description'))
        )
      )
    ),
    tabPanel("Information",
      h3("The Rating is calculated from the weather information presented on the map page. Every Resort starts
          with a rating of 10, and loses a point for having unideal conditions. If the weather is above freezing,
          the resort loses a point. If visibility is poor, the resort looses a point. If there is cloud cover,
          the resort loses a point. If it is snowing hard, the resort loses a point. If it is raining, the resort
          loses two points (if it is raining hard, the resort loses three points instead). If there are strong
          winds, the resort loses a point.")
    )
  )
)
