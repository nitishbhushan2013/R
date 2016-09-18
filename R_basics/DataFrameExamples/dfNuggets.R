# Data Frame Examples
# https://www.datacamp.com/community/tutorials/15-easy-solutions-data-frame-problems-r#gs.ayUoYeU


Died.At <- c(22,40,72,41)
Writer.At <- c(16, 18, 36, 36)
First.Name <- I(c("John", "Edgar", "Walt", "Jane"))
Second.Name <- I(c("Doe", "Poe", "Whitman", "Austen"))
Sex <- c("MALE", "MALE", "MALE", "FEMALE")
Date.Of.Death <- as.Date(c("2015-05-10", "1849-10-07", "1892-03-26","1817-07-18"))

writers_df <- data.frame(Died.At,Writer.At,First.Name, Second.Name, Sex , Date.Of.Death  )



str(writers_df)
head(writers_df,1)
tail(writers_df,1)

writers_df
names(writers_df)

#change colname or row name
colnames(writers_df)
rownames(writers_df)

rownames(writers_df)<- c("ID1","ID2","ID3","ID4")
colnames(writers_df) <- c("died@age", "writer@age", "firstName", "secondName", "sex", "death@year")
writers_df

dim(writers_df)
str(writers_df)

nrow(writers_df)
ncol(writers_df)
length(writers_df) # length of row

writers_df

writers_df$'died@age'

diedAge <- writers_df$'died@age'
diedAge

writers_df[2,2] <- 19
writers_df$`writer@age`

writers_df$`died@age`
writers_df$`died@age` <- writers_df$`died@age` -1
writers_df$`died@age`

writers_df
writers_df[1,3]
writers_df[1,3] <- "Johnson"
writers_df


attach(writers_df) # put this dataframe into memory.
diedAge
`died@age`


#numeric calculation

age <- writers_df[1:2]
age

apply(age, 2, mean)
apply(age,1,median)
apply(age,2,median)


## Lets bring back the sample set
dataSet2 <- read.csv2("dataSet.csv")  
dataSet2 

colnames(dataSet2)
head(dataSet2, 2)

rownames(dataSet2)
summary(dataSet2)

tail(dataSet2,2)

dataSet3 <- read.csv2("dataSet.csv", skip=46)
dataSet3






getwd()

datax <- read.csv("hw1_data.csv")
datax


datax$Ozone

sum(is.na(datax$Ozone))

mean(datax$Ozone, na.rm=TRUE)

subset1 = subset(datax, Ozone > 31 & Temp > 90)
mean(subset1$Solar.R)

subset2 = subset(datax, Month==5, na.omit(datax$Ozone))
subset2

max(subset2$Ozone, na.rm=TRUE)


x <- 4L
class(x)

x <- list(2, "a", "b", TRUE)
x[[2]]

x <- 1:4
y <- 2

x+y
class(x+y)

head(datax, 2)
tail(datax, 2)


datax1 <- read.csv("hw1_data.csv", skip=46)
datax1

z <- is.na(datax$Ozone)
sum(z)

mean(datax$Ozone, na.rm=TRUE)


subset1 = subset(datax, Ozone > 31 & Temp > 90)
mean(subset1$Solar.R)


subset2 = subset(datax, Month==5)
subset2

max(subset2$Ozone, na.rm = TRUE)
