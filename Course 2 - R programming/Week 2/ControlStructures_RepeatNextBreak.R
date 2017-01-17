# Repeat initiates an infinite loop: no counter or condition required
#                               very useful for optimization routines

# Break is used to terminate any loop

x0 <- 1
tol <- 1e-8

repeat {
  x1 <- rpois(1,1.5)
  if (abs(x1-x0) < tol) {
    break
  } else {
    x0 <- x1;
  }
}

# Next is a way to skip the current iteration:
for (i in 1:10) {
  if ( i < 5) {
    next
  }
  print(i)
}