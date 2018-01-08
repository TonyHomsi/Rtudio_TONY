install.packages("shiny")
library(shiny)
require(shiny)

#Create a UI
ui <- fluidPage("Hello Word!")

#Create a server
server <- function(input,output){
  
}

# Create a shinny app

shinyApp(ui=ui, server=server)
library(shiny)
require(shiny)
# Create a UI with I/O Controls

ui <- fluidPage(
  titlePanel("Input and Output"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "num",
        label = "Choose a Number",
        min = 0,
        max = 100,
        value = 25)),
    mainPanel(
      textOutput(
        outputId = "text"))))

