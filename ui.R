
data(mtcars)

library(shiny)


shinyUI(pageWithSidebar(
        titlePanel("Find Your Car"),        
        sidebarPanel(                     
                h5("Enter your critera below"), 
                checkboxGroupInput('am', label=h4('Transmission Type:'), 
                                      c("Manual (1)"=1, "Automatic (0)"=0), selected= c(0,1)),
                sliderInput("mpg", h4("Min Miles per Gallon: "), min=10, max=35, value=10),
                sliderInput("hp", h4("Min Gross Horsepower: "), min=50, max=250, value=50) 
                
        ),
        mainPanel(
                 
                 h3("The average mpg of your selections is"),
                 verbatimTextOutput("calculation"),
                 h2("Cars Met Your Requirements: "),
                 dataTableOutput("cars")
                 
                 
                         
        )
               
))
