## Put comments here that give an overall description of what your
## functions do

##These functions written in partial fulfillment of Coursera Data Science: R Programming 
## Week 3 Assignment
## makeCacheMatrix is a function that returns a list of functions
## Its puspose is to store a martix and a cached value of the inverse of the matrix
## It Contains the following functions:
## * setMatrix      set the value of a matrix
## * getMatrix      get the value of a matrix
## * cacheInverse   get the cahced value (inverse of the matrix)
## * getInverse     get the cahced value (inverse of the matrix)

# It should be noted:
# makeCacheMatrix function-
# This function creates a special "matrix" object that can cache its inverse
# define the argument with default mode of "matrix"

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  # initialize inv as NULL; will hold value of matrix inverse   
  inv <- NULL                            
  
  # store a new matrix
  set <- function(y) {                 
    
    # value of matrix in parent environment   
    x <<- y                            
    
    # if there is a new matrix, reset inv to NULL 
    inv <<- NULL                    
    
  }
  
  # define the get fucntion - returns value of the matrix argument 
  get <- function() x                    
  
  # assigns value of inv in parent environment
  setinverse <- function(inverse) inv <<- inverse  
  
  # gets the value of inv where called 
  getinverse <- function() inv 
  
  # you need this in order to refer to the functions with the $ operator
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse) 
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  
  # if a cached value exists return it
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  # otherwise get the matrix, caclulate the inverse and store it in the cache
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  
  # return the inverse
  inv
}
