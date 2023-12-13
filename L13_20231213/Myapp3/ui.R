library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Hello Shiny!"),
  
  # Sidebar with inputs for number of observations, mean, SD, and coler.
  sidebarPanel(
    sliderInput("obs", "Number of observations:", min = 0, max = 1000, value = 500),
    numericInput("M", "Mean of this normal distribution:", min = -200, max = 200, value = 100),
    numericInput("S", "SD of this normal distribution:", min = 0, max = 50, value = 10),
    radioButtons("Color", "Select the color of histogram:", choices = c("Red" = "red", "Blue" = "blue", "Green" = "green"))
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
))
