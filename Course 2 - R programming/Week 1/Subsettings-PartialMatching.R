# Subsettings Partial Matching

x <- list(aardvark = 1:5)
x$a # it is equivalent to x$aardvark
x[["a",exact = FALSE]] # to produce the same result