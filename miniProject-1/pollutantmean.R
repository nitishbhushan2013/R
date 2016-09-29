# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a 
#specified list of monitors. 



#' The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
#' @param directory : character vetor of length 1 indicating location of input csv file
#' @param pollutant : character vetor of length 1 indicating name of pollutant. It could be either sulfate or nitrate
#' @param id : integer vector indicating monitor IDs
#'  @return : mean of pollutant (ignoring NA value)
#'  @author  Nitish Bhushan
pollutantmean <- function(directory, pollutant, id) {
 
  file_names <- getAllFileNames(directory)
  full_directory_path <- paste(getwd(),"/specdata/", sep = "")
  
  #Get the content of the file and perform the business reqs
  for (i in id) {
    loc <- paste(full_directory_path, file_names[i], sep = "")
    print(loc)
    file <- read.table(loc,header=TRUE, sep=";", stringsAsFactors=FALSE)
    #print(file)
    print(pollutant)
    print(file$pollutant)
    meanValue <- mean(file$pollutant)
    print(meanValue)
     
  }

}

#' This function will returns the list of all the files stored in the directory
#' @param directory - append this directory to getwd() to get the complete dir path
#' @return list of all the files contained in the directory
#' @author Nitish Bhushan
getAllFileNames <- function(directory) {
  path= paste(getwd(),"/",directory,"/", sep = "")
  print(path)
  file_names = dir(path, pattern="*.csv" )
  
}

sink("output1.log", append = FALSE)
pollutantmean("specdata", "sulfate", 1:10)
sink()
