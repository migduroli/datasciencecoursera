## 1

library(httr)
oauth_endpoints("github")
myapp <- oauth_app("github",
                   key = "key",
                   secret = "secr")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
gitURL <- "https://api.github.com/users/jtleek/repos"
Repos <- GET(gitURL)
stop_for_status(Repos)


library(jsonlite)
json1 <- content(Repos)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2$created_at[json2$name == "datasharing"]


## 2
if (!require(sqldf)) {
    install.packages("sqldf")
}
library(sqldf)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, destfile = "./data/acs.csv", method = "curl")
acs <- read.csv("./data/acs.csv")


## 3

URL <- "http://biostat.jhsph.edu/~jleek/contact.html"
library(XML)
html3 <- readLines(URL)
close(URL)

url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url2,destfile = "./data/tab.for")


tab2 <- read.fwf("./data/tab.for", skip = 4, widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
sum(tab2[,4])
### ALTERNATIVE 1 (2x faster than read.fwf)
# df <- read.fwf(
#     file=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"),
#     widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4),
#     skip=4
# )
### ALTERNATIVE 2
# x <- readLines(con=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"))
# 
# # Skip 4 lines
# x <- x[-(1:4)]
# 
# mydata <- data.frame(var1 = substr(x,1,10),
#                      var2 = substr(x, 16,19),
#                      var3 = substr(x, 20, 23),
#                      var4 = substr(x, 29, 32)  # and so on and so on
# )



