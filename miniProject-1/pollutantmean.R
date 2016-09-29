# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a 
#specified list of monitors. 



#The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
#directory : character vetor of length 1 indicating location of input csv file
#pollutant : character vetor of length 1 indicating name of pollutant. It could be either sulfate or nitrate
#id : integer vector indicating monitor IDs
# return : mean of pollutant (ignoring NA value)
pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  
}


for (i in 1:101) {
  if(i <10){ 
    x <- sub("^", "00", i)
  } else if (i<20) {
    x <- sub("^", "0", i)
  }
  else {
    x <- i
  }
    print(x)
}

x <- sub("^", "00", 1)
y <- paste("/Users/nitishbhushan/Documents/technical/tehnologies/data Science/R/depot/miniProject-1/specdata/",x)
file <- read.table("/Users/nitishbhushan/Documents/technical/tehnologies/data Science/R/depot/miniProject-1/specdata/x.csv")

