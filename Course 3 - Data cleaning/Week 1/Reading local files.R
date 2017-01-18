# Some things to remember:

########################################
# FLAT FILES:
########################################

# Flat files are usually read by using read.table()
# this gives us a lot of functionality through parameters
# it reads data in RAM, so very big data can cause problems
# so probably is not the best way of reading very big data

cameraData <- read.table("./data/camera.csv", sep = ",", header = TRUE)
head(cameraData)

# more important parameters you can pass:
## quote = "" means no quotes.
## na.strings - set the character that represents a missing value
## nrows - how many rows to read of the file
## skip - number of lines to skip before starting to read

# One of the major problems in data are the quotation marks " or `
# setting quote = "" often resolves this issue

########################################
# EXCEL FILES:
########################################

fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/cameras.xlsx") # do not work! missing .xlsx
dateDownloaded <- date()

library("xlsx")
cameraData <- read.xlsx("./data/camera.xlsx",sheetIndex = 1, 
                        header = TRUE)
# to read only few rows or cols
colsIndex <- 2:3
rowsIndex <- 1:4
cameraDataSubset <- read.xlsx("./data/camera.xlsx",sheetIndex = 1, 
                        colIndex = colsIndex,
                        rowIndex = rowsIndex,
                        header = TRUE)

# There is also write.xlsx and read.xlsx2 (which is much faster)
# XLConnect is another package with more functionality 
# XLConnect vignette is a good place to understand the package

########################################
# XML FILES:
########################################
# Extensible Markup Language (structured data widely used in the internet)

# The components:
#   Markup (label that give the struture)
#   Content (the actual text)

# Tags, elements and attributes
# Tags: <section> content </section>
#       <line-break />

# Elements: specific examples of tags,
#   <Greeting> Hello! </Greeting>

# Attributes are components of the label
# - <img src="jpg" alt=instuctor"/>
# - <step number = "3"> Connect A to B. </step>

# Example:: http://www.w3schools.com/xml/simple.xml
library(XML)
fileURL <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileURL,useInternal = TRUE)
rootNode <- xmlRoot(doc) # wrapper of the whole document
xmlName(rootNode) 
names(rootNode)

# direct access to parts of XML
rootNode[[1]]
rootNode[[1]][[1]]

# programatically extract parts of the file:
xmlSApply(rootNode,xmlValue)

### Much more with XPath!!!

xpathSApply(rootNode,"//name",xmlValue) 
# getVal of nodes with label "name" 

xpathSApply(rootNode,"//price",xmlValue) 
# getVal of nodes with label "name" 

fileURL <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileURL, useInternalNodes = TRUE)
rooNote <- xmlRoot(doc)

scores <- xpathSApply(rootNode,"//li[@class='score']",xmlValue)
# get values of "list items" of class score

teams <- xpathSApply(doc,"//li[@class='team-name']",xmlValue)
# get values of "list items" of class team-name

########################################
# JSON FILES:
########################################
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)

# convert from data.frame to JSON with toJSON(...)
myjson <- toJSON(iris,pretty = TRUE)
cat(myjson)

iris2 <- fromJSON(myjson)
head(iris2)