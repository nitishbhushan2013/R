# Basic Data Frame related operations

# https://therostrumblog.wordpress.com/2014/01/29/basic-data-frame-manipulations-in-r/

df <- data.frame(c(1,2,3,4,5), c(5,10,15,20,25), c(2,4,6,8,10), c(3,6,9,12,15))
names(df) <- c("one", "five", "two", "three")
df

# All Rows and All Columns
df[,]

# First row and all columns
df[1, ]

# First Row and 2nd and third column
df[1,c(2,3)]

# Just First Column with All rows
df[,1]

# First, Second Row and Third and fourth Column
df[1:2, 3:4]

#To get an output as a data frame
# First Column as data frame
as.data.frame(df[,1],drop=FALSE)
df[,1]


df
# transforming rows into column
df <- t(df)
df

summary(df)

df
df[2,3]
