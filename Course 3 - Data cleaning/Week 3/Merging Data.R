# Merging several data sets

InData <- "./data"
if(!file.exists(InData)){dir.create(InData)}
fileURL1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileURL2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileURL1, destfile = paste(InData,"reviews.csv",sep=""))
download.file(fileURL2, destfile = paste(InData,"solutions.csv",sep=""))

reviews <- read.csv(fileURL1)
solutions <- read.csv(fileURL2)

head(solutions)
names(solutions)
names(reviews)

# both have an id connecting both tables:
# by default it searches common names

mergedDate <- merge(reviews,solutions,by.x="solution_id",
                    by.y = "id", all = T)

intersect(names(solutions),names(reviews))

# join is the same as merge but it's less readable (although faster)

# df1 = data.frame(id = sample(1:10), x = rnorm(10))
# df2 = data.frame(id = sample(1:10), y = rnorm(10))
# arrange(join(df1,df2),id)

