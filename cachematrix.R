## Function makeCacheMatrix serves to cache the inverse of a square invertible matrix
## Function cacheSolve returns the inverse of a matrix, first checking if it's already cached

## Function makeCacheMatrix creates a list of four functions: 
## set - setting the values for the matrix
## get - getting the values for the matrix
## setinv - setting the values of inverse matrix
## getinv - getting the values of inverse matrix


makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinv <- function(inv) m <<- inv
    getinv <- function() m
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)    
}

## Function cacheSolve can be used to return the inverse of a matrix
## stores by the makeCacheMatrix function. It returns the previously 
## cached inverse matrix or calculates it if it isn't already cached

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinv(m)
    m
}
