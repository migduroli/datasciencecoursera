file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(file,destfile = "./data/communities.csv")
data <- read.csv("./data/communities.csv",sep=",")

TEST <- which(data$VAL == 24)
length(data$VAL[TEST])

file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(file,destfile = "./data/gas.xlsx")

#Sys.setenv(JAVA_HOME = "C:\\Program Files (x86)\\Java\\jdk1.7.0_55\\jre")

library("openxlsx")

dat <- read.xlsx("./data/NGAP.xlsx", rows = 18:23, cols= 7:15)

library(XML)
install.packages("RCurl")
library(RCurl)
tempURL <- getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml")
rests <-  xmlParse(tempURL, useInternal = TRUE)
rootNode <- xmlRoot(rests)

names(rootNode)
zips <- xpathSApply(rootNode,"//zipcode",xmlValue) 
length(which(zips == 21231))

file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(file,destfile = "./dataTable.csv")

DT <- fread(file = "./DataTab.csv",sep = ",")

Rprof(tmp <- tempfile())
Rprof()
DT[,mean(pwgtp15),by=SEX]
summaryRprof(tmp)

Rprof()
tapply(DT$pwgtp15,DT$SEX,mean)
summaryRprof(tmp)


system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
