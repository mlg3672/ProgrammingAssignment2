## the functions below makeCacheMatrix and cacheSolve
# executes 4 actions
## (1) get the value of matrix x
## (2) set the value of the matrix
## (3) get the value of the inverse matrix
## (4) set the value of the inverse matrix


makeCacheMatrix <- function(x = matrix()) {
	## this function returns a list
	m<- NULL
	set <-function(y) {
		x<<-y
		m<<-NULL
	}
	get <- function() x
	getInverse <- solve(x)
	setInverse <- function(inverse) m<<-inverse
	list(set = set, get = get, 
		setInverse = setInverse,getInverse = getInverse)
}


## the cacheSolve function calculates matrix inverse
# created with makeCacheMatrix, first checks to see if
# matrix has already been created

cacheSolve <- function(x,...) {
	m<-makeCacheMatrix(x)$getInverse
	m<-NULL
	if(!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	data<-makeCacheMatrix(x)$get()
	m <-solve(data)
	makeCacheMatrix(x)$setInverse(m)
	m
	
        
}
