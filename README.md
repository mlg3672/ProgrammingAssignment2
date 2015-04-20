### Solution: Caching the Mean of a Matrix

The use of the `<<-` operator is used to assign a value to an object in an environment that is different from the current environment. Below are two functions that are used to create a special object that stores a matrix and caches its inverse.

The first function, `makeCacheMatrix` creates a special "vector", which is
really a list containing a function to

1.  set the value of the matrix
2.  get the value of the matrix
3.  set the value of the inverse
4.  get the value of the inverse

<!-- -->

    makeCacheMatrix <- function(x = matrix()) {
            m <- NULL
            set <- function(y) {
                    x <<- y
                    m <<- NULL
            }
            get <- function() x
            getInverse <- solve(x) 
	    setInverse <- function(inverse) m <<- inverse
            list(set = set, get = get,
                 setInverse = setInverse,
                 getInverse = getInverse)
    }

The following function calculates the inverse of the matrix if it is not stored in cache. The function first checks to see if the
inverse has already been calculated. If so, it `get`s the inverse from the
cache and skips the computation. Otherwise, it calculates the inverse of
the data and sets the value of the mean in the cache via the `setInverse`
function.

    cachemean <- function(x, ...) {
            m <- makeCacheMatrix(x)$getmean()
	    ## m<-NULL this line tests the alternative path-delete b4 run
            if(!is.null(m)) {
                message("getting cached data")
                return(m)
            }
            data <- makeCacheMatrix(x)$get()
            m <- solve(data)
            makeCacheMatrix(x)$setInverse(m)
            m
    }

### Limitations

There are some major limitations to the use of these functions. They require modifications to be used recursively:

1.  add if statement to compare the matrix values in the case where storing 
    multiple matrix inverse calculations
2.  new variable to point to new location to store multiple matrix values
   

Computing the inverse of a square matrix can be done with the `solve`
function in R. For example, if `X` is a square invertible matrix, then
`solve(X)` returns its inverse.

For the purpose of these functions, assume that the matrix supplied is always invertible.


