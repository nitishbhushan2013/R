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
    state_list <- unique(outcome[,7])
    outcome_list <-c('heart attack', 'heart failure', 'pneumonia' )

    #check for state
    if (!length(grep(state, state_list))) {
      stop("invalid state")
    }
  
      #check for outcome
    # other imp functions to match content - match(), any(), is.element(): all returns boolean
    if (!match(outcome, outcome_list)) {
      print("invalid outcome")
    } 
   
    
    #get the best (i.e. lowest) 30-day mortality for the specified outcome in that state.
}