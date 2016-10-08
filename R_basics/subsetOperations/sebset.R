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
ranks <- order(cars_1$mpg)
cars_1_mpg <- cars_1[ranks, ] # give us all the rows
cars_1_mpg[1,]
    # mpg cyl disp  hp drat   wt  qsec vs am gear carb
    # Cadillac Fleetwood 10.4   8  472 205 2.93 5.25 17.98  0  0    3    4
cars_1_mpg$mpg[1]
  # [1] 10.4


###Sorting in descending order
ranks <- order(cars_1$mpg, decreasing=TRUE)




