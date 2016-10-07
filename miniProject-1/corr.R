# Write a function that takes a directory of data files and a threshold for complete cases and calculates the 
# correlation between sulfate and nitrate for monitor locations where the number of completely observed cases
# (on all variables) is greater than the threshold. 


## Invoking function : use it to invoke below function



#' The function should return a vector of correlations for the monitors that meet the threshold requirement. 
#' If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0.
#' @param directory - append this directory to getwd() to get the complete dir path. This is character vector
#' of length 1 indicating location of csv file.
#' @param threshold - numeric vector of length 1 indicating the number of completely observed observations required
#' to compute the correlation between nitrate and sulfate. The default is 0.
#' @return numeric vector of corelation
#' @author Nitish Bhushan
corr <- function(directory, threshold=0) {
  
}
