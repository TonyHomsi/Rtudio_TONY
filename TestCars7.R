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


# Create a server than maps inpit yo output
server <-function(input,output){
  output$text <- renderText({
    paste("You selected", input$num)
  })
}

#create a shinny app

shinyApp(ui=ui, server=server)


install.packages("tree")
library(tree)
setwd("c:/Pluralsight/RStudio_Test")



# Load training data
load("Train.RData")

# Load tree model
load("Tree.RData")


#Load Color brewer library
library(RColorBrewer)

#create a color palette
palette<- brewer.pal(3,"Set2")


library(shiny)
# Create user interface code
ui <- fluidPage(
  titlePanel("Iris Species Predictor"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "petal.length",
        label = "Petal Length (cm)",
        min = 1,
        max = 7,
        value = 4),
      sliderInput(
        inputId = "petal.width",
        label = "Petal Width (cm)",
        min = 0.0,
        max = 2.5,
        step = 0.5,
        value = 1.5)),
    mainPanel(
      textOutput(
        outputId = "text"),
      plotOutput(
        outputId = "plot"))))

server <- function(input,output){
  output$text=renderText({
    # Create predictions
    predictors <- data.frame(
      Petal.Length=input$petal.length,
      Petal.Width=input$petal.width,
      Sepal.Length=0,
      Sepal.Width=0
    )
    #Make Prediction
    prediction=predict(
      object = model,
      newdata=predictors,
      type="class"
    )
    
    #Create prediction text
    paste(
      "the Predicted species is",
      as.character(prediction)
    )
  })
  output$plot = renderPlot({
    
    # Create a scatterplot colored by species
    plot(
      x = iris$Petal.Length, 
      y = iris$Petal.Width,
      pch = 19,
      col = palette[as.numeric(iris$Species)],
      main = "Iris Petal Length vs. Width",
      xlab = "Petal Length (cm)",
      ylab = "Petal Width (cm)")
    
    # Plot the decision boundaries
    partition.tree(
      model,
      label = "Species",
      add = TRUE)
    
    # Draw predictor on plot
    points(
      x = input$petal.length,
      y = input$petal.width,
      col = "red",
      pch = 4,
      cex = 2,
      lwd = 2)
    
  })
}

# Create a shiny app
shinyApp(
  ui = ui,
  server = server)




