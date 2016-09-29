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
  } else if (i<20) {
    x <- sub("^", "0", i)
  }
  else {
    x <- i
  }
  print(x)
}
