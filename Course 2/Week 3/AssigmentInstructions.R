makeVector <- function(x = numeric()) {
    m <- NULL
    
    # getters and setters
    get <- function() x
    set <- function(y) {
        x <<- y # <<-: search to made through parent 
                # environments for an existing 
                # definition of the variable being assigned.
        m <<- NULL
    }
    
    getmean <- function() m
    setmean <- function(mean) m <<- mean
    
    # Return:
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
}

cachemean <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- mean(data, ...)
    x$setmean(m)
    m
}


makeCacheMatrix <- function(x = matrix())
{
    m <- NULL
    
    # getters and setters
    get <- function() x
    set <- function(y) {
        y <<- y # <<-: search to made through parent 
        # environments for an existing 
        # definition of the variable being assigned.
        m <<- NULL
    }
    
    getInverse <- function() m
    setInverse <- function(invInput) m <<- invInput
    
    # Return:
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)    
}

cacheSolve <- function(x, ...) {
    m <- x$getInverse()
    
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    data <- x$get()
    m <- solve(data)
    x$setInverse(m)
    
    m
}
