## Special matrix that can access its inverse and functions based on the "solve" function
makeCacheMatrix <- function(x = matrix()){
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setInv <- function(solve) inv<<- solve
    getInv <- function() inv
    list(set = set, get = get,
         setInv = setInv,
         getInv = getInv)
}

## This function calls the inverse matrix, if it exists, otherwise it calculates it using the "solve" function
cacheSolve <- function(x, ...){
    inv <- x$getInv()
    if(!is.null(inv)){
        message('getting cached data')
        return(inv)
    }
    matrix <- x$get()
    inv <- solve(matrix,...)
    x$setInv(inv)
    inv
    matrix %*% inv ##This will show the product of the two matrices, i.e. equivalent to 1
}
