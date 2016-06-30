#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(RColorBrewer)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = "bootstrap.css",
                  
                  tags$head(
                    tags$style(HTML("
                                    @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
                                    
                                    h1 {
                                    font-family: 'Lobster', cursive;
                                    font-weight: 500;
                                    line-height: 1.1;
                                    color: #48ca3b;
                                    }
                                    
                                    "))
                    ),
                  dashboardPage(
                    dashboardHeader(),
                    dashboardSidebar(),
                    dashboardBody()
                  ),
                  
                  headerPanel("Uncapacitated Facility Location Problem"),
                  
                  # Application title
                  titlePanel("Old Faithful Geyser Data"),
                  
                  # Sidebar with a slider input for number of bins 
                  sidebarLayout(
                    sidebarPanel(
                      sliderInput("bins",
                                  "Number of bins:",
                                  min = 1,
                                  max = 50,
                                  value = 30)
                    ),
                    
                    # Show a plot of the generated distribution
                    mainPanel(
                      plotOutput("distPlot")
                    )
                  )
                    ))
