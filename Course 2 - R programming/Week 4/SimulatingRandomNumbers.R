# Some functions available to simulate random numbers
#
#   rnorm: Normal random variable, i.e x ~ N(mean, sd)
#   dnorm: Normal PDF, i.e. rho(x) with x ~ N(mean,sd)
#   pnorm: Cumulative distribution, i.e. F(x) 
#   rpois: Generate Poisson numbers, i.e. x ~ Pois(lambda)

# For any ditribution there will be: (r), (d), (p) and (q) names,
# as we have seen for norm. E.g. there will be, rpois, dpois,
# qpois and ppois.

# dnorm(x, mean = 0, sd = 1, log = FALSE) # rho(x)

# This is F(x)
# pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE) 

# This is F^{-1}(x)
# qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE) 

# rnorm(n, mean = 0, sd = 1) # x

# set.seed(1) # to be the same exactly
x <- rnorm(10)
x2 <- rnorm(10,mean = 20, sd=2)

x3 <- rpois(10, 1)
x4 <- rpois(10, 20)

ppois(2,2) ## Pr( X <= 2)
ppois(4,2) ## Pr( X <= 4)
ppois(6,2) ## Pr( X <= 6)