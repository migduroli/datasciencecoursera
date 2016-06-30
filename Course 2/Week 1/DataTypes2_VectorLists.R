# Data types - Vectors and lists

# Vectors 
## Ways of creating vectors (and their kind)
x <- c(0.5,0.6)     ## numeric
x <- c(TRUE,FALSE)  ## logical
x <- c("a","d")     ## character
x <- c(1+2i,2+4i)   ## complex vector


x <- vector(mode = "numeric", length = 10)

## Implicit Coercion
x <- c(1.7, "a")    ## character
x <- c(T, 2)        ## numeric
x <- c("a", T)      ## character

## Explicit Coercion
x <- 0:6
class(x) # integer
as.numeric(x)
as.logical(x)
as.character(x)
### errors:
x <- c("a","b","c")
as.numeric(x)       ## NAN


# List: mixing types
x <- list(1, "a", TRUE, 1+2i)



