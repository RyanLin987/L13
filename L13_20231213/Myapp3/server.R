library(shiny)

# Your function
Samplesize = function(Sig,p,X) {
  Z = qnorm(1-Sig/2)
  n = p*(1-p)*Z^2/X^2
  n
}

# Define server logic required to calculate the needed sample size
shinyServer(function(input, output) {
  
  output$Size = renderText({
    N = Samplesize(Sig = input$Sig,p = input$p, X = input$X)      
    paste("We need",round(N),"samples for this sampling.")
  })
  
})

