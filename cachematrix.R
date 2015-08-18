## This is programming assignment 2 of R Programming Coursera course .
## The two functions in this assignment are used to demonstrate lexical scooping by using <<- operator.
## The <<- operator assigns value to an object in an environment that is different from current environment
## 


## This function creates special "matrix" . It returns a list of functions namely set,get,setinverse  and getinverse.  

makeCacheMatrix <- function(x = matrix()) {

		m <- NULL

            set <- function(y) 
            {
               
                x <<- y
                m <<- NULL

            } 

            get <- function() x            
 
            setinverse <- function(inverse)  
            {
                 m <<- inverse
                 
            } 

             getinverse <- function() m

             list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)      

}


## This function returns the inverse of matrix x. It uses caching, if the inverse has been already calculated , it will return from  
## it or else it will calculate using special "matrix".  

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
           
           m <- x$getinverse()
           
           if (!is.null(m))
           {
                            
             message("Getting cached inverse")
             return(m)
 
           }
           
           matrixdata <- x$get()
           m <- solve(matrixdata)
           x$setinverse(m)
           m
 
}
