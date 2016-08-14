###R Programing Lesson #2 ###
##Basic R commands##

##1. Vectors##

x  = c(1,2,5,9,2,5,6,4,6,3)
x   # show values for x
y = sample(1:9, 10, replace = TRUE)  # Replace TRUE means the nos will be _
                #repeated in the vector, if it FALSE then all the nos in _
                #the sample will be unique.
y   # show values for x
xy = x + y
xy  # show values for x + y; elementlength of both the vectors should be same _
    # to add them together.

## When we sum up two vectors together together R will do addition of each elements _
## of each vector and create a result vector of same length.

