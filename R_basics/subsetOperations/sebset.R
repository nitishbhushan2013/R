library(datasets)
data(mtcars)

str(mtcars)

cars <- mtcars
head(cars)

## Now play with cars.. yooooHooooo:-)

## Different ways to do subsetting

###Style 1
#s3 <-subset(cars, cyl == 4 & gear == 4)
#s3 <-subset(cars, cyl == 4 & gear == 4, select = -gear)
s3<- subset(cars, cyl == 4 & gear == 4, select = c(mpg,cyl,hp,carb))

##style2
#s2 <- cars[(cars$cyl==4 & cars$gear==4),]


###style3
carb_only <- cars$cyl ==4
cars[carb_only,]

carb_only <- cars$cyl ==4 & cars$gear==4
cars[carb_only,]


##stye 4
cars[which(cars$cyl ==4 & cars$gear==4),]



which(cars$cyl ==4) ## returns vector  [1]  3  8  9 18 19 20 21 26 27 28 32
cars$cyl ==4  # returns boolean 


####divide the setinto two subdata based on probability of 0.8 and 0.2 considering all the rows as sample

ind <- sample(2, nrow(cars), replace=TRUE, prob = c(0.8,0.2))
ind
cars_1 <- cars[ind ==1,]
cars_2 <- cars[ind ==2,]
print("first set of cars which prob of occuring 80%")
#cars_1
str(cars_1)
print("second set of cars which prob of occuring 20%")
#cars_2
str(cars_2)




###Sorting - For data frame,its donw thrugh order() which gives back the rank and then we use ranks as rows
# to get back the ordered data frame
head(cars_1)
#ranks <- order(cars_1$mpg)
cars_1[,1]
ranks <- order(cars_1[,1],cars_1[,2])

cat("ranks is ......", ranks )
cars_1_mpg <- cars_1[ranks, ] # give us all the rows
cars_1_mpg
#cars_1_mpg[1,]
    # mpg cyl disp  hp drat   wt  qsec vs am gear carb
    # Cadillac Fleetwood 10.4   8  472 205 2.93 5.25 17.98  0  0    3    4
#cars_1_mpg$mpg[1]
  # [1] 10.4
#cars_1_mpg[[1]][1]
###Sorting in descending order
#ranks <- order(cars_1$mpg, decreasing=TRUE)




#### Find the types of the data in the dataframe 
#str(cars_1)
sapply(cars_1, class)



### Convert factor column to numeric in the dataframe 
##Style 1
cars_1$cyl <- as.numeric(as.character(cars_1$cyl))
sapply(cars_1, class)

##Style 2
index <- sapply(cars_1, is.factor)
cars_1[index] <- lapply(cars_1[index], function(x) as.numeric(as.character(x)))


##style3
#Another option is to use stringsAsFactors=FALSE while reading the file using read.table or read.csv

##Style4
cars_1 <- transform(cars_1, class=as.numeric(as.character(cars_1)))


##Style 5
cars_1 <- transform(cars_1, mpg <- as.numeric(mpg),
                              disp <- as.character(disp,
                              cyl <- as.factor(cyl)                     ))

##Style 6  : http://stackoverflow.com/questions/2288485/how-to-convert-a-data-frame-column-to-numeric-type
# columns 3, 6-15 and 37 of you dataframe need to be converted to numeric
cars_1[,c(3,6:15,37)] <- sapply(cars_1[,c(3,6:15,37)], as.numeric)





###### Use completecase to remove NA from data frame
# The R function to check for this is complete.cases(). he results of complete.cases() is a logical vector with the value TRUE for rows that are complete, and FALSE for rows that have some NA values. To remove the rows with missing data from 
#airquality

#Style 1: 
x <- airquality[complete.cases(airquality), ]

#Style 2
x <- na.omit(airquality) #will only select rows with complete data in all columns

# The complete.cases command works as follows:
#   data[complete.cases(data),] - will only select rows with complete data in all columns
# data[complete.cases(data[,c(2,3,5)]),] - will only select rows with complete data in columns 2, 3, and 5
# var[complete.cases(var)] - will only select values of a variable not equal to NA


df <- data.frame(x = c(1, 2, 3), y = c(0, 10, NA), z=c(NA, 33, 22))
df 
subset(df, !is.na(df$y))



completeFun <- function(data, desiredCols) {
  completeVec <- complete.cases(data[, desiredCols])
  return(data[completeVec, ])
}

completeFun(DF, "y")


