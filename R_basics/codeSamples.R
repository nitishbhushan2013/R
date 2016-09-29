## Lets understand Paste 

paste("00",1:9, sep = "") #[1] "001" "002" "003" "004" "005" "006" "007" "008" "009"
paste(c("abc", "def", "ghi")) # [1] "abc" "def" "ghi"
paste("abc", "def", "ghi") #[1] "abc def ghi"
paste("abc", "def", "ghi", sep = "") #[1] "abcdefghi"



whales <- c("C","D","C","D","D")
quails <- c("D","D","D","D","D")

results <-paste(whales, quails, sep = "")  #[1] "CD" "DD" "CD" "DD" "DD"
results <-paste(whales, quails, sep = " ")  #[1] "C D" "D D" "C D" "D D" "D D"
results <-paste(whales, quails, collapse = "") #[1] "C DD DC DD DD D"
results <-paste(whales, quails, sep = "", collapse = "") #"CDDDCDDDDD"
results <-paste(whales, quails, sep = "", collapse = " ") #[1] "CD DD CD DD DD"
results <-paste(whales, quails, sep = " ", collapse = " ") #[1] "C D D D C D D D D D"

#*****************************************************************************************#
## sep allows each terms to be separated by a character string, 
#whereas collapse allows the entire result to be separated by a character string.
#*****************************************************************************************#
results <-paste(whales, quails, sep = "-")  #[1] "C-D" "D-D" "C-D" "D-D" "D-D"
results <-paste(whales, quails) #[1] "C D" "D D" "C D" "D D" "D D"
results <-paste(whales, quails, collapse = "-") #[1] "C D-D D-C D-D D-D D"
results <-paste(whales, quails, sep = "*", collapse = "-") #[1] "C*D-D*D-C*D-D*D-D*D"

print(results)




#Read list of files form a directory
filenames <- list.files("specdata", pattern="*.csv", full.names=TRUE) # specdta is in the current workDirectory
ldf <- lapply(filenames, read.csv)
print(ldf)
res <- lapply(ldf, summary)



# append character to the integer
for (i in 1:101) {
  if(i <10){ 
   # x <- sub("^", "00", i)
    x <- paste("00",i,sep = "")
    print(x)
    y <- as.numeric(x)
  print(y)
    x <- as.integer(x)
  } else if (i<20 && i >10) {
    x <- sub("^", "0", i)
  }
  else {
    x <- i
  }
  #print(x)
}


##file_Paths = paste(getwd(),"/specdata/", "00",1:9,".csv", sep = "") #

# https://www.r-bloggers.com/looping-through-files/
path= paste(getwd(),"/specdata/", sep = "")
print(path)
file_names = dir(path, pattern="*.csv" )

for (i in 100:101) {
  loc <- paste(getwd(),"/specdata/", file_names[i], sep = "")
  print(loc)
  file <- read.table(loc,header=TRUE, sep=";", stringsAsFactors=FALSE)
  print(file)
  
}
#print(file_names)


