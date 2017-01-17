
?Rprof

# Rproof()
# summaryRprof() to be readable
# DO NOT use system.time and Rproof simultaneously

# Theory:
#   it keeps track of the function call stack at regularly
#   sampled intervals and tabulates how much time is spend
#   in each function
#   Default sampling interval = 0.02 secs
#   NOTE: if the code is quick, Rproof is not useful !!!


# Normalizing: by.total or by.self
#   by.total : how much total time was spent in the whole
#           function including top and low level functions
#   by.self : it substracts the top level functions, so 
#           theoretically this is the more accurate picture
#           of which functions are consuming more time

library(stockPortfolio)
fileName <- "Rprof_example.txt"
Rprof(fileName)
gr <- getReturns(c("GOOG", "MSFT", "IBM"), freq="week")
Rprof(NULL)
summaryRprof(fileName)$by.total[1:8,]
