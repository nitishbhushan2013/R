#Finding the best hospital in a state



#'The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the 
#'hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome in that state.
#'@param state - the 2-character abbreviated name of a state. The hospital name is the name provided in the 
#'Hospital.Name variable. 
#'@param outcome - The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”.
#'@condtion 
#'  1. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when 
#'  deciding the rankings.
#'  2. If there is a tie for the best hospital for a given outcome, then the hospital names should be sorted in 
#'  alphabetical order and the first hospital in that set should be chosen (i.e. if hospitals “b”, “c”, and “f” are 
#'  tied for best, then hospital “b” should be returned).
#'  3. If an invalid state value is passed to best, the function should throw an error via the stop function with the 
#'  exact message “invalid state”. If an invalid outcome value is passed to best, the function should throw an error via 
#'  the stop function with the exact message “invalid outcome”.
#' @return a character vector with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the  
#' specified outcome in that state. 
#' 
# Approach - 
  #1. Read the file and check the validity for state and outcome.Throw message if required
  #2. store the hospital name matching the condition and return it.
best <- function(state, outcome) {
    
    #Read the csv file
    hosp <- read.csv("outcome-of-care-measures.csv")
 
    # Declare local variables    
    host_name <- character()
    
    #define the available outcome
    outcome_list <-c('heart attack', 'heart failure', 'pneumonia' )
    
    # subset the required column into new dataframe and rename long colname to suitable short name
    hosp_subset <- subset(hosp, select = c(2,7,11,17,23))
    
    names(hosp_subset)[3] <- "heart_attack"
    names(hosp_subset)[4] <- "heart_failure"
    names(hosp_subset)[5] <- "pneumonia"
    
    #get unique list of state
    state_list <- unique(hosp_subset[,2]) 
    
    
    #validate state and stop the program with error message
    if (!length(grep(state, state_list))) {
      stop("invalid state", call. = TRUE)
    }
    
    #validate outcome and stop the program with error message
    if (!is.element(outcome, outcome_list)) {
      stop("invalid outcome", call. = TRUE)
    } 
    
    
    ##  subset datarame based on state 
    hosp_subset_state <- subset(hosp_subset, hosp_subset$State == state)
    
    ## convert factors into numeric
    hosp_subset_state$heart_attack <- as.numeric(as.character(hosp_subset_state$heart_attack))
    hosp_subset_state$heart_failure <- as.numeric(as.character(hosp_subset_state$heart_failure))
    hosp_subset_state$pneumonia <- as.numeric(as.character(hosp_subset_state$pneumonia))
    
    
    # based on supplied outcome, sort the appropriate column
    if( outcome == 'heart attack') {
      #remove NA from 'heart attack' column 
      hosp_subset_state <- subset(hosp_subset_state, !is.na(hosp_subset_state$'heart_attack'))
      
      #get the rank based on outcome and hospital name
      rank_HA <- order(hosp_subset_state[,3], hosp_subset_state[,1])
      
    }else if ( outcome == 'heart failure') {
      #remove NA from 'heart failure' column 
      hosp_subset_state <- subset(hosp_subset_state, !is.na(hosp_subset_state$'heart_failure'))
      
      #get the rank based on outcome and hospital name
      rank_HA <- order(hosp_subset_state[,4], hosp_subset_state[,1] )  
      
    } else if ( outcome == 'pneumonia') {
      
      #remove NA from 'pneumonia' column 
      hosp_subset_state <- subset(hosp_subset_state, !is.na(hosp_subset_state$'pneumonia'))
      
      #get the rank based on outcome and hospital name
      rank_HA <- order(hosp_subset_state[,5],hosp_subset_state[,1])
    }
  
   # use the rank to get all the ordered rows
    hosp_subset_state_rank <-hosp_subset_state [rank_HA, ] 
    # Now fetch the hospital name
    result <- hosp_subset_state_rank[1,][1]
  
    host_name <-c(host_name,result)
    host_name  
}



## Invoking function
best("TX", "heart attack")

