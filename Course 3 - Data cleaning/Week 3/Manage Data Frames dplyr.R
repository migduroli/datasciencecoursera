# dplyr:

# Assumptions made by dplyr (rows = observarions and columns = vars)
# the same as for tidy data.
# Provide no new functionality but "verbs" for data manipulation 
# Verbs:
    # arrange -> return subset of the columns 
    # filter  -> extract a subset of rows from a data frame 
    # select  -> reorder rows of a data frame
    # mutate  -> add new variables or transform existing
    # rename  -> renames variables
    # mutate  -> create and manipulate variables
    # summarise -> summary statistics

# There is also a handy print that avoids unnecessary massive print

install.packages("dplyr")
library(dplyr)

# the most handy way of selecting rows:
head(select(mtcars, mpg:hp))
head(select(mtcars, -(mpg:hp)))

# the most handy way of creating subsets with conditions:
mtcars.f <- filter(mtcars, hp > 100)
mtcars.f <- filter(mtcars, hp > 100 & mpg > 20)
head(mtcars.f)

# reorder based on the values on a column: ARRANGE
mtcars.a <- arrange(mtcars, desc(mpg)) # desc is for desceding

# renaming a variable: a pain in the neck!!
mtcars <- rename(mtcars, cylinder = cyl)
head(mtcars)
mtcars <- rename(mtcars, cyl = cylinder)

# mutate  
mtcars <- mutate(mtcars, mpgdetrend = mpg-mean(mpg, na.rm = T))
head(mtcars)
# adding a label:
mtcars <- mutate(mtcars, 
                 mpgcat = factor(mpgdetrend > 1,
                                 labels = c("green","black")))
mtcars.eco <- group_by(mtcars, mpgcat)

# this generates a new column (var) mpgcat based on whether the
# condition in factor is true or not and the labels are green or black

summarize(mtcars.eco, 
          hp = mean(hp,na.rm = T), 
          qsec = mean(qsec))


# pipline operator: %>%
mtcars %>% mutate(gearAv = mean(gear)) %>%
    group_by(mpgdetrend) %>% summarise(mean(qsec),mean(hp))
# with %>$ we are saying take the output as input for the next
# opperation 
