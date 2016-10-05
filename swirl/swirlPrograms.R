## SWIRL programming ###
getwd()

install.packages("swirl")  ## install the package
library(swirl)  ## load the package
install_from_swirl("R Programming") #load the R programming module

swirl() # Start the program

# important points
#1.  When given two vectors of the same length, R simply performs the specified arithmetic operation (`+`, `-`, `*`, etc.)
# | element-by-element. If the vectors are of different lengths, R 'recycles' the shorter vector until it is the same length
# | as the longer vector.

# 2. If the length of the shorter vector does not divide evenly into the length of the longer vector, R will still apply the
# | 'recycling' method, but will throw a warning to let you know something fishy might be going on.
# 
# 3. current working directory -> getwd()

# 4. List all the objects in your local workspace -> ls()
# 
# 5. List all the files in your working directory -> dir() or list.files()
# 
# 6. Using the args() function on a function name is also a handy way to see what arguments a function can take.
# 
# 7. To delete a directory you need to use the recursive = TRUE argument with the function unlink(). If you don't use
# | recursive = TRUE, R is concerned that you're unaware that you're deleting a directory and all of its contents. R reasons
# | that, if you don't specify that recursive equals TRUE, you don't know that something is in the directory you're trying to
# | delete. R tries to prevent you from making a mistake.
# Why is this command named "unlink" rather than something more sensible like "dir.delete" or "dir.remove"? Mainly,
# | history. unlink is the traditional Unix command for removing directories.

# 8. Remember that if you have questions about a particular R function, you can access its documentation with a question mark
# | followed by the function name: ?function_name_here. However, in the case of an operator like the colon used above, you
# | must enclose the symbol in backticks like this: ?`:`.
# 
# 9. 1:10 is same as seq(1,10). However, let's say that instead we want a vector of numbers ranging from 0 to 10,
# | incremented by 0.5. seq(0, 10, by=0.5). And if we just want a sequence of 30 numbers between 5 and 10. seq(5, 10,
# | length=30)
# 
# 10. Let's pretend we don't know the length of my_seq, but we want to generate a sequence of integers from 1 to N, where N
# | represents the length of the my_seq vector. In other words, we want a new vector (1, 2, 3, ...) that is the same length
# | as my_seq.
#   1. 1:length(my_seq)
#   2. seq(along.with=my_seq) 
#   3. seq_along(my_seq)
# 
# 
# 11. 
#     1. If we're interested in creating a vector that contains 40 zeros, we can use rep(0, times = 40)
#     2. we want our vector to contain 10 repetitions of the vector (0, 1, 2), we can do rep(c(0, 1, 2), times = 10).
#     3. let's say that rather than repeating the vector (0, 1, 2) over and over again, we want our vector to contain 10
# | zeros, then 10 ones, then 10 twos. We can do this with the `each` argument. Try rep(c(0, 1, 2), each = 10).

