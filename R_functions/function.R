## functions related 

# last stmt in the function is its return value
# agument matching
# Lazy evaluation of the function arguments,its okey to pass surplus or less parameters to the functions 
# ... arguments
# any arguments that come safter ... must be named explicitly and cn not be partially matched
# You can defne function inside other finction 



##Scoping
# global env[ colletion of key ans value ] is alsways the first element and base package is the last element in the search list.
# R always look out to these search elements to get the value of the variable. 
# R has separate namespace for function and non function

# R uses lexical or static scoping to determine the funtion variables and free variables
# function closure = funtion and its environments


makes <- function(n) { 
  pow <- funtion(x) {
     x^n
  }
  pow
}

cube <- makes(3)
cube(3)



