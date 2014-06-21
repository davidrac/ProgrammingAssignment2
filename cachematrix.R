## This file contains functions that can be used to create
## a cached solved matrix computation

## Create an object that can cash inversed matrix computation

makeCacheMatrix <- function(x = matrix()) {
  x <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## Solve the matrix within the cache matrix parameter and cache
## the result. In case there is already a cached result return it.

cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if (!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  message("solving")
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
