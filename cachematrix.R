## Put comments here that give an overall description of what your
## functions do: This are a pair of functions that cache the inverse of a 
## matrix. It allow that R didn´t have that compute the inverse many times.

## Write a short comment describing this function

## This function have a set of functions for saving the inverse of a 
## matrix. It retorn a list to the global environment.

makeCacheMatrix <- function(x = matrix()) {
        m<-NULL
        set<-function(y){
        m<<-NULL
        x<<-y
        }
        get <- function() x
        setinverse <- function(invers) m <<- invers
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function

### This funtion allow to obtain the inverse of a matrix cached in 
### makeCacheMatrix. If the inverese is not cached, cachesolve compute the 
### inverse and save this in makeCacheMatrix.

cacheSolve <- function(x, ...) {
        
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
        ## Return a matrix that is the inverse of 'x'
}
