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
    #  str(hosp)
      names(hosp)
      # subset the required column into new dataframe and rename long colname to suitable short name
      hosp_subset <- subset(hosp, select = c(2,7,11,17,23))
      
      names(hosp_subset)[3] <- "heart_attack"
      names(hosp_subset)[4] <- "heart_failure"
      names(hosp_subset)[5] <- "pneumonia"
      
      print("hosp_subset*********")
     names(hosp_subset)
     nrow(hosp_subset)
      host_name <- character()
      
      #get unique list of state
      state_list <- unique(hosp_subset[,2]) 
      
      #define the available outcome
      outcome_list <-c('heart attack', 'heart failure', 'pneumonia' )
      
     
      
      #validate state and stop the program with error message
      if (!length(grep(state, state_list))) {
        stop("invalid state", call. = TRUE)
      }
      
      #validate state and stop the program with error message
      # other imp functions to match content - match(), any(), is.element(): all returns boolean
      if (!is.element(outcome, outcome_list)) {
        stop("invalid outcome", call. = TRUE)
      } 
      
      print("Initial number of rows*************")
      #str(hosp_subset)
      ##  subset based on state to get datarame ONLY for that state
      hosp_subset_state <- subset(hosp_subset, hosp_subset$State == state)
      
      print("Final  number of rows*************")
    #  str(hosp_subset_state)
      head(hosp_subset_state, 25)
      #validate num and stop the program with error message
      if(is.numeric(num)) {
        #check the #hospital in the supplied state
        if(num > length(hosp_subset_state$Hospital.Name)) {
          return('NA')
        }
      }
      
      summary(hosp_subset_state)
      
      
      # based on outcome, sort the appropriate column
      if( outcome == 'heart attack') {
        #get the rank based on outcome and hospital name
        print("11111111111")
        rank_HA <- order(hosp_subset_state[,3],hosp_subset_state[,1] )
        
      }else if ( outcome == 'heart failure') {
        print("22222222222")
        #get the rank based on outcome and hospital name
        rank_HA <- order(hosp_subset_state[,4],hosp_subset_state[,1])  
        
      } else if ( outcome == 'pneumonia') {
        print("333333333")
        #get the rank based on outcome and hospital name
        rank_HA <- order(hosp_subset_state[,5],hosp_subset_state[,1])
      }
     # print(rank_HA)
      # use the rank to get all the ordered rows
      hosp_subset_state_rank <-hosp_subset_state [rank_HA, ] 
      # Now based on num, fetch the hospital name
      head(hosp_subset_state_rank)
      
      if(is.numeric(num)) {
        result <- hosp_subset_state_rank[1,][num]
      }else if(num == 'best'){
        result <- hosp_subset_state_rank[1,][length(hosp_subset_state_rank)]
      } else if (num == 'worst'){
        result <- hosp_subset_state_rank[1,][1]
        
      }
      #result <- hosp_subset_state_rank[1,][1]
      # hospital_name
      # str(hospital_name)
      # host_name
      host_name <-c(host_name,result)
      host_name  
      #hospital_name
  
}

getwd()
rankhospital("TX", "heart failure", 4)

