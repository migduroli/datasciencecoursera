# Subsettings Removing NA

x <- c(1,2,NA,4,NA,5)
bad <- is.na(x) # logical vector with the wrong positions 
x[!bad]


# Multiple vectors:

y <- c("a","b",NA,"d",NA,"f")
good <- complete.cases(x,y)
x[good]
y[good]

# Complete.cases can also be applied to a data frame to
# remove all the NA rows