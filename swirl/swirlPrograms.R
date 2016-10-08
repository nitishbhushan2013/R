## SWIRL programming ###
gnitoietwd()

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


#   15. NA
#       1. Missing values play an important role in statistics and data analysis.
#       2. In R, NA is used to represent any value that is 'not available' or 'missing' (in the statistical sense).
#       3. Any operation involving NA generally yields NA as the result.
#           my_data == NA
#           [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA 
#           NA NA NA NA
#           
#           1. The reason you got a vector of all NAs is that NA is not really a value, but just a placeholder for a quantity that is
#           | not available. Therefore the logical expression is incomplete and R has no choice but to return a vector of the same
#           | length as my_data that contains all NAs.
#           
#           
#           2. calculate Non NA value inside vector - R represents TRUE as the number 1 and FALSE as the number 0.
#           | Therefore, if we take the sum of a bunch of TRUEs and FALSEs, we get the total number of TRUEs.
#                my_na <- is.na(my_data)
#                sum(my_na) -- total number of NAs  or length(my_data[is.na(my_data)])
#                
#           3. `!` gives us the negation of a logical expression, so !is.na(x) can be read as 'is not NA'. Therefore, if we
#              | want to create a vector called y that contains all of the non-NA values from x, we can use y <- x[!is.na(x)]. 
#              my_na <- !is.na(my_data)
#              sum(my_na) -- total number of non NAs
#                
#           
#   16. NaN 
#       1. It represent Not A Number
#           0 /0
#           Inf - Inf
#   
#           
#    17. Subsetting - how to extract elements from a vector based on some conditions
#       1. y [y >0] - only return those values which satisfy the condition. For exm:
#           x <- c(1,NA,NA,3,3,NA,NA,NA)
#           > x[!is.na(x)]
#           [1] 1 3 3
#           > x[is.na(x)]
#           [1] NA NA NA NA NA
#           
#      2.  x [ x >0] will not isolate the posititve number as NA is not a value, but rather a placeholder for an unknown quantity, the expression NA > 0 evaluates to NA. Hence
#      | we get a bunch of NAs mixed in with our positive numbers when we do this.
#       
#      3. Many programming languages use what's called 'zero-based indexing', which means that the first element of a vector is
# | considered element 0. R uses 'one-based indexing', which (you guessed it!) means the first element of a vector is
#      | considered element 1.
# 
#  
#     4. It's important that when using integer vectors to subset our vector x, we stick with the set of indexes {1, 2, ..., 40}
#       since x only has 40 elements. What happens if we ask for the zeroth element of x (i.e. x[0])?
#         x[0]
#         numeric(0)
#         
#         
#         x[300]
#         [1] NA
#         
#         
#         Unfortunately, R doesn't prevent us from doing this. This should be a cautionary tale. You should always
# | make sure that what you are asking for is within the bounds of the vector you're working with.
#         
#       5. to find the positional element within vector 
#         1. Example - how we'd subset the 3rd, 5th, and 7th elements of x
#             x[c(3,5,7)]
#           [1] NA  3 NA
#     
#         2. R accepts positive and negative integer indexes.x[c(2, 10)] gives us ONLY the 2nd and 10th elements of x, x[c(-2,
# | -10)] gives us all elements of x EXCEPT for the 2nd and 10 elements.
#         
#         A shorthand way of specifying multiple negative numbers is to put the negative sign out in front of the vector of
#       | positive numbers.   
#             
#             x[c(-2, -10)]
#             x[-c(2, 10)]
#         
#       6. Named vecor
#           First way --> 
#             vect <- c(foo=11, bar=2, norf=NA)
#               foo  bar norf 
#                11    2   NA 
#       
#           Second way -->
#               vect2<- c(11,2,NA)
#               names(vect2) <- c("foo","bar","norf")
# 
#               
#               
#          
#   18. Matrices and DataFrame
# 
#       1. Both represent 'rectangular' data types, meaning that they are used to store tabular data, with rows and columns.
#       
#       2. matrices can only contain a single class of data, while data frames can consist of many different classes of data.
# 
#       3. The dim() function tells us the 'dimensions' of an object. But when you use it for vector, you will get NULL
#       
#       4. The dim() function allows you to get OR set the `dim` attribute for an R object.
#         > dim(my_vector)
#         NULL
#         
#         dim(my_vector) <- c(4,5)
#         [1] 4 5
#       
#       5. Check the attributes of R object --> dim() and attributes()
#           > dim(my_vector)
#           [1] 4 5
#           
#           > attributes(my_vector)
#           $dim
#           [1] 4 5
#         
#           x <- c(1,2,3,4,5,6)
#           > dim(x) <- c(2,3)
#           > x
#           [,1] [,2] [,3]
#           [1,]    1    3    5
#           [2,]    2    4    6
#           > attributes(x)
#           $dim
#           [1] 2 3
#           
#           > class(x)
#           [1] "matrix"
#         
#         
#       6. create a matrix containing the same numbers (1-20) and dimensions (4 rows, 5 columns) 
#             my_matrix2 <- matrix(1:20, nrow=4, ncol=5)
#       
#       7. how to include the names of our patients in the table without destroying the integrity of our numeric data.
#         --  data.frame() function allowed us to store our character vector of names right alongside our matrix of numbers.
#         --Behind the scenes, the data.frame() function takes any number of arguments and returns a single object of class 
#             `data.frame` that is composed of the original objects.   
#            
#              patients <- c("Bill", "Gina", "Kelly", "Sean")
#            
#              data.frame(patients, my_matrix)
#            
#                 patients X1 X2 X3 X4 X5
#                 1     Bill  1  5  9 13 17
#                 2     Gina  2  6 10 14 18
#                 3    Kelly  3  7 11 15 19
#                 4     Sean  4  8 12 16 20
#       
#       8. It's also possible to assign names to the individual rows and columns of a data frame
#       
#           cnames <- c("patient", "age","weight", "bp", "rating", "test")
#           colnames(my_data) <- cnames
#           my_data
#             patient age weight bp rating test
#                 1    Bill   1      5  9     13   17
#                 2    Gina   2      6 10     14   18
#                 3   Kelly   3      7 11     15   19
#                 4    Sean   4      8 12     16   20  
#               
            
    
#     19. Logic
#       1. There are two AND operators in R, `&` and `&&`. Both operators work similarly
#       
#       2. You can use the `&` operator to evaluate AND across a vector. The `&&` version of AND only evaluates the first member of
#       | a vector.
#       
#           TRUE & c(TRUE, FALSE, FALSE)
#           [1]  TRUE FALSE FALSE
#           the left operand `TRUE` is recycled across every element in the vector of the right
#           | operand. This is the equivalent statement as c(TRUE, TRUE, TRUE) & c(TRUE, FALSE, FALSE).
#           
#           
#           TRUE && c(TRUE, FALSE, FALSE)
#           [1] TRUE
#           the left operand is only evaluated with the first member of the right operand (the vector). The rest of the
#           | elements in the vector aren't evaluated at all in this expression.
# 
# 
#       3. The OR operator follows a similar set of rules. The `|` version of OR evaluates OR across an entire vector, while the
#  `||` version of OR only evaluates the first member of a vector.
# 
#       4. Ordering - All AND operators are evaluated before OR operators 
# 
#       5. The function isTRUE() takes one argument. If that argument evaluates to TRUE, the function will return TRUE. Otherwise,
# the function will return FALSE.
# 
#       6. xor() -> The xor() function stands for exclusive OR. If one argument evaluates to TRUE and one argument evaluates
#       to FALSE, then this function will return TRUE, otherwise it will return FALSE. 
# 
#       7. The which() function takes a logical vector as
# | an argument and returns the indices of the vector that are TRUE. For example which(c(TRUE, FALSE, TRUE)) would return the
#           | vector c(1, 3).
# 
#             ints <- sample(10)
#             ints <=2
#               [1] FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
#           > which(ints <= 2)
#               [1] 3 4
# 
#       8. any() or all() --> the functions any() and all() take logical vectors as their argument. The any() function will
#          return TRUE if one or more of the elements in the logical vector is TRUE. The all() function will return TRUE if every
#         element in the logical vector is TRUE.
#         
            
      
  # 20. Functions 
  #   1. To understand computations in R, two slogans are helpful: 1. Everything that exists is an object. 2. Everything that
  #   | happens is a function call.
  #   
  #   2. You can also explicitly specify arguments in a function. When you explicitly designate argument values by name, the
  #   | ordering of the arguments becomes unimportant. You can try this out by typing: remainder(divisor = 11, num = 5).
  #   
  #   3. args(remainder) to examine the arguments for the remainder function.
  #   
  #   4. args() is a function, remainder() is a function, yet remainder was an argument for args(). Yes it's true:
      #you can pass functions as arguments! This is a very powerful concept.

         # You can pass functions as arguments to other functions just like you can pass
        # data to functions. Let's say you define the following functions:
              #
              # add_two_numbers <- function(num1, num2){
              #    num1 + num2
              # }
              #
              # multiply_two_numbers <- function(num1, num2){
              #	num1 * num2
              # }
              #
              # some_function <- function(func){
              #    func(2, 4)
            # }
            #
            # As you can see we use the argument name "func" like a function inside of 
            # "some_function()." By passing functions as arguments 
            # some_function(add_two_numbers) will evaluate to 6, while
            # some_function(multiply_two_numbers) will evaluate to 8.

    
     # 5. ellipses - This is a strict rule in R programming: all arguments after an ellipses must have default values.
    #Usually a function that has the
    # ellipses as an argument has the ellipses as the last argument. The usage of
    # such a function would look like:
    #
    # ellipses_func(arg1, arg2 = TRUE, ...)
    #
    # In the above example arg1 has no default value, so a value must be provided
    # for arg1. arg2 has a default value, and other arguments can come after arg2
    # depending on how they're defined in the ellipses_func() documentation.
    # Interestingly the usage for the paste function is as follows:
    #
    # paste (..., sep = " ", collapse = NULL)
    #
    # Notice that the ellipses is the first argument, and all other arguments after
    # the ellipses have default values.  
  
          
     

  # 21. date and time
  # 
  #     Sys.Date()
  #         [1] "2016-10-05"
  #     > Sys.time()
  #          [1] "2016-10-05 22:02:41 AEDT"
  #     
  #   1. Dates are represented by the 'Date' class and times are represented by the 'POSIXct' and 'POSIXlt' classes. Internally,
  #   | dates are stored as the number of days since 1970-01-01 and times are stored as either the number of seconds since
  #   | 1970-01-01 (for 'POSIXct') or a list of seconds, minutes, hours, etc. (for 'POSIXlt')
  #   
  #   2. We can use the unclass() function to see what d1 looks like internally.
  #       
  #       d1 <- Sys.Date()
  #       class(d1)
  #         [1] "Date"
  #       unclass(d1)
  #         [1] 17079
  #       
  #   3.     t1 <- Sys.time()
  #             [1] "2016-10-05 22:03:35 AEDT"
  #          class(t1)
  #              [1] "POSIXct" "POSIXt"  #POSIXct is just one of two ways that R represents time information. (You can ignore the second
  #          |                  #value above, POSIXt, which just functions as a common language between POSIXct and POSIXlt.)
  #         
  #         unclass(t1)
  #            [1] 1475665416     
  #         
  #          t2 <- as.POSIXlt(Sys.time())
  #          
  #          t2
  #             [1] "2016-10-05 22:05:34 AEDT"
  #     
  #          unclass(t2)
  #              $sec
  #              [1] 34.20425
  #              
  #              $min
  #              [1] 5
  #              
  #              $hour
  #              [1] 22
  #              
  #              $mday
  #              [1] 5
  #              
  #              $mon
  #              [1] 9
  #              
  #              $year
  #              [1] 116
  #              
  #              $wday
  #              [1] 3
  #              
  #              $yday
  #              [1] 278
  #              
  #              $isdst
  #              [1] 1
  #              
  #              $zone
  #              [1] "AEDT"
  #              
  #              $gmtoff
  #              [1] 39600
  #              
  #              attr(,"tzone")
  #              [1] ""     "AEST" "AEDT"
  #          
  #          str(unclass(t2))
  #              List of 11
  #              $ sec   : num 34.2
  #              $ min   : int 5
  #              $ hour  : int 22
  #              $ mday  : int 5
  #              $ mon   : int 9
  #              $ year  : int 116
  #              $ wday  : int 3
  #              $ yday  : int 278
  #              $ isdst : int 1
  #              $ zone  : chr "AEDT"
  #              $ gmtoff: int 39600
  #              - attr(*, "tzone")= chr [1:3] "" "AEST" "AEDT"
  #          
  #          t2$min
  #             [1] 5
  #          
  #          
  #     4.  weekdays(), months(), and quarters()
  #     
  #     5. Often, the dates and times in a dataset will be in a format that R does not recognize. The strptime() function can be
  #     | helpful in this situation. strptime() converts character vectors to POSIXlt.
  #     
  #         t3 <- "October 17, 1986 08:24"
  #         t4 <- strptime(t3, "%B %d, %Y %H:%M")
  #         t4
  #           [1] "1986-10-17 08:24:00 AEST"
  #     
  #     6. there are a number of operations that you can perform on dates and times, including arithmetic operations 
  #     (+ and  -) and comparisons (<, ==, etc.)
  #     
  #     Sys.time() > t1
  #     [1] TRUE
  #     
  #     Sys.time() - t1
  #     Time difference of 12.96315 mins
  #     
  #     7. f you want more control over the units when finding the above difference in times, you can use difftime(), 
  #     which allows you to specify a 'units' parameter.
  #     
  #         difftime(Sys.time(), t1, units='days')
  #         Time difference of 0.009619268 days
      
      


