## This code produces a matrix object and produces its inverse 

## This creates a matrix object that R can store
makeCacheMatrix <- function(x = matrix()) {
 MatrixInv <- NULL
      set <- function(y) {
            x <<- y
            MatrixInv <<- NULL
      }
      get <- function() x
      setMatrix_Inv <- function(Matrix_Inv) MatrixInv <<- Matrix_Inv
      getMatrix_Inv <- function() MatrixInv
      list(set = set, get = get,
           setMatrix_Inv = setMatrix_Inv,
           getMatrix_Inv = getMatrix_Inv)
}


## This uses the above information as inputs and computes the inverse of the matrix object that was developed above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
   MatrixInv <- x$getMatrix_Inv()
            if(!is.null(MatrixInv)) {
                  message("getting cached data")
                  return(MatrixInv)
            }
            data <- x$get()
            MatrixInv <- solve(data, ...)
            x$setMatrix_Inv(MatrixInv)
            MatrixInv
}

M<-matrix (c(3,4,5,6),2)

output<-makeCacheMatrix(M)
cacheSolve(output)
