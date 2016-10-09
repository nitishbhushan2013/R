  #Read the csv file
  hosp <- read.csv("outcome-of-care-measures.csv", na.strings='Not Available', stringsAsFactors=FALSE)
  
  host_name <- character()
  state <- character()
  
  outcome <- 'heart attack'
  num <- 20
  
  #define the available outcome
  outcome_list <-c('heart attack', 'heart failure', 'pneumonia' )
  
  # subset the required column into new dataframe and rename long colname to suitable short name
  hosp_subset <- subset(hosp, select = c(2,7,11,17,23))
  
  names(hosp_subset)[3] <- "heart_attack"
  names(hosp_subset)[4] <- "heart_failure"
  names(hosp_subset)[5] <- "pneumonia"
  
  ## convert factors into numeric
  hosp_subset$heart_attack <- as.numeric(as.character(hosp_subset$heart_attack))
  hosp_subset$heart_failure <- as.numeric(as.character(hosp_subset$heart_failure))
  hosp_subset$pneumonia <- as.numeric(as.character(hosp_subset$pneumonia))
  
  
  #validate state and stop the program with error message
  if (!is.element(outcome, outcome_list)) {
    stop("invalid outcome", call. = TRUE)
  } 
  
  
  #get unique list of states
  state_list <- unique(hosp_subset[,2]) 
  
  #match(c('AK','AL'),state_list)
  
  # based on supplied outcome, sort the appropriate column
  if( outcome == 'heart attack') {
    #remove NA from 'heart attack' column , lets doit state wise
   # hosp_subset <- subset(hosp_subset, !is.na(hosp_subset$heart_attack))
  
    #sort by state, outcome and hospital name
    hosp_subset <- hosp_subset[order(hosp_subset$State, hosp_subset$heart_attack, hosp_subset$Hospital.Name),]
    #hosp_subset <- hosp_subset[order(hosp_subset$heart_attack),]
    
    #split by state
   # host_subset_by_state <- split(hosp_subset, hosp_subset$State) # this will craete dataframe seperated by state
    
   # head(hosp_subset, 30)
    # iterate for each state, check the num validity and fetch the record
     
   # subset_state1 <- subset(hosp_subset, hosp_subset$State == 'AK')
   # head(state_list('AK'),5)
  #  head(subset_state1, 5)
   
     for ( i in 1:5) {
       state_name <- as.character(state_list[i])
       #subset_state1 <- subset(hosp_subset, hosp_subset$State == state_name)
       #head(subset_state1,2)
       state_name
        
     }
    
  } 
 # final_result <- data.frame(state, host_name)
 # head(final_result,10 )
 
 
  State_list <- function(state){
    subset_state1 <- subset(hosp_subset, hosp_subset$State == state_name)
    subset_state1
  }
  


