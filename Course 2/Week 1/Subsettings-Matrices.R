# Subsettings Matrices

x <- matrix(1:(2*3), 2, 3)
x[1,2] # =  3
x[1,]  # = [1,3,5]
x[,2]  # = [3,4]

# In this case the output is not a matrix!!!
x[1,2, drop = FALSE]
x[1,, drop = FALSE]
x[,2, drop = FALSE]