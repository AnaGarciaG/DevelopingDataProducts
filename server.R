#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ISLR)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$WageTable <- renderDataTable({
    data <- Wage
    data <- filter(data, year <= input$year, age <= input$age, maritl %in% input$maritl,  race %in% input$race, education %in% input$education, jobclass %in% input$jobclass, health %in% input$health, health_ins %in% input$health_ins, wage <= input$wage, logwage <= input$logwage)
    #data <- filter(data, maritl == input$maritl)
    #data <- filter(data, race == input$race)
    #data <- filter(data, education == input$education)
    data
    #date <- Wage[, c("year", input$year), drop = FALSE]
  })
})
