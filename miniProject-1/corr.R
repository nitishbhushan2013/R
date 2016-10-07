# Write a function that takes a directory of data files and a threshold for complete cases and calculates the 
# correlation between sulfate and nitrate for monitor locations where the number of completely observed cases
# (on all variables) is greater than the threshold. 


## Invoking function : use it to invoke below function
cr <- corr("specdata", 5000)
head(cr)
length(cr)
summary(cr)
# Approach
# 1. Loop through the each file content of the supplied diretory
# 2. Find completeCase and get count of it
# 3. Compare count with the supplied threshold and if greater then get the resultant dataframe
# 4. create sulfate and nitrate column vector of the current file
# 5. find corelation and store in the result vector 
# 6. After all the loop, print the result vector  

#' The function should return a vector of correlations for the monitors that meet the threshold requirement. 
#' If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0.
#' @param directory - append this directory to getwd() to get the complete dir path. This is character vector
#' of length 1 indicating location of csv file.
#' @param threshold - numeric vector of length 1 indicating the number of completely observed observations required
#' to compute the correlation between nitrate and sulfate. The default is 0.
#' @return numeric vector of corelation
#' @author Nitish Bhushan

 
corr <- function(directory, threshold=0) {
  corr_count <- numeric()
  
  #get the file path  
  file_names <- getAllFileNames(directory)
  full_directory_path <- paste(getwd(),"/",directory, "/", sep = "")
  
  #Get the content of the file and perform the business reqs
  for(j in 1:length(file_names)) {
    file_path <- paste(full_directory_path, file_names[j], sep = "")
    
    # get the file content
    file_data <- read.csv(file_path,header=TRUE)
    
    completeCase <- complete.cases(file_data)
   # cat("complete cases.....",j)
    #print(completeCase)
   # cat("length of completeCase .... ", length(which(completeCase)))
  #  cat("threasold--> ", threshold)
    if(length(which(completeCase)) > threshold) {
    #  print("Inside the loop......")
      reaultantFrame <- file_data[completeCase,][1:4]
       sulfate <- c(reaultantFrame$sulfate)
       nitrate <- c(reaultantFrame$nitrate)
      # print(sulfate)
       correlation <- cor(sulfate, nitrate)
       #print(correlation)
       corr_count <- c(corr_count, correlation)
    }
  }
  corr_count
  #print(corr_count)
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

