# Inverse matrix

#'This function creates a special "matrix" object that can cache its inverse.
#'@param x - matrix object 
#' @return list containing get and set for the original matrix and its inverse
#' 

makeCacheMatrix <- funtion(x=matrix()) {
  inverseMatrix <- NULL
  
  getMatrix <- function() x
  setMatrix <- function(mat) {
    x <<- mat
    inverseMatrix <<- NULL
  }
  setInverse <- funtion(inv) inverseMatrix <<- inv
  getInverse <- function() inverseMatrix

  list(getMatrix=getMatrix, setMatrix=setMatrix, getInverse=getInverse, setInverse=setInverse)  
}


#'This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has 
#'already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.
#'@param x - matrix object whose inverse to find
#'@return inverse matrix 
#' 
cacheSolve <-function(x,...) {
  
  inverse_matrix <- x$getInverse()
  
  if(!is.null(inverse_matrix)) {
    print("getting cached Data")
    return(inverse_matrix)  
  }

  matrix <- x$getMatrix()
  inverse_matrix <- solve(matrix,...)
  x$setInverse <- inverse_matrix
  
  inverse_matrix
}