  ## catching the mean of the vector 
  
  # The first function, makeVector creates a special "vector", which is really a list containing a function to
  # 
  # set the value of the vector
  # get the value of the vector
  # set the value of the mean
  # get the value of the mean
  makeVetor <- function(x=numeric()) {
    m <- NULL
   
    setValue <- function(y) {
      x <<- y
      m <<- NULL
    }
    getValue <- function() x
    setMean <- function(mean) m <<- mean
    getMean <- function() m
    list(setValue=setValue, getValue=getValue, setMean=setMean, getMean=getMean)
  }
  
  
  #it first checks to see if the mean has already been calculated. If so, it gets the mean from the cache and skips
  #the computation. Otherwise, it calculates the mean of the data and sets the value of the mean in the 
  #cache via the setmean function.
  
  cacheVector <- function(x,...) {
    
    mean <- x$getMean()
    if(!is.null(mean)) {
      print("getting mean from the suplied vector")
      return(mean)
    }
    
    #get the value and calculate mean 
    
    value <- x$getValue()
    mean <- mean(vaue, ...)
    x$setMean(mean)
    mean
  }
  
  vector<- c(1,2,3,4,5)
  makeVetor(vector)
  cacheVector(vector)
  