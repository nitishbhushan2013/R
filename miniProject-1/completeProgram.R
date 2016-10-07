
## Invoking function : use it to invoke below function
complete("specdata", c(2, 4, 8, 10, 12))


#' The function returns a data frame where the first column is the name of the file and the second column is 
#' the number of complete cases. 
#' @param directory - append this directory to getwd() to get the complete dir path
#' @return reports the number of completely observed cases in each data file.
#' @author Nitish Bhushan

complete <- function(directory, id) {
  file_id <- numeric()
  count <- numeric()
  
  #get the file path  
  file_names <- getAllFileNames(directory)
  full_directory_path <- paste(getwd(),"/",directory, "/", sep = "")
  
  #Get the content of the file and perform the business reqs
  for(j in id) {
    file_id <- c(file_id, j)
    file_path <- paste(full_directory_path, file_names[j], sep = "")
    
    # get the file content
    file_data <- read.csv(file_path,header=TRUE)
    
    completeCase <- complete.cases(file_data)
    
    # get the matching data frame 
    reaultantFrame <- file_data[completeCase,][1:4]
    
    count <- c(count, nrow(reaultantFrame))
  }
  
  df <- data.frame(id=file_id, nobs=count)
  print(df)
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
   


