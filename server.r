library(shiny)
library(networkD3)
library(igraph)

df <- read.csv('data/player_teams_links.csv')
graph <- graph.data.frame(df)
distance <- shortest.paths(graph)

shinyServer(function(input, output) {

  output$netChart <- renderSimpleNetwork({
    if (input$checkbox) {
      simpleNetwork(df,fontSize = 15) 
    }
    else {
      player <- input$player
      dos <- input$dos
      subset <- distance[distance[player,] <= dos,distance[player,] <= dos]
      df_trim <- as.data.frame(get.edgelist(graph.adjacency(as.matrix(graph[rownames(subset),rownames(subset)]))))
      simpleNetwork(df_trim,fontSize = 15,linkDistance = 100) 
    }
  })
})