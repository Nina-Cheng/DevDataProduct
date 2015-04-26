
data(mtcars)

shinyServer(function(input, output) {
        library(shiny)
        library(plyr)
     
        
        mycars<-cbind(rownames(mtcars),mtcars[,c(1,2,3,4,6,9,10)])
        names(mycars)<-c("Model","MPG","Cylinders","Displacement", "Horsepower","Weight", "Transmission", "Gear")
        output$cars = renderDataTable({
                mycars[ which(mycars$Transmission %in% input$am
                          & mycars$MPG>input$mpg & mycars$Horsepower > input$hp),]
        })
        output$calculation <- renderPrint({mean(mycars[ which(mycars$Transmission %in% input$am
                                                       & mycars$MPG>input$mpg & mycars$Horsepower > input$hp),]$MPG)})
       
})