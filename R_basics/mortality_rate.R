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

state_list <- unique(outcome[,7])
state_list





