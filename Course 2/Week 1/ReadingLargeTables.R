# Reading large tables

## HINT 1: if your data set is bigger than your RAM --> STOP!
## HINT 2: how to make it faster? --> specify the data type!
##         if we don't specify it, R will spend time trying to
##         figure out the type for every data

initial <- read.table("data.txt",nrows = 100)
classes <- sapply(initial,class)
tabaAll <- read.table("data.txt", colClasses = classes)

## Basic rule to estimate the size of your data table
rows <- 1500000
cols <- 120
bytesPerNumeric <- 8

MemBytes = rows*cols*bytesPerNumeric
MemMB = MemBytes/(2^20)
MemGB = MemMB/(2^10)