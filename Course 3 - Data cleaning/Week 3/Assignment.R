
inData <- "./data"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

if(!file.exists("./data")){dir.create("./data")}
download.file(fileUrl, destfile = "./data/md.csv")

tmp <- read.csv("./data/md.csv")
df <- as_data_frame(tmp)
rm(tmp)

## Ex 1

df.Logical <- (df$ACR >= 3 & df$AGS >=6)
agricultureLogical <- df.Logical
which(agricultureLogical)
# 125, 238,262

## Ex 2 

picUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
# take care when downloading, sometimes it produces errors!!!
download.file(picUrl, destfile = "./data/pic.jpg")
install.packages("jpeg")
library(jpeg)
picMat <- readJPEG("./data/pic.jpg",native=TRUE)
    # 30%       80% 
    # -15259150 -10575416 

## Ex 3

tmp1 <- read.csv("./data/grossDomProd.csv", skip = 5, header = F, 
                 na.strings = c(""," ","..","NA"), nrows = 190,
                 stringsAsFactors=FALSE)

df1 <- as_data_frame(tmp1) %>% select(V1, V2, V4, V5) %>% 
    rename(CountryCode = V1, Rank = V2, Country = V4,  Millions = V5) 

df2 <- read.csv("./data/FEDSTATS.csv",colClasses = c(rep("character",31))) %>% 
    as_data_frame

df12 <- as_data_frame(merge(df1,df2,by="CountryCode"))
df12.arr <- as_data_frame(arrange(df12, desc(Rank)))
df12.arr[13,"Country"]
# length(df12$CountryCode)
# St. Kitts and Nevis

## Alternative:
# library(data.table)
# library(dplyr)
# gdp <- fread("./data/grossDomProd.csv", skip = 4, nrows = 190, select = c(1, 2, 4, 5), col.names = c("CountryCode", "Rank", "Economy", "Total"))
# edu <- fread("./data/FEDSTATS.csv")
# View(gdp)
# View(edu)
# merge <- merge(gdp, edu, by = 'CountryCode')
# merge.arr <- arrange(merge, desc(Rank))
# filter(merge.arr,Rank == 13)



# Ex 4:
ig <- "High income: OECD"
ign <- "High income: nonOECD"
df12.ig <- df12 %>% filter(Income.Group == ig) %>% select(CountryCode,Income.Group,Rank)
#df12.ig <- mutate(df12.ig, Millions = as.numeric(sub(",",".",Millions)))

df12.ign <- df12 %>% filter(Income.Group == ign) %>% select(CountryCode,Income.Group,Rank)
#df12.ign <- mutate(df12.ign, Millions = as.numeric(sub(",",".",Millions)))

summary(df12.ig$Rank)
summary(df12.ign$Rank)


# Ex 5:
df12.groups <- cut(df12$Rank, breaks = 5)
table(df12.groups, df12$Income.Group)

# = 5