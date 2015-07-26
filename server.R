# Author: Stanislav Georgiev
library(googleVis)
library(shiny)
library(ggplot2)

# str(country_data)  # iris
shinyServer(function(input, output) {
  
  country_data <- read.csv("country2.csv", header = TRUE, stringsAsFactors = FALSE)
  
  myInputCountry <- reactive({ input$Country })
  myInpytMetric <- reactive({ input$Metric })
  output$Country <- renderText({ paste("Trade summary for", myInputCountry(), "-", input$Metric) })

  new_data <- reactive({ subset(country_data, Country == myInputCountry()) })
   
  output$ggplot <- renderPlot({ 
    
    if(myInpytMetric() == "Import")
      p <- ggplot(data = new_data(), aes(x = Year, y = Import))
    else 
      p <- ggplot(data = new_data(), aes(x = Year, y = Export))
    
    p <- p + geom_bar(stat="identity")
    
    print(p) 
  })
  
})


# rm(list=ls())
# runApp(display.mode = "showcase")