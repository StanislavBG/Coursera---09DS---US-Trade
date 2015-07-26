library(shiny)

country_data <- read.csv("country2.csv", header = TRUE, stringsAsFactors = FALSE)
countries <- unique(country_data$Country)

shinyUI(pageWithSidebar(
  
  headerPanel("Review 20yrs of USA trade ballance"),
  
  sidebarPanel(
    selectInput("Country", "Select a Country to be examined", choices = countries),
    selectInput('Metric', "Pick a Metric to review", choices = c('Import', 'Export'))
  ),
  
  
  mainPanel(
    h3(textOutput("Country")),
    plotOutput("ggplot")
  )
)
)

# runApp(display.mode = "showcase")