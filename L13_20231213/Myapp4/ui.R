library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Sample size for Case Control study"),
  
  sidebarPanel(
    numericInput("alpha", "Two-sided significance level:", min = 0.001, max = 0.999, value = 0.05),
    numericInput("power", "Power:", min = 0.001, max = 0.999, value = 0.8),
    numericInput("OR", "Smallest difference of clinical/biological importance:", min = 0.01, max = 100, value = 1.5),
    numericInput("r", "The ratio of Case/Control:", min = 0.01, max = 100, value = 1),
    numericInput("p0", "Proportion of controls with exposures:", min = 0.001, max = 0.999, value = 0.2)    
  ),
  
  mainPanel(
    h3(textOutput("text1")),
    h4(textOutput("text2")),
    h3(textOutput("text3")),
    h4(textOutput("text4"))
  )
))

