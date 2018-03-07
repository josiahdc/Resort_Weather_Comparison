library(shiny)
library(shinythemes)

shinyUI(
  fluidPage(theme = shinytheme("slate"),
    
    # add a title
    titlePanel("Washington Ski Resort Weather"),
    sidebarLayout(
      sidebarPanel(
        
        # add a widget to display more detailed information on a resort
        radioButtons('resort',
                     "Detailed report by resort",
                     resort.names
                    )
      ),
      
      # create the map
      mainPanel(
        plotOutput('map', width = "100%"),
        h3(textOutput('description'))
      )
    )
    
  )
)
