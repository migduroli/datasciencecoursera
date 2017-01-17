# Textual Data Format

# There are many other type of data which are not tabular
# They can contain a lot more metadata, etc.
# Metadata is important for recovery!!!
# Textual formats can be longer-lived; 
#   if there is corrumption somewhere in the file it can be
#   easier to fix the problem
# They tend to take a lot of space: so they'll probably compressed

## dput-ting R objects

y <- data.frame(a = 1, b = "a")
dput(y)
dput(y, file = "y.R")
new.y <- dget("y.R")
new.y  # recovered!

## dump-ing R objects
x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x","y"), file = "data.R")
rm(x,y)
source("data.R") # recovered!
