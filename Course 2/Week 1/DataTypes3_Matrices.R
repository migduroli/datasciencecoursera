# Data types - Matrices

## Definition and attributes
m <- matrix(nrow = 2, ncol = 3)
dim(m)          # [1] 2 3
attributes(m)   # $dim [1] 2 3


## Alterantive initialisation
### using matrix
m <- matrix(1:10, nrow = 2, ncol = 5)

### modifing the dimension of a vector
m <- 1:10
dim(m) <- c(2,5)

### using cbind and rbind
x <- 1:3
y <- 10:12
m1 <- cbind(x,y)
m2 <- rbind(x,y)




