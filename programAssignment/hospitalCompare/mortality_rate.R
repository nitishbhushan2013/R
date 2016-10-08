#  Plot the 30-day mortality rates for heart attack

outcome <- read.csv("outcome-of-care-measures.csv")
#str(outcome)
#names(outcome)
#colnames(outcome)

outcol <- as.numeric(outcome[, 11])

df <- data.frame(x= outcome[,7], y= outcome[,11])
#head(df, 20)
#head(outcome)

closeAllConnections()
outcome_list <-c('heart attack', 'heart failure', 'pneumonia' )
if (length(grep("pneumonia", outcome_list))) {
  print("present .....")
} else {
  print("Not Present .....")
}

# Get unique element from the list
state_list <- unique(outcome[,7])
state_list

s1 <- split(outcome, outcome[,7])
head(s1,1)


subset1 <- head(outcome)

tapply(subset1[,11], subset1$State, sum, na.rm=FALSE)


#str(outcome)
#as.numeric(as.character(outcome[,11]))

outcome[,2]<- as.numeric(as.character( outcome[,2] ))
outcome[,7]<- as.numeric(as.character( outcome[,7] ))
outcome[,11]<- as.numeric(as.character( outcome[,11] ))

df1<- data.frame(hos_name=outcome[,2], state=outcome[,7], heart_attack_rate=outcome[,11])
#head(df1)
#s1 <- split(df1$heart_attack_rate,df1$state )
#s1
str(df1)
s2 <- subset(df1, state=='AL')
#s2
subset(df1)

#subset(s2, min())
#s3<-lapply(s2, function(x) type.convert(as.character(x)))
#s3

#subset(s2, min(as.numeric(as.character(s2[,3]))))

#subset(df1$heart_attack_rate, df1$state == 'AL' & min(df1$heart_attack_rate, na.rm = TRUE))



hosp <- read.csv("outcome-of-care-measures.csv")
#str(hosp)

# subset the required column into new dataframe 
hosp_subset <- subset(hosp, select = c(2,7,11,17,23))
names(hosp_subset)[3] <- "heart_attack"
names(hosp_subset)[4] <- "heart_failure"
names(hosp_subset)[5] <- "pneumonia"

names(hosp_subset)
#head(hosp_subset)
#str(hosp_subset)
host_name <- character()

state <- "BB"
outcome <- "heart attack"

state_list <- unique(hosp_subset[,2])
outcome_list <-c('heart attack', 'heart failure', 'pneumonia' )


##  subset based on state 
hosp_subset_state <- subset(hosp_subset, hosp_subset$State == state)

  
  #check for state
  if (!length(grep(state, state_list))) {
    stop("invalid state", call. = TRUE)
  }
  
  #check for outcome
  # other imp functions to match content - match(), any(), is.element(): all returns boolean
  if (!match(outcome, outcome_list)) {
    print("invalid outcome")
  } 
  
  
  if( outcome == 'heart attack') {
    #get the rank
    rank_HA <- order(hosp_subset_state[[3]])
    
  }else if ( outcome == 'heart failure') {
    #get the rank
    rank_HA <- order(hosp_subset_state[[4]])  
    
  } else if ( outcome == 'pneumonia') {
    #get the rank
    rank_HA <- order(hosp_subset_state[[5]])
  }
  cat("ranks is...",rank_HA )
  # get all the ordered rows
  hosp_subset_state_rank <-hosp_subset_state [rank_HA, ] 
  #head(hosp_subset_state_rank,1)
 # names(hosp_subset_state_rank)
  #pick the first row which will be the lowest rate
  #hospital_name <- hosp_subset_state_rank[[1]][1]
  head(hosp_subset_state_rank,1)
  
  #hospital_name <- hosp_subset_state_rank$Hospital.Name[2]
  hospital_name <-hosp_subset_state_rank[1,][1]
  hospital_name
  #cat("hospital anme is .....",hospital_name)
  #host_name <-c(host_name,hospital_name)

  #host_name
