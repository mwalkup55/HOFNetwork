library(shiny)
library(networkD3)

df <- read.csv('data/player_teams_links.csv')

shinyUI(fluidPage(
  absolutePanel(
    simpleNetworkOutput('netChart',height="100%",width = "100%"),
    top=0,left=0,right=0,bottom=0
  ),
  absolutePanel(
    style = "background-color: #E6E6E6; opacity: 0.75; padding: 10px 20px 10px 20px;",
    selectInput(
      'player', 'Player', choices = sort(union(df[,1],df[,2])), multiple = FALSE, selected = "Joe Montana"
    ),
    numericInput(
      'dos','Degrees of Separation',min = 1,value = 1
    ),
    checkboxInput(
      "checkbox","Show Entire HOF Network", value=FALSE
    ),
    draggable=TRUE,top="8%",left="2%"
  )
  
))