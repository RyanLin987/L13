library(shiny)

shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    if (input$method == "norm") 
    {dist <- rnorm(input$obs, mean = input$mu, sd = input$sd)}
    if (input$method == "st") 
    {dist <- rt(input$obs, df = input$df)}
    hist(dist)
  })
})
