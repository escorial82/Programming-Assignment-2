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
