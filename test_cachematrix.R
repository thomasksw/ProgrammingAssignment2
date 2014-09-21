## Test script and outputs for cachematrix functions
## > source("test_cachematrix.R")
## > test_cmatrix1()
## [1] "Solving and caching the inverse ..."
## num [1:26, 1:26] 3.1699 -0.0657 -0.1409 0.2076 0.2088 ...
## [1] "Retrieve inverse from cache without calculating..."
## num [1:26, 1:26] 3.1699 -0.0657 -0.1409 0.2076 0.2088 ...
## > test_cmatrix2()
## num [1:78, 1:78] 0.27805 0.01514 0.05987 -0.01649 0.00592 ...
## [1] "Solving and caching the inverse ..."
## num [1:78, 1:78] 15.99 0.907 -0.248 2.175 -3.902 ...
## [1] "Retrieve inverse from cache without calculating..."
## num [1:78, 1:78] 15.99 0.907 -0.248 2.175 -3.902 ...

test_cmatrix1 <- function() {
  source("cachematrix.R")
  ## Preparing the data matrix to be used as input
  data_matrix1 <-matrix(runif(6786,-1,1), nrow=261)
  sigma_1 <- cov(data_matrix1)
  a1 <- makeCacheMatrix(x = matrix())
  a1$set(sigma_1)
  ret1 <- cacheSolve(a1)
  str(ret1)
  ## Test with the same dataset and special matrix
  ## to confirm if it get the inverse from cache 
  ret3 <- cacheSolve(a1)
  str(ret3)
}

## Test with a different dataset
test_cmatrix2 <- function() {
  source("cachematrix.R")
  ## Preparing the data matrix to be used as input
  data_matrix2 <-matrix(runif(6786,-1,1), nrow=87)
  sigma_2 <- cov(data_matrix2)
  a2 <- makeCacheMatrix(x = matrix())
  a2$set(sigma_2)
  str(a2$get())
  ret2 <- cacheSolve(a2)
  str(ret2)
  ## Test with the same dataset and special matrix
  ## to confirm if it get the inverse from cache 
  ret3 <- cacheSolve(a2)
  str(ret3)
}
