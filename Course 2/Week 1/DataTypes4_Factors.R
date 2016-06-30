# Data types - Factors (enum)


## level order assigned alphabetically: (default)
x <- factor(c("yes","yes","no","yes","no"))
table(x)
unclass(x)
attr(x,"levels")

## mofify the level order:
x <- factor(c("yes","yes","no","yes","no"),
            levels = c("yes","no"))
