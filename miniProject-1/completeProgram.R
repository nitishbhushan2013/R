##Complete  

#' The function returns a data frame where the first column is the name of the file and the second column is 
#' the number of complete cases. 
#' @param directory - append this directory to getwd() to get the complete dir path
#' @return reports the number of completely observed cases in each data file.
#' @author Nitish Bhushan

complete <- function(directory, id) {
  print("Starting: arguments are -->")
  print(directory)
  print(id)
  Colid <- numeric()
  nobs <- numeric()
  
  #get the file  
  file_names <- getAllFileNames(directory)
  full_directory_path <- paste(getwd(),"/",directory, "/", sep = "")
  
  print(full_directory_path)
   
  
  #Get the content of the file and perform the business reqs
  for(j in id) {
    print("value of j is -->")
    print(j)
    
    print(file_names[j])
   print ("Inside for loop")
    file_path <- paste(full_directory_path, file_names[j], sep = "")
    print("file path is -->")
    print(file_path)
    
    file_data <- read.csv(file_path,header=TRUE)
    print(file_data)
    
  }
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
 

complete("specdata", 11)
