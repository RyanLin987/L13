obs = 500
M = 170
S = 10
Coler = "blue"
dist = rnorm(obs,mean=M,sd=S)
hist(dist,col=Coler)

#################################
Sig = 0.05  #two-sided significance level
p = 0.5     #The expected rate
X = 0.03    #Acceptable error range
Z = qnorm(1-Sig/2)   #The Z value based on the two-sided significance level 
n = p*(1-p)*Z^2/X^2  #Calculate the needed number of sample
n           #Print the outcome



Samplesize = function(Sig,p,X) {
  Z = qnorm(1-Sig/2)
  n = p*(1-p)*Z^2/X^2
  n
}

Samplesize(Sig = 0.05,p = 0.5, X = 0.03) #Test 1
Samplesize(Sig = 0.05,p = 0.2, X = 0.03) #Test 2
Samplesize(Sig = 0.05,p = 0.2, X = 0.05) #Test 3