#   12. 
#       1. The simplest and most common data structure in R is the vector.
#       2. Vectors come in two different flavors: atomic vectors and lists. An atomic vector contains exactly one data type, whereas
#       | a list may contain multiple data types.
#       3. Logical vectors can contain the values TRUE, FALSE, and NA (for 'not available').These values are generated as the
#       | result of logical 'conditions'.
#           num_vect <- c(0.5, 55, -10, 6)
#           tf <- num_vect <1
#           tf 
#           TRUE FALSE  TRUE FALSE
#       
#   13. The `collapse` argument to the paste() function tells R that when we join together the elements of the my_char character
#   | vector, we'd like to separate them with single spaces.
#        my_char <- c("My", "name", "is")
#        [1] "My"   "name" "is" 
#        
#       paste(my_char, collapse = " ")
#        [1] "My name is"
# 
#   when we use 'collapse'' for different vetors then it seperate the different vector subelement set by the collapse character
#     paste(c(1,2,3), c('a','b','c'), collapse="!")
#     [1] "1 a!2 b!3 c"
# 
#     paste(c(1,2,3), c('a','b','c'), c('r', 't', 'y'),collapse="!")
#     [1] "1 a r!2 b t!3 c y"
# 
# 
#   when we use 'sep' for different vetors then it join the different vector by sep. 
#     paste(c(1,2,3), c('a','b','c'), sep ="!")
#     [1] "1!a" "2!b" "3!c"
# 
#   14. we used the paste() function to collapse the elements of a single character vector. paste() can also be
# | used to join the elements of multiple character vectors. Try
# | paste("Hello", "world!", sep = " "), where the `sep` argument tells R that we want to separate the joined elements with a
#   | single space.
#   
#   > paste("Hello", "world!", sep=" ")
#   [1] "Hello world!"


  15. NA
      1. Missing values play an important role in statistics and data analysis.
      2. In R, NA is used to represent any value that is 'not available' or 'missing' (in the statistical sense).
      3. Any operation involving NA generally yields NA as the result.
          my_data == NA
          [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA 
          NA NA NA NA
          
          1. The reason you got a vector of all NAs is that NA is not really a value, but just a placeholder for a quantity that is
          | not available. Therefore the logical expression is incomplete and R has no choice but to return a vector of the same
          | length as my_data that contains all NAs.
          
          
          2. calculate Non NA value inside vector - R represents TRUE as the number 1 and FALSE as the number 0.
          | Therefore, if we take the sum of a bunch of TRUEs and FALSEs, we get the total number of TRUEs.
               my_na <- is.na(my_data)
               sum(my_na) -- total number of NAs  or length(my_data[is.na(my_data)])
               
          3. `!` gives us the negation of a logical expression, so !is.na(x) can be read as 'is not NA'. Therefore, if we
             | want to create a vector called y that contains all of the non-NA values from x, we can use y <- x[!is.na(x)]. 
             my_na <- !is.na(my_data)
             sum(my_na) -- total number of non NAs
               
          
  16. NaN 
      1. It represent Not A Number
          0 /0
          Inf - Inf
  
          
   17. Subsetting - how to extract elements from a vector based on some conditions
      1. y [y >0] - only return those values which satisfy the condition. For exm:
          x <- c(1,NA,NA,3,3,NA,NA,NA)
          > x[!is.na(x)]
          [1] 1 3 3
          > x[is.na(x)]
          [1] NA NA NA NA NA
          
     2.  x [ x >0] will not isolate the posititve number as NA is not a value, but rather a placeholder for an unknown quantity, the expression NA > 0 evaluates to NA. Hence
     | we get a bunch of NAs mixed in with our positive numbers when we do this.
      
     3. Many programming languages use what's called 'zero-based indexing', which means that the first element of a vector is
| considered element 0. R uses 'one-based indexing', which (you guessed it!) means the first element of a vector is
     | considered element 1.

 
    4. It's important that when using integer vectors to subset our vector x, we stick with the set of indexes {1, 2, ..., 40}
      since x only has 40 elements. What happens if we ask for the zeroth element of x (i.e. x[0])?
        x[0]
        numeric(0)
        
        
        x[300]
        [1] NA
        
        
        Unfortunately, R doesn't prevent us from doing this. This should be a cautionary tale. You should always
| make sure that what you are asking for is within the bounds of the vector you're working with.
        
      5. to find the positional element within vector 
        1. Example - how we'd subset the 3rd, 5th, and 7th elements of x
            x[c(3,5,7)]
          [1] NA  3 NA
    
        2. R accepts positive and negative integer indexes.x[c(2, 10)] gives us ONLY the 2nd and 10th elements of x, x[c(-2,
| -10)] gives us all elements of x EXCEPT for the 2nd and 10 elements.
        
        A shorthand way of specifying multiple negative numbers is to put the negative sign out in front of the vector of
      | positive numbers.   
            
            x[c(-2, -10)]
            x[-c(2, 10)]
        
        
        
        
    
            
    
    
        
    
    


