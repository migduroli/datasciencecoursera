# Vectorised Operations

# This is element-wise operations, as in Matlab

x <- 1:5
y <- 6:10

x + y

x * y

x >= 2
y < 10
x/y

# Matrices:

x <- matrix(1:4, 2,2)
y <- matrix(rep(10,4),2,2)

# element-wise
x/y
x*y
# true matrix multiplication:
x %*% y
