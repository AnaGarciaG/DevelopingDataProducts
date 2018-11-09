#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Mid-Atlantic Wage Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput('year', 'Year:', 2009, min = 2003, max = 2009),
       sliderInput('age', 'Age:', 80, min = 18, max = 80),
       #checkboxGroupInput('year', 'Year:', c("2003"=2003, "2004"=2004, "2005"=2005,"2006"=2006, "2007"=2007, "2008"=2008, "2009"=2009), selected = c(2003,2004,2005,2006,2007,2008.2009)),
       checkboxGroupInput('maritl', "Marital Status:", c("Never Married" = "1. Never Married", "Married" = "2. Married", "Widowed" = "3. Widowed", "Divorced" = "4. Divorced", "Separated" = "5. Separated"), selected = c("1. Never Married", "2. Married", "3. Widowed", "4. Divorced",  "5. Separated")),
       checkboxGroupInput('race', "Race:", c("White" = "1. White", "Black" = "2. Black", "Asian" = "3. Asian", "Other" = "4. Other"), selected = c("1. White", "2. Black", "3. Asian", "4. Other")),
       checkboxGroupInput('education', "Education:", c("< HS Grad" = "1. < HS Grad", "HS Grad" =  "2. HS Grad", "Some College" = "3. Some College", "College Grad" = "4. College Grad", "Advanced Degree" = "5. Advanced Degree"), selected = c("1. < HS Grad", "2. HS Grad", "3. Some College",  "4. College Grad",  "5. Advanced Degree")),
       checkboxGroupInput('jobclass', "Type of job:", c("Industrial" = "1. Industrial", "Informatiion" = "2. Information"), selected = c("1. Industrial","2. Information")),
       checkboxGroupInput('health', "Health level of worker", c("Good" = "1. <=Good", "Very Good" = "2. >=Very Good"), selected = c("1. <=Good", "2. >=Very Good")),
       checkboxGroupInput('health_ins', "Has health insurance", c("Yes" = "1. Yes", "No" = "2. No"), selected = c("1. Yes", "2. No")),
       sliderInput('logwage', 'Log os workers wage:', 6000, min = 3000, max = 6000, step = 500),
       sliderInput('wage', 'Workers raw wage:', 320000, min = 20000, max = 320000, step = 5000)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      tabsetPanel(
        tabPanel("Table", dataTableOutput("WageTable")),
        tabPanel("Documentation", 
                 h5('Wage dataset'),
                 h5('A data frame with 3000 observations on the following 11 variables.'),
                 h5('year: Year that wage information was recorded'),
                 h5('age: Age of worker'),
                 h5('maritl: A factor with levels 1. Never Married 2. Married 3. Widowed 4. Divorced and 5. Separated indicating marital status'),
                 h5('race: A factor with levels 1. White 2. Black 3. Asian and 4. Other indicating race'),
                 h5('education: A factor with levels 1. < HS Grad 2. HS Grad 3. Some College 4. College Grad and 5. Advanced Degree indicating education level'),
                 h5('region: Region of the country (mid-atlantic only)'),
                 h5('jobclass:A factor with levels 1. Industrial and 2. Information indicating type of job'),
                 h5('health: A factor with levels 1. <=Good and 2. >=Very Good indicating health level of worker'),
                 h5('health_ins: A factor with levels 1. Yes and 2. No indicating whether worker has health insurance'),
                 h5('logwage: Log of workers wage'),
                 h5('wage: Workers raw wage')),
        tabPanel("User manual", 
                 h5('Application shows as a table all the values for the dataset Wage.'),
                 h5('By default, all the values are displayed but you can decide the elements to visualize using the input fields displayed on the left side.'))
      )
    )
  )
))
