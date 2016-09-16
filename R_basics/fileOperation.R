## file operation
getwd()

# read first two lines
##con <- file("hw1_data.csv","r")
#datar <- read.csv(con,2)
#datar
#close(con)


data <- read.table("hw1_data.csv")
data[1:5,] # first 5 rows



data[complete.cases(data), ]

# count no. of row and colms

dim(data)

#The difference between NROW() and NCOL() and their lowercase variants (ncol() and nrow()) is 
#that the lowercase versions will only work for objects that have dimensions (arrays, matrices, data frames). The uppercase versions will work with vectors, which are treated as if they were a 1 column matrix, and are robust if you end up subsetting your data such that R drops an empty dimension.

#Alternatively, use complete.cases() and sum it (complete.cases() returns a logical vector [TRUE or FALSE] indicating if any observations are NA for any rows.
                                                
nrow(data)
ncol(data)
NCOL(data)
NROW(data)


data <- read.table("hw1_data.csv")
head(data,2) # first two rows
tail(data,2) # last two rows


data5 <- read.table("hw1_data.csv",nrows=1,  skip=1 )
data5


data6 <- read.table("hw1_data.csv", header=TRUE,nrows=1,  skip=46 )
data6
data[0,3]

getwd()
x1 <- read.csv("hw1_data.csv")
x1

#How many missing values are in the Ozone column of this data frame?
sum(is.na(x1[1])) 

mean(complete.cases(x1[,1]))

summary(x1)

x1[1]
