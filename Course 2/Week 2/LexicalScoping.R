# Lexical Scoping

# This function return another function
make.power <- function(n)
{
  pow <- function(x)
  {
    x^n
  }
  pow
}

cube <- make.power(3)
ls(environment(cube))
get("n",environment(3))

# Dynamic scoping
y <- 10

f <- function(x) {
  # dynamical scoping
  y <- 2
  y^2 + g(x)
}

g <- function(x) {
  # lexical scoping
  x*y
}