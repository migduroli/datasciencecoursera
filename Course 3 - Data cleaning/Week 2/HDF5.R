# This lecture is devoted to reading data bases in HDF5 format, 
# a highly structured format that allows us to have <em>groups</em> 
# of data types in a very compact (heirarchical) way.

# Groups have a <em>group name</em> and <em>group symbol table</em>, 
# which has a list of objects in each group

# datasets are multidimensional array of data elements with metadata
# - header with name, datatype, dataspace and storage
# - data array with the data
# http://www.hdfgroup.org

source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library("rhdf5")

created <- h5createFile("example.h5")
created

# create groups:
nameFileH5 <- "example.h5"
created <- h5createGroup(nameFileH5, "foo")
created <- h5createGroup(nameFileH5, "baa")
created <- h5createGroup(nameFileH5, "foo/baa")

A <- matrix(1:6,2,3)
B <- matrix(1:10,2,5)
df <- data.frame(x=rnorm(20),y=rnorm(20))

h5write(A,nameFileH5, "foo/A")
h5write(B,nameFileH5, "foo/baa/B")
h5write(df,nameFileH5, "df")
h5ls(nameFileH5)

readA <- h5read(nameFileH5,"foo/A")
readB <- h5read(nameFileH5,"foo/baa/B")
readdf <- h5read(nameFileH5,"df")

## Writing and reading chunks

h5write(c(12,13,14),nameFileH5,"foo/A",index=list(1,1:3))
# same works for read



