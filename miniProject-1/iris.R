library(datasets)
data(iris)
s <- split(iris, iris$Species)
#colMeans(s)
lapply(s, function(x) colMeans(x[,c("Sepal.Length","Sepal.Width")]))


#lapply(s, funtion(x) colMeans( x[ , c("Sepal.Length","Sepal.Width",)]))
#lapply(s, mean)

#tapply(iris$cyl, mtcars$mpg, mean)

