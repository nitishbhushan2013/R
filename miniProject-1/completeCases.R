id <- numeric()
nobs <- numeric()


  
  file_data <- read.csv("011.csv",header=TRUE)
  print(file_data)
     id <- c(id, "011.csv")
     completeCase <- complete.cases(file_data)
     reaultantFrame <- file_data[completeCase,][1:4]
     print(nrow(reaultantFrame))
     nobs <- c(nobs, nrow(reaultantFrame))

 print(id)
 print(nobs)