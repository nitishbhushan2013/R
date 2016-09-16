#x<- c(1:20)
#x
#print(x)

# R data Type
#numeric, integer, character, logical, complex
# R object
# vector, list

x <- 0:5
class(x)

as.numeric(x)
class (as.numeric(x))

as.logical(x)
class(as.logical(x))


m <- matrix(1:12, nrow=2, ncol=4)
m

m1 <- matrix(1:12, byrow = TRUE, nrow=4, ncol=4)
m1
dim(m1)


m2 <- 1:8
m2
dim(m2) <- c(2,4)
m2


x <- 1:5
y<- 2:16
cbind(x,y)
rbind(x,y)
  

fac <- factor(c("a", "b", 1,2, "a", "a", "a", 1))
fac
table(fac) # frequency table
unclass(fac)

# Missing value
# Nan, and NA
## NaN is the subset of NA and hence NA is the superset 
x <- c(1,2,TRUE, NaN, NA)
is.na(x)
is.nan(x)


#Data Frames
# col length must be same
data_frame <- data.frame(col1=1:4, col2= c("one", "two", "three", "four"), col3=c("A", "B", "C", "D"))
data_frame


n1 <- c(1:5)
n1
names(n1)
names(n1) <- c("a", "b","c","d","e")
n1

l1 <- list("name", TRUE, c(1:3))
names(l1)
l1 <- list(name ="name", bool= TRUE, vec= c(1:3))
l1


mat <- matrix(1:6, nrow=3, ncol=2)
mat

mat1 <- matrix(1:6, nrow=3, ncol=2)
dimnames(mat1) <- list(c("row1","row2","row3"),c("col1","col2"))
mat1


#dput and dump => create R code to write metadata about the data and output 
x <- data.frame(1:6)
x
dput(x)
x


# dump: store multiple files at once

x <- 1:10
y <- matrix(1:4, nrow=2, ncol=2)
dump(c("x","y"), file="data.R") ## store R objects in the file 
rm(x,y) ## we can remove the object and then again source it from dump
source("data.R")
#x


# file operation
#conn <- file("sample.txt", "r")
#data <- read.csv(conn)
#data
#close(conn)

#data <- read.csv("sample.txt")

## connecting to external resource
#conn_url <- url("https://www.google.com.au", "r")
#data <- readLines(conn_url)
#head(data)
#close(conn_url)



##subseting
x <- c("a","v","f","a","x","a")
greater_than_a <- x > "a"
greater_than_a
x[greater_than_a]

y <- c(1,2,3,6,9,7,3,2,5)

z <- y >6
y[z]
y[1]
y[[1]]
z1 <- y == 2
z1
y[z1]




# Subsetting List

x <- list(a=c(1:3), b="zoo", c=c(3,6,9) )
x[1] # first list
x[[1]] #value of first element which is list
x[[c(1,3)]] #third element of first element of list x[[1]][[3]]
x[[1]][[3]]

x$b

y <- "b"
x[y]
x$y ## we can not use 


# subsetting matrices

m <- matrix(1:6, 2,3)
m

m[1,2] # return vector and not the matrix
m[2,]

m[1,2, drop=FALSE] # return the matrix

m[2,]
m[2, ,  drop=FALSE]


## Partial matching
 x<- list(whatisYourName = 1:5)
 x$w
 x[["w"]]
x[["w", exact=FALSE]]


x<- list(whatisYourName = 1:5, whatisMyName = 6:10)
x$w
x[["w"]]
x[["w", exact=FALSE]]


## Removing NA value
x <- c(1,2,NA, 3,4,NaN, 5,6)
y <- is.na(x) # na also includes NaN
y
x[!y]

x1 <- c(1,2,NA, 3,4,NaN, 5,6)
y1 <- is.nan(x1) # nan does not excluse na
y1
x1[!y1]


## multiple subset

x <- c(1,2,NA, 4,5,NA,6)
y <-c(11,NA,NA,33,44,NA,66)

z <- complete.cases(x,y)
z
x[z]
y[z]


## Vectorized Operation
x <- matrix(1:4, 2,2)
x
y <- matrix(rep(10,6),2,2)
y

z <- x*y
z


x <- list(1,"a","v", FALSE)
x[[2]]


x<- 1:4
y <- 2:3
x+y
class(x+y)

x<- c(1,3,45,54,4,3,2)
x[x>5] <- 4

y<- c(1,3,45,54,4,3,2)
y[y==4] >10

data <- read.csv("hw1_data.csv")
data




 


 












