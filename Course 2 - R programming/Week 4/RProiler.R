# Profiling the performance of your code
# very useful to optimize your code
# systematic way of learning where our code is wasting time

# Before anything else: use system.time()


system.time(readLines("http://www.lutsko.com"))

system.time(
    {
        n <- 1000
        r <- numeric(n)
        for (i in 1:n)
        {
            x <- rnorm(n)
            r[i] <- mean(x)
        }
    }
)

# it assumes you know where to look. What if we don't know 
# where to measure the time?