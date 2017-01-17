# Data types - Missing values

## How to detect missing values?
x <- 1:10
is.na(x)
is.nan(x)

x <- c(1,2, NA, NaN, 3)

## NaN is always NA but not the other way round!
is.na(x)
## [1] FALSE FALSE  TRUE TRUE FALSE

is.nan(x)
#[1] FALSE FALSE FALSE TRUE FALSE


