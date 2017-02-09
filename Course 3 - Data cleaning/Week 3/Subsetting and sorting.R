# Generating the data set

set.seed(13435)
X <- data.frame("var1" = sample(1:5),
                "var2" = sample(6:10),
                "var3" = sample(11:15))
X <- X[sample(1:5),]
X$var2[c(1,3)] = NA

# Column subsetting
X[,1]
X[,"var1"]

# matrix subset
X[1:2,"var2"]

# Logical subsetting
X[X$var1 <= 3 & X$var3 > 11]
X[X$var1 <= 3 | X$var3 > 15]

# indices of ...
X[which(X$var2>8),]

# sorts:
sort(X$var1)
sort(X$var1,decreasing = T)
sort(X$var1,na.last = T) # Put all the NA at the end

# Ordering:
X[order(X$var1),]
X[order(X$var1,X$var3),]

library(plyr) #ordering with plyr
arrange(X,var1)
arrange(X,desc(var1))

# Adding rows and frames:
X$var4 <- rnorm(length(X$var1))
Y <- cbind(X,rnorm(length(X$var1))) # column-bind
Y <- rbind(X,rnorm(length(X[1,]))) # column-bind