#    22. working with data   
#     1. Whenever you're working with a new dataset, the first thing you should do is look at it! What is the format of
# | the data? What are the dimensions? What are the variable names? How are the variables stored? Are there
#     | missing data? Are there any flaws in the data?
# 
#     2. class(x) - This will give us a clue as to the overall structure of the data.
#     
#         > class(plants)
#         [1] "data.frame"
# 
#     3. Use dim(plants) to see exactly how many rows and columns we're dealing with.
#     
#         > dim(plants)
#         [1] 5166   10
#     
#     4. use nrow(plants) to see only the number of rows. and ncol(plants) to see only the number of rows.
#     
#     5. use object.size(plants) to see much space the dataset is occupying in memory
#       > object.size(plants)
#       644232 bytes
#       
#     6.  names(plants) will return a character vector of column (i.e. variable) names. 
#     
#     7. The head() function allows you to preview first 6 records of the top of the dataset. You can alter this behavior by passing as a second argument
#     | the number of rows you'd like to view.
#         head(plants, 10)
# 
#     8. Use tail() to preview the last 6 records of the end of the dataset
# 
#     9. Use summary(plants) to get a better feel for how each variable is distributed and how much of the dataset is missing.
#         -- summary() provides different output for each variable, depending on its class. For numeric data such as Precip_Min,
# | summary() displays the minimum, 1st quartile, median, mean, 3rd quartile, and maximum. 
#         -- For categorical variables (called 'factor' variables in R), summary() displays the number of times each value (or
# | 'level') occurs in the data. For example, each value of Scientific_Name only appears once, since it is unique to a
#     | specific plant. In contrast, the summary for Duration (also a factor variable) tells us that our dataset contains 3031
#     | Perennial plants, 682 Annual plants, etc.
#     
#         > summary(plants)
#                            Scientific_Name              Duration              Active_Growth_Period      Foliage_Color 
#           Abelmoschus                 :   1   Perennial        :3031   Spring and Summer   : 447      Dark Green  :  82  
#           Abelmoschus esculentus      :   1   Annual           : 682   Spring              : 144      Gray-Green  :  25  
#           Abies                       :   1   Annual, Perennial: 179   Spring, Summer, Fall:  95      Green       : 692  
#           Abies balsamea              :   1   Annual, Biennial :  95   Summer              :  92      Red         :   4  
#           Abies balsamea var. balsamea:   1   Biennial         :  57   Summer and Fall     :  24      White-Gray  :   9  
#           Abutilon                    :   1   (Other)          :  92   (Other)             :  30      Yellow-Green:  20  
#           (Other)                     :5160   NA's             :1030   NA's                :4334      NA's        :4334  
#           pH_Min          pH_Max         Precip_Min      Precip_Max         Shade_Tolerance   Temp_Min_F    
#           Min.   :3.000   Min.   : 5.100   Min.   : 4.00   Min.   : 16.00   Intermediate: 242   Min.   :-79.00  
#           1st Qu.:4.500   1st Qu.: 7.000   1st Qu.:16.75   1st Qu.: 55.00   Intolerant  : 349   1st Qu.:-38.00  
#           Median :5.000   Median : 7.300   Median :28.00   Median : 60.00   Tolerant    : 246   Median :-33.00  
#           Mean   :4.997   Mean   : 7.344   Mean   :25.57   Mean   : 58.73   NA's        :4329   Mean   :-22.53  
#           3rd Qu.:5.500   3rd Qu.: 7.800   3rd Qu.:32.00   3rd Qu.: 60.00                       3rd Qu.:-18.00  
#           Max.   :7.000   Max.   :10.000   Max.   :60.00   Max.   :200.00                       Max.   : 52.00  
#           NA's   :4327    NA's   :4327     NA's   :4338    NA's   :4338                         NA's   :4328    
#           
#           
#       10. Perhaps the most useful and concise function for understanding the *str*ucture of your data is str().
#           -- The beauty of str() is that it combines many of the features of the other functions you've already seen, all in a concise
# | and readable format. At the very top, it tells us that the class of plants is 'data.frame' and that it has 5166
# | observations and 10 variables. It then gives us the name and class of each variable, as well as a preview of its
# | contents.
# 
#       -- str() is actually a very general function that you can use on most objects in R. Any time you want to understand the
# | structure of something (a dataset, function, etc.), str() is a good place to start.
# 
# 
#             > str(plants)
#               'data.frame':	5166 obs. of  10 variables:
#                     $ Scientific_Name     : Factor w/ 5166 levels "Abelmoschus",..: 1 2 3 4 5 6 7 8 9 10 ...
#                     $ Duration            : Factor w/ 8 levels "Annual","Annual, Biennial",..: NA 4 NA 7 7 NA 1 NA 7 7 ...
#                     $ Active_Growth_Period: Factor w/ 8 levels "Fall, Winter and Spring",..: NA NA NA 4 NA NA NA NA 4 NA ...
#                     $ Foliage_Color       : Factor w/ 6 levels "Dark Green","Gray-Green",..: NA NA NA 3 NA NA NA NA 3 NA ...
#                     $ pH_Min              : num  NA NA NA 4 NA NA NA NA 7 NA ...
#                     $ pH_Max              : num  NA NA NA 6 NA NA NA NA 8.5 NA ...
#                     $ Precip_Min          : int  NA NA NA 13 NA NA NA NA 4 NA ...
#                     $ Precip_Max          : int  NA NA NA 60 NA NA NA NA 20 NA ...
#                     $ Shade_Tolerance     : Factor w/ 3 levels "Intermediate",..: NA NA NA 3 NA NA NA NA 2 NA ...
#                     $ Temp_Min_F          : int  NA NA NA -43 NA NA NA NA -13 NA ...
#                     
      
      
   

  # 23. Simulation
  #   1. sample() to generate random number 
  #   
  #   2. Let's simulate rolling four six-sided dice: sample(1:6, 4, replace = TRUE).
  # 
  #       > sample(1:6, 4, replace=TRUE)
  #       [1] 5 6 5 3  
  # 
  #   Now sample 10 numbers between 1 and 20, WITHOUT replacement.
  #       sample(1:20, 10)
  #     [1] 20 10  4 13 15 12  3  9  8 17
  # 
  # 
  #         The sample() function can also be used to permute, or rearrange, the elements of a vector. For example, try
  #     | sample(LETTERS) to permute all 26 letters of the English alphabet.
  #         
  #         > sample(LETTERS)
  #         [1] "P" "O" "I" "C" "K" "V" "A" "X" "H" "F" "D" "W" "B" "Q" "N" "G" "T" "Y" "J" "M" "L" "U" "R" "Z" "S" "E"
  #         
  #         This is identical to taking a sample of size 26 from LETTERS, without replacement. When the 'size' argument to sample()
  #     | is not specified, R takes a sample equal in size to the vector from which you are sampling.
  #         
  # 
  #     3. suppose we want to simulate 100 flips of an unfair two-sided coin. This particular coin has a 0.3 probability of
  #     | landing 'tails' and a 0.7 probability of landing 'heads'.
  #     
  #             Let the value 0 represent tails and the value 1 represent heads. Use sample() to draw a sample of size 100 from the
  #         | vector c(0,1), with replacement. Since the coin is unfair, we must attach specific probabilities to the values 0 (tails)
  #             | and 1 (heads) with a fourth argument, prob = c(0.3, 0.7). Assign the result to a new variable called flips.
  #                
  #                    flips <- sample(c(0,1), 100, replace=TRUE, prob=c(0.3,0.7))
  # 
  # 
  # 
  #       4. binomial random variable - A coin flip is a binary outcome (0 or 1) and we are performing 100 independent 
  #           trials (coin flips), so we can use rbinom() to simulate a binomial random variable.
  #           
  #               A binomial random variable represents the number of 'successes' (heads) in a given number of independent
  #             'trials' (coin flips). Therefore, we can generate a single random variable that represents the number of heads in 100 flips of our 
  #             unfair coin using rbinom(1, size = 100, prob = 0.7). Note that you only specify the probability of 'success' 
  #             (heads) and NOT the probability of 'failure' (tails).
  # 
  #                 rbinom(1, size=100,prob=0.7)
  #                     [1] 72
  # 
  # 
  #           Equivalently, if we want to see all of the 0s and 1s, we can request 100 observations, each of size 1, with 
  #         success probability of 0.7. Give it a try, assigning the result to a new variable called flips2.
  # 
  #                   flips2 <- rbinom(100, 1, prob=0.7)
  #                       flips2
  #                         [1] 0 1 1 1 0 0 1 1 0 0 1 1 1 1 0 0 1 1 1 0 1 0 1 1 0 1 0 0 0 1 1 1 1 0 1 0 1 1 1 1 1 1 0 1 1 1 1 0 1 0 1 0 1 0 0 0 1 1 0
  #                           [60] 0 1 1 1 1 1 1 1 1 0 1 0 1 0 1 0 1 1 0 1 1 1 1 0 0 1 1 1 1 1 0 0 1 1 1 1 1 1 1 1 1
  # 
  # 
  #       5. Standard normal distribution - rnorm()
  #           The standard normal distribution has mean 0 and standard deviation 1.Thus, rnorm(10) will generate 10 random
  #           numbers from a standard normal distribution.
  # 
  #         Generate 5 random values from a Poisson distribution with mean 10.
  #             rpois(5,10)
  #                 [1]  7  8 12 12 15
  # 
  #         simulate 100 *groups* of random numbers, each containing 5 values generated from a Poisson distribution with 
  #         mean 10?
  #              my_pois <- replicate(100, rpois(5,10))
  #        
  #        replicate() created a matrix, each column of which contains 5 random numbers generated from a Poisson distribution 
  #           with mean 10.    
  # 
  # 
  #         Now we can find the mean of each column in my_pois using the colMeans() function
  #               cm <- colMeans(my_pois)

          

  # 24. Graphs graphics: Plotting
  #   1. Before plotting, it is always a good idea to get a sense of the data. Key R commands for doing so include, dim(), 
  #       names(), head(), tail() and summary().
  #   
  #   Use plot() command to show speed on the x-axis and dist on the y-axis from the cars data frame. 
  #     plot(x=cars$speed, y=cars$dist)
  #   
  #   Recreate the plot with the label of the x-axis set to "Speed".
  #     plot(x=cars$speed, y=cars$dist, xlab="speed")
  #   
  #   Recreate the plot with "Speed" and "Stopping Distance" as axis labels.
  #     plot(x=cars$speed, y=cars$dist, xlab="Speed", ylab="Stopping Distance", main="My Plot")
  #     
  #   Plot cars with a main title of "My Plot".
  #     plot(cars, main = "My Plot")
  #     
  #   Plot cars with a sub title of "My Plot Subtitle".
  #     plot(cars, main="My Plot Subtitle")
  #     
  #  Use boxplot() with formula = mpg ~ cyl and data = mtcars to create a box plot.
  #     boxplot(formula=mpg~cyl, mtcars)
  #     
  # When looking at a single variable, histograms are a useful tool. hist()    
      
      
      
      
      
      

      
        
          
                
          
    
      
    
    


