# Data types - Data Frames

## Vectors:
x <- 1:10
names(x)
names(x) <- c("one","two","three","four","five","six","seven","eight","nine","ten")
print(x)
#one   two three  four  five   six seven eight  nine   ten 
#1     2     3     4     5     6     7     8     9    10 

## Lists:
x <- list(a=1,b=2,c=3)

## Matrices:
m <- matrix(1:4, nrow=2,ncol=2)
dimnames(m) <- list(c("a","b"),c("c","d"))