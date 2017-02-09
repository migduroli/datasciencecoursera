# Summarizing data 

fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
if(!file.exists("./data")){dir.create("./data")}

if(.Platform$OS.type == "windows") {
    download.file(fileUrl, destfile = "./data/Restaurants17.csv") 
}

if ( .Platform$OS.type == "unix" ) {
    download.file(fileUrl, destfile = "./data/Restaurants17.csv",method = "curl")
}

restData <- read.csv("./data/Restaurants17.csv")

head(restData,n=3)
tail(restData,n=3)

 # Two most important:
summary(restData)
str(restData)

# Statistical analysis:
quantile(restData$councilDistrict,na.rm = TRUE)
quantile(restData$councilDistrict,probs = c(0.5,0.75,0.9))

# Table structure to summarise:

# ifany => to include NA where missing values
table(restData$zipCode,useNA="ifany")
table(restData$councilDistrict, restData$zipCode)

# check for missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

# Finding values with certain properties
# Remember %in% means an binary operator created by %in% <- function(x,y) {...}

table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","212123")) 
# either one or to other
restData[table(restData$zipCode %in% c("21212","212123")),]

# Cross tabs:
data("UCBAdmissions")
DF <- as.data.frame(UCBAdmissions)
head(DF)
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit, data = DF)
# Frequency is split into Admitted an Gender
xt


data("warpbreaks")
head(warpbreaks)
warpbreaks$breaks <- rep(1:9,len = 54)
warpbreaks
xt <- xtabs(Freq ~ ., data = DF)
ftable(xt)


# Size of:
print(object.size(xt),units = "Kb")
