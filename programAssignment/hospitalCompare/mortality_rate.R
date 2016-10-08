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

<<<<<<< HEAD
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
=======



>>>>>>> ce32a1fbede1c2afe28cc789a1ae801cf68b909f
