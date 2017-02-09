#
# Getting data from Web, API and authentication: Webscraping
# (Interesting to read: How Netflix reverse-engineered Hollywood)
# Some times this is against the terms of service of the website.
#

# Webscraping google scholar:

con <- url("https://scholar.google.com/citations?user=WyjS6WsAAAAJ")
htmlCode <- readLines(con)
close(con)
htmlCode

library(XML)
con <- url("https://scholar.google.com/citations?user=WyjS6WsAAAAJ")
html <- htmlTreeParse(con, useInternalNodes = T)
xpathSApply(html, "//title", xmlValue)
close(Con)

# to me better:
library(httr)
url <- "https://scholar.google.com/citations?user=WyjS6WsAAAAJ"
html2 <- GET(url)
content2 <- content(html2, as = "text")
parsedHTML <- htmlParse(content2,asText = T)
xpathSApply(parsedHTML, "//title", xmlValue)

## Accessing websites with passwords:
pg1 <- GET("http://httpbin.org/basic-auth/user/passwd",
           authenticate("user","passwd"))
pg1

## Use handles to save the authentication 
 
google <- handle("http://google.com")
pg1 <- GET(handle = google,path ="/")
pg2 <- GET(handle = google,path ="search")