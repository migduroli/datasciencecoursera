# Connections: Interfaces to the outside World

## There are many functions to connect R with the outside world
# e.g. file ( can read a file ), gzfile (opens a gzip)
# also bzfile( ... ) and url(... that connects with a website)

str(file)
# function (description = "", open = "", blocking = TRUE, encoding = getOption("encoding"), 
#            raw = FALSE, method = getOption("url.method", "default"))

# Advantages of connectons: we don't have to deal with the
# connection interface directly. E.g.
con <- file("foo.txt", "r")
data <- read.csv(con)
close(con)

#which is equivalent to:
data <- read.csv("foo.txt")

# Another example:
con <- gzfile("words.gz")
x <- readLines(con, 10)

# To read a webpage info
con <- url("http://www.lutsko.com/","r")
x <- readLines(con)
head(x,n = 20)