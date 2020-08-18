## Put comments here that give an overall description of what your
## functions do

## Below are two functions that are used to create a special object
## that stores a matrix and cache's its inverse


## Write a short comment describing this function

## makeCacheMatrix creates a special "vector", which contains a function 
## to 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() inverse
  list(set = set, get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
}


## Write a short comment describing this function

## The function returns the inverse of the above matrix,
## if the inverse has already been calculated, it gets the inverse from
## the cache and skips the computation. Otherwise, it calculates the 
## inverse of the data and sets the value of the inverse in the cache
## viathe setinverse function
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
