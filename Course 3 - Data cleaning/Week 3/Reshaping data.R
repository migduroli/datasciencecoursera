# Reshaping data
# Goal: tidy data!

install.packages("reshape2")
library(reshape2)
head(mtcars)

# melting data sets:

mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),
                measure.vars = c("mpg","hp"))
head(carMelt,n=3)

# Casting data frames:

cylData <- dcast(carMelt, cyl ~ variable)
cylData

# other way of splitting by index (recalling tapply)
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)
# the split-apply-combine tech.
spIns <- split(InsectSprays$count,InsectSprays$spray)
spIns
sprCount <- lapply(spIns,sum)
unlist(sprCount) ==sapply(spIns,sum)
# another way: plyr package
ddply(InsectSprays, .(spray), summarise, sum= sum(count))
spraySums <- ddply(InsectSprays, .(spray), 
                   summarise, sum= ave(count,FUN= sum))
head(spraySums)