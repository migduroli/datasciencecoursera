# Dates and times

# Date is the class for dates:
#   dates are internally saved as number of days since 1970-01-Jan
# POSIXlt or POSIXct are for time
#   times are internally saved as number of seconds since 1970-01-Jan

x <- as.Date("1970-01-01")

unclass(x) # = 0;
unclass(as.Date("1970-01-02")) # = 1;

# POSIX are standards: ct -> very large integer lt -> it contains more useful info, e.g. month day of the year, etc.

x <- Sys.time()

p <- as.POSIXct(x)
names(unclass(p))

p <- as.POSIXlt(x)
names(unclass(p))
p$sec
p$min
p$mday

# strptime : transform days in strings to days as objects
datestring <- c("January, 14, 2012 00:32:43",
                "January, 10, 2017 10:21:30")
x <- strptime(datestring,"%B, %d, %Y %H:%M:%S")
class(x)
# operations:
d1 <- x[1]
d2 <- x[2]
diffDays <- d2-d1

# POSIX times take into account very tricky things, e.g. leap years
# or different time zones