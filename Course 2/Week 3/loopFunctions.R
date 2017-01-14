# lapply:
# it always returns a list

x <- list( a= 1:5, b=rnorm(10))  
lapply(x,mean)

x <- list ( a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100, 5))
lapply(x,mean)

x <- 1:4
lapply(x, runif)
# passing additional parameters of runif
lapply(x, runif, min = 0, max = 10)
