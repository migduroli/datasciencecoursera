# Reading from MySQL, one of the most widely used data bases
# also applied for internet applications
# Data are structured in databases, structured in tables, where
# one fnids different fields
# We can think of each of each table as a data set, each field as
# a column and every row is called record.

# Goals: Install MySQL and RMySQL
# use of UCSC MySQL
# genome.ucsc.edu/goldenPath/help/mysql.html
library("RMySQL")

ucscDb <- dbConnect(MySQL(), 
                    user="genome",
                    host="genome-mysql.cse.ucsc.edu")

#dbGetQuery sends a command ".." to MySQL based on a handle 
result <- dbGetQuery(ucscDb,"show databases;") # result is a handle

dbDisconnect(ucscDb)

## Getting a handler for the field "hg19"
hg19 <- dbConnect(MySQL(), 
                  user = "genome",
                  db = "hg19",
                  host="genome-mysql.cse.ucsc.edu")

## Extracting all tables' names:
allTables <- dbListTables(hg19)
length(allTables)
head(allTables)

# list of columns of a particular table, e.g hg19["affyU133Plus2"]

## Counting all elements of a table:
hg19_allFields <- dbListFields(hg19,"affyU133Plus2")
dbGetQuery(hg19,"select count(*) from affyU133Plus2")

## Extracting a table:
# lets read a particular table from hg19
affyData <- dbReadTable(hg19, "affyU133Plus2")

# Extract a specific subset of the table:

msql.select <- "select"
msql.from <- "from"
msql.between <- "between"
msql.and <- "and"
msql.where <- "where"

rows <- "*"
table <- "affyU133Plus2"
field <- "misMatches"
rowsLim <- c(1,3)

queryKernel <- paste(msql.select,rows,
                     msql.from,table,
                     msql.where, field,
                     msql.between, toString(rowsLim[1]),
                     msql.and, toString(rowsLim[2]),sep=" ")

query <- dbSendQuery(hg19,queryKernel)

# The * goes for the "observations"/"records" (rows)
affyMis <- fetch(query)
quantile(affyMis$misMatches)

dbClearResult(query)


## Remember to disconnect when you finish with the 
## data!!!! 
dbDisconnect(hg19)



# Never PUSH thing in the 

