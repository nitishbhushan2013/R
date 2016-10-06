# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a 
#specified list of monitors. 

##Invoking funtion 
#pollutantmean("specdata", "nitrate", 23)
complete("specdata", 1)

#' The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
#' @param directory : character vetor of length 1 indicating location of input csv file
#' @param pollutant : character vetor of length 1 indicating name of pollutant. It could be either sulfate or nitrate
#' @param id : integer vector indicating monitor IDs
#'  @return : mean of pollutant (ignoring NA value)
#'  @author  Nitish Bhushan
pollutantmean <- function(directory, pollutant, id) {
 
  file_names <- getAllFileNames(directory)
  full_directory_path <- paste(getwd(),"/",directory, "/", sep = "")
  final_data <- numeric()
  
  
  #Get the content of the file and perform the business reqs
  for (i in id) {
    file_path <- paste(full_directory_path, file_names[i], sep = "")
    file_data <- read.csv(file_path,header=TRUE)
  
    # Store all the file reading into one variable
    final_data <- c(file_data[[pollutant]], final_data)
  }
  
  # Ignores all the NA and then get the mean of the final_data 
  mean <- mean(final_data, na.rm = TRUE)
  print(mean)
}






#' The function returns a data frame where the first column is the name of the file and the second column is 
#' the number of complete cases. 
#' @param directory - append this directory to getwd() to get the complete dir path
#' @return reports the number of completely observed cases in each data file.
#' @author Nitish Bhushan
complete <- function(directory, id) {
 
  id <- numeric()
  nobs <- numeric()
    #get the file  
    file_names <- getAllFileNames(directory)
    full_directory_path <- paste(getwd(),"/",directory, "/", sep = "")

     #Get the content of the file and perform the business reqs
    for (i in id) {
      print(id)
      file_path <- paste(full_directory_path, file_names[i], sep = "")
      print(file_path)
      file_data <- read.csv(file_path,header=TRUE) 
      print(file_data)
    #   id <- c(id, file_names[i])
    #   completeCase <- complete.cases(file_data)
    #   reaultantFrame <- file_dat?a[completeCase,][1:4]
    #   print(nrow(reaultantFrame))
    #   nobs <- c(nobs, nrow(reaultantFrame))
     }
    
    # print(id)
    # print(nobs)
  }
  

#' This function will returns the list of all the files stored in the directory
#' @param directory - append this directory to getwd() to get the complete dir path
#' @return list of all the files contained in the directory
#' @author Nitish Bhushan
getAllFileNames <- function(directory) {
  path= paste(getwd(),"/",directory,"/", sep = "")
  #print(path)
  file_names = dir(path, pattern="*.csv" )
}



complete("specdata", 1:2)





