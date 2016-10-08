#Finding the hospital based on supplied ranking



#'The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the 
#'hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome in that state.
#'@param state - the 2-character abbreviated name of a state. The hospital name is the name provided in the 
#'Hospital.Name variable. 
#'@param outcome - The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”.
#'@param num - the ranking of a hospital in that state for that outcome 
#'@condtion 
#'  1. The num argument can take values “best”, “worst”, or an integer indicating the ranking (smaller numbers 
#'  are better).
#'  2. If the number given by num is larger than the number of hospitals in that state, then the 
#'  function should return NA.
#'  3. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when
#'   deciding the rankings.
#'   4. It may occur that multiple hospitals have the same 30-day mortality rate for a given cause of death. 
#'   In those cases ties should be broken by using the hospital name. F
#' @return  return a character vector containing the name of the hospital with the nth lowest 30-day death rate 
#' for outcome.  
#' 

rankhospital <- function(state, outcome, num = "best"){
    #Read the csv file
    hosp <- read.csv("outcome-of-care-measures.csv")
    
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
    
    #validate state and stop the program with error message
    if (!is.element(outcome, outcome_list)) {
      stop("invalid outcome", call. = TRUE)
    } 
    
    
    ##  subset based on state to get datarame ONLY for that state
    hosp_subset_state <- subset(hosp_subset, hosp_subset$State == state)
    
    ## convert factors into numeric
    hosp_subset_state$heart_attack <- as.numeric(as.character(hosp_subset_state$heart_attack))
    hosp_subset_state$heart_failure <- as.numeric(as.character(hosp_subset_state$heart_failure))
    hosp_subset_state$pneumonia <- as.numeric(as.character(hosp_subset_state$pneumonia))
    
    
    #validate num and stop the program with error message
    if(is.numeric(num)) {
      if(num > length(hosp_subset_state$Hospital.Name)) {
        return('NA')
      }
    }
    
    
    
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
    rank_HA
    # use the rank to get all the ordered rows
    hosp_subset_state_rank <-hosp_subset_state [rank_HA, ] 
    
    if(is.numeric(num)) {
      result <- hosp_subset_state_rank[num,1]
    }else if(num == 'best'){
      result <- hosp_subset_state_rank[1,1]  
    } else if (num == 'worst'){
      result <- hosp_subset_state_rank[nrow(hosp_subset_state_rank),1] 
    }
    result
}


## Invoking function
getwd()
rankhospital("MN", "heart attack", 5000)

