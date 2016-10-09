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
  
    #sort by outcome and hospital name
    hosp_subset <- hosp_subset[order(hosp_subset$heart_attack, hosp_subset$Hospital.Name),]
    #hosp_subset <- hosp_subset[order(hosp_subset$heart_attack),]
    
    #split by state
    host_subset_by_state <- split(hosp_subset, hosp_subset$State) # this will craete dataframe seperated by state
    
    # iterate for each state, check the num validity and fetch the record
     for(i in 1:length(state_list)) {
    
   # for(i in 1:2) {
      df_state_local <- host_subset_by_state[[i]]
      
      #remove NA from 'heart attack' column 
      df_state_local <- subset(df_state_local, !is.na(df_state_local$heart_attack))
      state_name <- as.character(state_list[i])
      
      hospital_name <- character()
      flag <- FALSE;
      #check num validity
      if(is.numeric(num)) {
        if(num > nrow(df_state_local)) {
          flag <- TRUE
          hospital_name <- "NA"
        }
      }
      
      # get the desired row
      if(is.numeric(num) & !flag) {
        hospital_name <- as.character(df_state_local[num,]$Hospital.Name)
      }else if(num == 'best' & !flag){
        hospital_name <- as.character(df_state_local[1,]$Hospital.Name)  
      } else if (num == 'worst' & !flag){
        hospital_name <- as.character(df_state_local[nrow(df_state_local),]$Hospital.Name )
      }
      
      #populate the vecors
      host_name <- c(host_name, hospital_name)
      state <-  c(state, state_name ) 
    }
    
   
  } 
  final_result <- data.frame(state, host_name)
  head(final_result,10 )
 
  
  
  
  


