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
  
  dashboardHeader(
    title = tags$a(href= "http://ufabc.edu.br/",align="right",
                   tags$img(src="./ufabc.png")),
    dropdownMenu(type = "tasks",
    messageItem(from = "Diego Silva",
                message = "Seja bem vindo."),
    messageItem(from = "Ajuda",
                message = "Como uso o Dashboard",
                icon = icon("life-ring"),
                href = "https://raw.githubusercontent.com/diluisi/Projeto_Marisa/master/README.md")
    )),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Heuristicas", tabName = "Heuristicas", icon = icon("gears"),
               selectInput('xcol', 'X Variable', names(df)),
               selectInput('ycol', 'Y Variable', names(df),
                           selected=names(df)[[2]]),
               numericInput('clusters', 'Cluster count', 3,
                            min = 1, max = 9)
               
               ),
      menuItem("Source code", icon = icon("file-code-o"),href = "https://github.com/diluisi/Projeto_Marisa"),
      menuItem("UFABC", icon = icon("university"),href = "http://www.ufabc.edu.br")
      )
    ),
  
  dashboardBody(
    tabBox(side = "right", height = "180px",
      tabPanel("K-Means",
               plotOutput('plot1')),
      tabPanel("EM", 
               plotOutput('plot2')),
      tabPanel("Tab3", "Note that when side=right, the tab order is reversed.")  
    ),
    fluidRow(
      tabBox(side = "left", height = "180px",
        # Title can include an icon
        title = tagList(shiny::icon("truck"), "Coordenadas dos CDs"),
        tabPanel("Tabela",
                 "Coordenadas de longitude e latitude:",
                 tableOutput("info"))))
    
    
    )))
