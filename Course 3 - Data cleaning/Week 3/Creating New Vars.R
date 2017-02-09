# A way of adding functionality to our data frames:

fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
if(!file.exists("./data")){dir.create("./data")}

if(.Platform$OS.type == "windows") {
    download.file(fileUrl, destfile = "./data/Restaurants17.csv") 
}

if ( .Platform$OS.type == "unix" ) {
    download.file(fileUrl, destfile = "./data/Restaurants17.csv",method = "curl")
}

restData <- read.csv("./data/Restaurants17.csv")

# Sometimes we need an index for our data:
s1 <- seq(1,10,by = 2);
s1

s2 <- seq(1,10, length = 3)
s2

x <- c(1,3,8,25,100)
seq(along=x)

restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
head(restData)
nearMeTable <- table(restData$nearMe)

# Filtering with ifelse
restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong,restData$zipCode < 0)

# Categorical variables:

restData$zipGroups <- cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups,restData$zipCode)

install.packages("Hmisc")
library(Hmisc)
restData$zipGroups <- cut2(restData$zipCode,g = 4)
table(restData$zipGroups)

# Creatin factor variables:
restData$zcf <- factor(restData$zipCode)
table(restData$zcf)

# Levels of factor variableS:
yesno <- sample(c("yes","no"),size= 10, replace = T)
yesnofac <- factor(yesno,levels = c("no","yes"))


# Another way of creating additional columns with plyr
library(plyr)
restData2 <- mutate(restData,zipGroups = cut2(zipCode, g=4))
table(restData2$zipGroups)

# Also it's quite likely we'll need to use some of the following
# transformations:
# abs() sqrt() ceiling() floor() round(, digits= ) 
# signif( digits = ), cos() sin() log() log2() log10() exp()


