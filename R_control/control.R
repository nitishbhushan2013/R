## control and looping
x <- c("a","v","c","f")

z <- nchar(x)
z
sum(z) 

y <- "testing"
nchar(y)

nchar("test")



x1 <- c("but", "cut","hut", "shut")

lengths(x1)  #[1] 1 1 1 1
length(x1)   # 4

for (i in 1:length(x1))
  print(x1[i])

# seq_along takes the vector and create an integer seq of total length equals to vector
for(j in seq_along(x1))
  print(x1[j])  


for(k in x1)
  print(k)


list1 <- list(TRUE, 1:4, "see")
for(ele in list1)
  print(ele)


matrix1 <- matrix(1:6, 2,3)

matrix1

for (i in seq_len(nrow(matrix1))) {
    for(j in seq_len(ncol(matrix1)) ){
        print(matrix1[i,j])
    }
}

nrow(matrix1)
ncol(matrix1)
length(nrow(matrix1))
length(ncol(matrix1)  )

for (i1 in nrow(matrix1)) {
  for(j1 in ncol(matrix1) ){
    print(matrix1[i1,j1])
  }
}


x2 <- c("abc","def", "efg")

length(x2)
for(i in length(x2))
    print(x2)




x3 <- c(1,4,54,66,33,22,42,45,3)
y2 <- x3 >30
y2
x3[y2]