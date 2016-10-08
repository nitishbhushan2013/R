#Read the csv file
hosp <- read.csv("outcome-of-care-measures.csv")

# subset the required column into new dataframe and rename long colname to suitable short name
hosp_subset <- subset(hosp, select = c(2,7,11,17,23))

names(hosp_subset)[3] <- "heart_attack"
names(hosp_subset)[4] <- "heart_failure"
names(hosp_subset)[5] <- "pneumonia"

host_name <- character()

#get unique list of state
state_list <- unique(hosp_subset[,2]) 

#define the available outcome
outcome_list <-c('heart attack', 'heart failure', 'pneumonia' )

state <- 'TX'
outcome <- 'heart attack'
num <- 20

#validate state and stop the program with error message
if (!length(grep(state, state_list))) {
  stop("invalid state", call. = TRUE)
}

#validate state and stop the program with error message
# other imp functions to match content - match(), any(), is.element(): all returns boolean
if (!is.element(outcome, outcome_list)) {
  stop("invalid outcome", call. = TRUE)
} 


##  subset based on state to get datarame ONLY for that state
hosp_subset_state <- subset(hosp_subset, hosp_subset$State == state)

## convert factors into numeric
hosp_subset_state$heart_attack <- as.numeric(as.character(hosp_subset_state$heart_attack))
hosp_subset_state$heart_failure <- as.numeric(as.character(hosp_subset_state$heart_failure))
hosp_subset_state$pneumonia <- as.numeric(as.character(hosp_subset_state$pneumonia))

hosp_subset_state_full <- head(hosp_subset_state)
#str(hosp_subset_state)
hosp_subset_state <- head(hosp_subset_state,30)


#validate num and stop the program with error message
if(is.numeric(num)) {
  #check the #hospital in the supplied state
  if(num > length(hosp_subset_state$Hospital.Name)) {
    return('NA')
  }
}


# based on outcome, sort the appropriate column
if( outcome == 'heart attack') {
  #get the rank based on outcome and hospital name
  print("11111111111")
  head(hosp_subset_state)
  #remove NA from 'heart attack' column 
  #hosp_subset_state <- hosp_subset_state[complete.cases(hosp_subset_state[,3]),]
  #hosp_subset_state <- subset(hosp_subset_state, !is.na(hosp_subset_state$'heart attack'))
  
  #head(hosp_subset_state)
  
  rank_HA <- order(hosp_subset_state[,3])
  rank_HA
  print("111********11111")
}else if ( outcome == 'heart failure') {
  print("22222222222")
  
  #remove NA from 'heart failure' column 
  #hosp_subset_state <- hosp_subset_state[complete.cases(hosp_subset_state[,4]),]
  
  #get the rank based on outcome and hospital name
  rank_HA <- order(hosp_subset_state[,4] )  
  
} else if ( outcome == 'pneumonia') {
  print("333333333")
  
  #remove NA from 'pneumonia' column 
  #hosp_subset_state <- hosp_subset_state[complete.cases(hosp_subset_state[,5]),]
  
  #get the rank based on outcome and hospital name
  rank_HA <- order(hosp_subset_state[,5],hosp_subset_state[,1])
}

rank_HA

