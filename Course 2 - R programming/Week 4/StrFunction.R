# str() is one of the most powerful tools of [R], it allows
# us to get a lot of information about an object in a very
# compact format. Some examples:

str(str)
str(lm)

x <- rnorm(100,0,2)
summary(x)
str(x)

# factor variable: Generate Factor Levels (very useful to split)
f <- gl(n = 10, 10)
str(f)
summary(f)


library(datasets)
head(airquality)
str(airquality)

m <- matrix(rnorm(100),10,10)
str(m)
summary(m)

s <- split(airquality, airquality$Month)
str(s)