## Cache the inverse of a matrix

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


## Cache a solved matrix

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
