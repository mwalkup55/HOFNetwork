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
      'dos','Degrees of Sep.',min = 1,value = 1
    ),
    checkboxInput(
      "checkbox","Entire HOF", value=FALSE
    ),
    draggable=TRUE,top="11%",left="2%",width="175"
  )
  
))