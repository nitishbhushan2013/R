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









