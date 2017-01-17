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

# Applying anonimous functions:
 x <- list( a = matrix(1:4,2,2), b = matrix(1:6, 3,2))
lapply(x, function(d){ d[,1] } )


#sapply simplifies the output to more convenient formats:
x <- list( a= 1:5, b=rnorm(10))  
sapply(x,mean)

# apply (to apply a function over the margins of an array)
# (not faster than for loops nowadays, less typing which is better)
x <- matrix(rnorm(200),20,10)
apply(x, 2 , mean) # the second number is the index which will be retained
                  # mean of the columns
apply(x, 1 , sum) # sum of the rows

# pre-existing functions optimised for this:
# rowSums = apply(x,1,sum)
# rowMeans = apply(x,1,mean)
# colSums = apply(x,2,sum)
# colMeans = apply(x,2,means)

apply(x, 1, quantile, probs = c(0.25,0.75))

# another example
a <- array(rnorm(2*2*10),c(2,2,10))
apply(a , c(1,2), mean)

rowMeans(a,dims=2)