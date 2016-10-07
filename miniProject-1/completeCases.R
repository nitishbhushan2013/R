id <- numeric()
nobs <- numeric()


  
  file_data <- read.csv("011.csv",header=TRUE)
     id <- c(id, "011.csv")
     completeCase <- complete.cases(file_data)
     reaultantFrame <- file_data[completeCase,][1:4]
     length(which(completeCase))
     which(completeCase)
    # print(nrow(reaultantFrame)) 
    # nobs <- c(nobs, nrow(reaultantFrame))

# print(id)
# print(nobs)
     
     cr <- numeric()
     # get the file content
     file_data <- read.csv("011.csv",header=TRUE)
     
     completeCase <- complete.cases(file_data)
     len <- length(which(completeCase))
     print(len)
     
     if(length(which(completeCase)) > 12) {
       # get the matching data frame 
       reaultantFrame <- file_data[completeCase,][1:4]
       sulfate <- c(reaultantFrame$sulfate)
       nitrate <- c(reaultantFrame$nitrate)
       
       print(sulfate)
       correlation <- cor(sulfate, nitrate)
       print(correlation)
       cr <- c(cr, correlation)
     }     
    print(cr)
 
 