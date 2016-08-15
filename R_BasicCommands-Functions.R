###R Programing Lesson #2 ###
##Basic R commands##

##1. Vectors##

x <- c(1,2,5,9,2,5,6,4,6,3)
x   # show values for x
y <- sample(1:9, 10, replace = TRUE)  # Replace TRUE means the nos will be _
                #repeated in the vector, if it FALSE then all the nos in _
                #the sample will be unique.
y   # show values for x
xy <- x + y
xy  # show values for x + y; elementlength of both the vectors should be same _
    # to add them together.

## When we sum up two vectors together together R will do addition of each elements _
## of each vector and create a result vector of same length.

a <- c("Rajesh","Rakesh","Sumit","Prakesh")
# a is charactor type of vector
# we can check the type of vector by using typeof()
typeof(a)

# 3 common properties of vectors are typeof(), length() and attributes()
length(a)
attributes(a)

# atomic vectors are homogenious i.e. they have same data type of elements, whereas
# list is also a vector which is hetrogenous i.e. list can have different data type 
# of elements. list can also have a list as element, that is why it is also called as
# recursive vectors.

a_list <- list(list("a","b","c"), c(1,2,3), c(TRUE, FALSE))
typeof(a_list)

# we can also use str(), it is a short form for structure and it gives a compact 
# human readable description of any R data structure.

str(a_list)

# List can also have list as data element, it is called recursive list
a_nest_list <- list(list(list(list("a","b"), 1, 2), TRUE, FALSE),"Delhi", "Mumbai")
str(a_nest_list)

# c() will combine several list into one, if it is a combination of atomic vectors 
# and lists, c() will coerce the vectors to list before combining then

com_a_nest_list <- c(list("Delhi", "Mumbai", TRUE, FALSE), c(1,2), list("a", "b"))

# unlist() can be used to unlist a list to atomic vector.

lst1 <- list("a", "b", list(1,2,3,4), c(TRUE,FALSE))
str(lst1)

vec1 <- unlist(lst1)
str(vec1)

