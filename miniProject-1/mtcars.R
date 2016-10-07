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
sample


