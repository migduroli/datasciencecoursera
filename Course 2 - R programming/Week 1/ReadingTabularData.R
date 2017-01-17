# Reading tabular data

## read.table and read.csv
## readLines [to read in a text file]
## source [to read R code]
## dget [for reading in R code files]
## load [for reading saved workspaces]
## unserialize [for reading single R objects in binary form]

# Writing tabular data

## write.table and read.csv
## writeLines [to read in a text file]
## dump [to read R code]
## dput [for reading in R code files]
## save [for reading saved workspaces]
## serialize [for reading single R objects in binary form]

# Reading with read.table (arguments)

## file = " ... "
## header = TRUE or FALSE
## sep = "..." [can be space whatever set of characters/string]
## nrows = number of rows in the data set
## comment.char = set of characters identifying the comments on a data set
## skip = number of lines to skip before beginning
## stringAsFactors = should character variables be coded as factors? (default TRUE!!!)

# Example
data <- read.table("foo.txt") # default separator [space]
data <- read.csv("foo.txt") # the only difference with read.table is the default separator [comma]


