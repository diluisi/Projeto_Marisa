#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

df <- read.table("latlong.txt", header = T, sep = ",")

mydata <- df
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydata,centers=i)$withinss)

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  selectedData <- reactive({
    df[, c(input$ycol, input$xcol)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 2)
    points(clusters()$centers,pch = 4, cex = 4, lwd = 4)
  })

  output$info <- renderTable({clusters()$centers})
  
  output$plot2<-renderPlot({
    plot(1:15, wss, type="b", xlab="Numero de Clusters",
         ylab="Soma dos quadrados dentro dos clusters",
         main="Avaliando o numero otimo de cluster atraves do Elbow Method",
         pch=20, cex=2)
    abline(v=3, lty = 2, col = "red")
    })
  
})
