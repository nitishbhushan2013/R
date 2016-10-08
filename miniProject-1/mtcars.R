library(datasets)
data(mtcars)

head(mtcars)

s <- split(mtcars,mtcars$cyl)
sapply(mtcars, cyl, mean)

sapply(split(mtcars$mpg, mtcars$cyl), mean)

split(mtcars$mpg, mtcars$cyl)


lapply(split(mtcars$mpg, mtcars$cyl), mean)

tapply(mtcars$mpg, mtcars$cyl, mean)


with(mtcars, tapply(hp, cyl, mean))


set.seed(10)
sampleplay()

summary(mtcars)
names(mtcars)
mtcars$mpg
table(mtcars$mpg)
mtcars1<- head(mtcars,10)
mtcars1
mtcars$mpg
table(mtcars1$mpg)
dim(mtcars1)
summary(mtcars1)
table(mtcars1$mpg, mtcars1$cyl)
mtcars1
table(mtcars1$mpg, mtcars1$cyl, mtcars1$disp, mtcars1$hp)

