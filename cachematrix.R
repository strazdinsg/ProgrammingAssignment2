# Two functions providing more efficient calculation of inverse for a matrix
# The real inverse calculation happens only on the first call, then the calculated
# value is cached and reused on every subsequent call


## Creates a matrix supporting cache of the inverse 
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL # Inverse will be stored here
  
  # The set() function initializes the value of the matrix and clears
  # cached inverse, if there was any
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  
  # The get() function returns the matrix value
  get <- function() x
  
  # get() and set() functions for the inverse cache
  setinverse <- function(inv) i <<- inv
  getinverse <- function() i
  
  # Returns a list with the specified functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


# Finds the inverse for a matrix supporting value caching
# The matrix must be created using makeCacheMatrix
# Warning: the matrix must be correct so that solve(x) works 
# (non-singular, square matrix)
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(m)
  m
}
