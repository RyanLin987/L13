library(shiny)

# Define UI for application that calculate the needed sample size 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Sample size calculator"),
  
  # Sidebar with numeric inputs for significance level, expected rate, acceptable error range.
  sidebarPanel(
    numericInput("Sig", "Two-sided significance level:", min = 0, max = 1.000, value = 0.05),
    numericInput("p", "The expected rate:", min = 0, max = 1, value = 0.5),
    numericInput("X", "Acceptable error range:", min = 0, max = 1, value = 0.03)
  ),
  
  # Show the outcome
  mainPanel(
    h3(textOutput("Size"))
  )
))
