add2 <- function(x,y)
{
  x+y
}

above10 <- function(X) {
  use <- x > 10
  x[use]
}


aboveN <- function(x,N = 10) {
  use <- x > N
  x[use]
}

columnMean <- function(data, removeNA = TRUE) { 
  nc <- ncol(data)
  means <- numeric(nc)
  for (i in 1: nc) {
   means[i] <- mean(data[,i],na.rm = removeNA) 
  }
  means
}