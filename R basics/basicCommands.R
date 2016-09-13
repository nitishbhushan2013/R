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






