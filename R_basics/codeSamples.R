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

#################################################################################################


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



#################################################################################################




# read all the files from the specdata folder based on given set of ids
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


#################################################################################################



#Read list of files form a directory
filenames <- list.files("specdata", pattern="*.csv", full.names=TRUE) # specdta is in the current workDirectory
ldf <- lapply(filenames, read.csv)
print(ldf)
res <- lapply(ldf, summary)




#################################################################################################

getAllFileNames <- function(directory) {
  print(directory)
  path= paste(getwd(),"/",directory,"/", sep = "")
  print(path)
  file_names = dir(path, pattern="*.csv" )
  
}

getAllFileNames("specdata")


#################################################################################################
# write output to the file


# sink() function diverts R output to a connection.
# 
# sink(file = NULL, append = FALSE, type = c("output", "message"),
#      split = FALSE)
# sink.number(type = c("output", "message"))
# 
# file: a writable connection or a character string naming the file to write to, or NULL to stop sink-ing
# append: logical. If TRUE, output will be appended to file; otherwise, it will overwrite the contents of file
# type: character. Either the output stream or the messages stream
# split: logical: if TRUE, output will be sent to the new sink and to the current output stream, like the Unix program tee
# 
# 
# sink.number() gets how many diversions are in use.
# sink.number(type="message") gets the number of connection currently being used for error messages.

sink(file="output.log", append = TRUE)
path= paste(getwd(),"/specdata/", sep = "")
print(path)
file_names = dir(path, pattern="*.csv" )

for (i in 100:101) {
  loc <- paste(getwd(),"/specdata/", file_names[i], sep = "")
  print(loc)
  file <- read.table(loc,header=TRUE, sep=";", stringsAsFactors=FALSE)
  print(file)
  
}
sink()
unlink("output.txt") # delete the file 


getwd()
