# Subsettings 1

x <- c("a","b","c","d")

# single brackets extract elements of the same class as the
# mother class
x[1]
x[2:3]
x[x>"a"]

u <- (x>"a")
x[u]

# Subsettings 2

x <- list(foo = 1:4, bar = 0.6)
x[1] # the output is another list
x[2] 
x[[1]] # the output is foo, i.e. not a list
x$foo  # the same
x$bar

# To subset several elements of a list we need to use the
# single bracket:

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1,3)]

name <- c("foo")
x[[name]] # gives the element
x$name    # does not exist!
x$foo     # it does exist!

# To get an element of a list which is an element of another
# list we need to use c(i,j) in double brackets:

x <- list( a = list(10,11,12), b=c(1,2,3,4,5))
x[[c(1,3)]] # = a[3] = 12
x[[c(2,3)]] # = b[3] = 3
x[[1]][[3]] # = a[3]
x[[2]][[3]] # = b[3]