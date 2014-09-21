## Assignment 2 - Coursera course rprog-007
## Student name: Thomas Wong
##
## I used the following steps to verify my created functions
## 
## Test scripts for testing makeCacheMatrix and cacheSolve functions
##
## test_cmatrix1 <- function() {
##    source("cachematrix.R")
#### Preparing the matrix to be used as input data matrix
##    data_matrix1 <-matrix(runif(6786,-1,1), nrow=261)
##    sigma_1 <- cov(data_matrix1)
##    a1 <- makeCacheMatrix(x = matrix())
##    a1$set(sigma_1)
##    ret1 <- cacheSolve(a1)
##    str(ret1)
## }

##  test_cmatrix2 <- function() {
##  source("cachematrix.R")
#### Preparing the matrix to be used as input data matrix
##  data_matrix2 <-matrix(runif(6786,-1,1), nrow=87)
##  sigma_2 <- cov(data_matrix2)
##  a2 <- makeCacheMatrix(x = matrix())
##  a2$set(sigma_2)
##  ret2 <- cacheSolve(a2)
##  str(ret2)
##  }

## Function makeCacheMatrix creates a special "matrix" object that can cache its 
## inverse. 

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
       setinv = setinv, getinv = getinv)
}
  

##  cacheSolve function computes the inverse of the special "matrix" returned 
##  by makeCacheMatrix above. If the inverse has already been calculated (and 
##  the matrix has not changed), then cacheSolve should retrieve the inverse from 
##  the cache.

##  Computing the inverse of a square matrix can be done with the  solve  function 
##  in R. For example, if  X  is a square invertible matrix, then  solve(X)  returns 
##  its inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ## x is the special object returned by makeCacheMatrix for cacheSolve as its argument
        ## Use y$set(m) where m is the matrix for which the inverse is to be calculated
        ## Function cacheSolve returns the inverse of m 
        ## Test whether the matrix m & its inverse matrix already calculated & stored in cache
  ## if (is.null(x$get())) {
  ##    print("Please apply return of makeCacheMatrix(x = matrix() as first arg. of cacheSolve")
  ##    return(NULL)
  ## }
  if(is.null(x$getinv())) {
      print("Solving and caching the inverse ...")
      return(x$setinv(solve(x$get())))
  }
  else {
    print("Retrieve inverse from cache without calculating...")
    return(x$getinv())       
  }
}