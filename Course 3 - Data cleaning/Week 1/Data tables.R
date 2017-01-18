# data.table > data.frame
# (often faster and more memory efficient 
# than data.frame as is written in C)
# much much faster in subsetting, etc.

library(data.table)
DF <- data.frame(x=rnorm(9),y=rep(c("a","b","c"),3),z=rnorm(9))
DT <- data.table(x=rnorm(9),y=rep(c("a","b","c"),3),z=rnorm(9))

# subsetting:
DT[2,]
DT[DT$y=="a",]
# with only one index!
DT[c(2,3)] # rows!!!
DT[,c(2,3)] # completely different

DT[,list(mean(x),sum(z))] # very powerful and not equivalent in data.frame
DT[,table(y)]

# Add new colums (very fast)
DT[,w:=z^2] # add new column w
# Careful!!!
DT2 <- DT # This is not a copy, it's a reference (alias), so
DT[,y:=2] # will change DT2 too,
head(DT)
head(DT2)

DT2 <- copy(DT) # copy constructor!!!
DT[,y:= sqrt(abs(z))]
head(DT)
head(DT2)

# multiple step functions to create new columns
DT[,m:= {tmp <- (x+z); log2(tmp+5)}]
head(DT)

# plyr like operations
DT[,a:= x>0]
DT[,b:= mean(x+w), by=a]

# Special variables:
set.seed(123)
DT <- data.table(x = sample(letters[1:3],1E5,TRUE))
DT[, .N, by = x] # .N is just count the number of times it appears a value of "x"

# Keys: to sort and subset
DT <- data.table(x=rep(c("a","b","c"),each=100),y=rnorm(300))
setkey(DT,x)
DT['a'] # only those values for "a" (very fast subset)

# Joins:
DT1 <- data.table(x = c('a','a','b','dt1'),y = 1:4)
DT2 <- data.table(x = c('a','b','dt2'),z = 5:7)
setkey(DT1,x); setkey(DT2,x)
merge(DT1,DT2)