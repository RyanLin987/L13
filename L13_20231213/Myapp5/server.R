library(shiny)

Samplesize = function(Sig,p,X) {
  Z = qnorm(1-Sig/2)
  n = p*(1-p)*Z^2/X^2
  n
}

Samplesize_OR = function(alpha,power,OR,r,p0,corr=FALSE) {
  Za=qnorm(1-alpha/2)
  Zb=qnorm(power)
  q0=1-p0
  p1=OR*p0/(OR*p0+q0)
  q1=1-p1
  pbar=(p0+r*p1)/(r+1)
  qbar=1-pbar
  n0=(Za*sqrt((r+1)*pbar*qbar)+Zb*sqrt(r*p0*q0+p1*q1))^2/(r*(p0-p1)^2)
  n1=r*n0
  n0corr=n0/4*(1+sqrt(1+(2*(1+r)/(n1*r*sqrt((p0-p1)^2)))))^2
  n1corr=r*n0corr
  if (corr==FALSE) {return(paste("Control:",round(n0)+1,"; Case:",round(n1)+1,"; Total:",round(n0)+round(n1)+2,sep=""))}
  if (corr==TRUE) {return(paste("Control:",round(n0corr)+1,"; Case:",round(n1corr)+1,"; Total:",round(n0corr)+round(n1corr)+2,sep=""))}
}

shinyServer(function(input, output) {
  
  output$text1 = renderText({
    if (input$method=="rate") {
      N = Samplesize(Sig = input$Sig,p = input$p, X = input$X)      
      return(paste("We need",round(N),"samples for this sampling."))
    }
    if (input$method=="cc") {"Sample size without continuity correction:"}
  })
  
  output$text2 = renderText({
    if (input$method=="rate") {return(NULL)}
    if (input$method=="cc") {Samplesize_OR(alpha=input$alpha,power=input$power,OR=input$OR,r=input$r,p0=input$p0)}
  })
  
  output$text3 = renderText({
    if (input$method=="rate") {return(NULL)}
    if (input$method=="cc") {"Sample size with continuity correction:"}
  })
  
  output$text4 = renderText({
    if (input$method=="rate") {return(NULL)}
    if (input$method=="cc") {Samplesize_OR(alpha=input$alpha,power=input$power,OR=input$OR,r=input$r,p0=input$p0,corr=TRUE)}
  })
  
})

