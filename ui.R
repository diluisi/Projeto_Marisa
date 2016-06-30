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
shinyUI(dashboardPage(
  dashboardHeader(title = "Basic dashboard",
                  dropdownMenu(type = "tasks",
                               messageItem(
                                 from = "Diego Silva",
                                 message = "Seja bem vindo."
                               ),
                               messageItem(
                                 from = "Ajuda",
                                 message = "Como uso o Dashboard",
                                 icon = icon("life-ring"),
                                 href = "https://github.com/diluisi/Projeto_Marisa"
                               )
                  )
                  ),
  
  dashboardSidebar(
    dashboardSidebar(
      sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
        menuItem("Widgets", tabName = "widgets", icon = icon("th")),
        menuItem("Source code", icon = icon("file-code-o"), 
                 href = "https://github.com/diluisi/Projeto_Marisa")
      )
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      
      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )
)
)