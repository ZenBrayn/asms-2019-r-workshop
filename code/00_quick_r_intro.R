
#===== 
# This is a quick and completely inadequate tour R
# highlighting some of the fundamentals that all
# new R users should know...  There's also a lot
# to learn not covered here.
#=====

# IN RSTUDIO: PRESS CONTROL/COMMAND-ENTER ON EACH
#             LINE TO STEP THROUGH THE EXAMPLES
#             ONE BY ONE

#==== Variable Assignment
# In R, you assign variables with the '<-' operator
# (you can use '=' too, but <- is the convention)
my_var <- 10


#==== Vectors
# Vector: what R calls (homogeneous) lists of elements
# (a "list" is another entity in R that can hold potentially different kinds of elements)

# The 'c' function "combines" elements into a vector
# This is one with floating point numbers
float_vec <- c(10.2, 11.8, 16.2, 20.1)
# This is one with characters
str_vec <- c("hello", "world", "thank", "you")
# This is one with boolean values (true & false)
my_other_vec <- c(TRUE, FALSE, FALSE)

#==== Vector operations
# Use the 'length' function to see how long a vector is
length(float_vec)

# You can get get individual elements out of a vector
# using an integer position (index) 
# Important: R starts counting at 1
# The exampe below gives you the first element of float_vec
float_vec[1]
# IMPORTANT: You "can" index greater than the length of the vector
#            BUT... it will return NA (not available) - probably not what you typically want
float_vec[5]
# You can also index multiple items with another integer vector
float_vec[c(1,3,4)]
# .. or contiguous elements with the `:` operator
float_vec[2:4]

# You can also index with a boolean vector
# TRUE means select the element
# FALSE means leave the element out
# IMPORTANT: makes the most sense for the boolean vector to be the same length 
#            as the vector you're indexing
float_vec[c(TRUE, FALSE, FALSE, TRUE)]
# Remember this example... we'll expand on it below.

# Many functions in are are vectorized, meaning you can compute
# on all the elements of a vector with one function call
new_vec_1 <- c(-10.2, 25, -100)
new_vec_2 <- c(18.8, 25.6, 103.5)
# This will give you the absolute value of all the elements in new_vec_1
abs(new_vec_1)
# You can even add two vectors together (element by element addition)
# IMPORTANT: Make sure the two vectors are the same length
new_vec_1 + new_vec_2
# You can muliply vectors too (gives element by element multiplication)
# For those who know linear algebra, this is not vector multiplication
new_vec_1 * new_vec_2
# Functions like min and max take a vector as input and return a single value
min(new_vec_2)
max(new_vec_2)


#=== Data Frames
# Data frames are one of the most important
# data structures in R; it's likely what you'll
# be working with a lot (most?) of the time.  If you read
# a formatted text file into R, it will become
# a data frame. R has built in data sets (e.g. iris, mtcars), 
# and they're typically data frames too.
# Data frames are everywhere in R.
#
# Think of a data frame as a rectangular table where each 
# column is vector (not always true... but don't worry about that for now).
# You can operate on the columns just like regular vectors (i.e. the stuff above)
#
# As an example, let's use the built-in R data set 'mtcars'
# This data set has information about cars.
View(mtcars)

# Data frames have column names, and you can see what they are
# with the names function
names(mtcars)

# We can get the size the the data set with
nrow(mtcars)
ncol(mtcars)

# If you want to get data from a particular column, you use
# the '$' operator -- it's kind of strange, but you'll get
# used to it.
mtcars$mpg

# Let's compute summary stats on miles per gallon (mpg column)
mean(mtcars$mpg)
sd(mtcars$mpg)
median(mtcars$mpg)

# You can add a new column to a data frame as follows:
mtcars$my_col <- "NEW"
View(mtcars)
# Since we only assigned one value to the new column
# it put that value in every row!  Sometimes that's
# helpful, sometimes that's not.
# Alternatively, you can assign a new column to a 
# vector that has as many elements as there are
# rows in the data frame, i.e.
# mtcars$my_col <- c(val1, val2, val3, ..., valNROWS)
# Don't run that above since it's not complete code

# You can also create a new column from existing columns
# Since all columns have the same number of element (i.e. rows)
# R will perform the calculations element by element
mtcars$mpg_times_hp <- mtcars$mpg * mtcars$hp
View(mtcars)

# Subsetting data frames is another very important topic.
# This allows to analyze specific portions of your data,
# filter out unwanted data, etc.
# With data frame, you can subset by both rows and columns,
# but you will usually want to subset by rows.
# You use brackets '[' to subset.
# Here's an example subsetting to cars that only have 4 cylinders
mtcars[mtcars$cyl == 4, ]
# Let's disect that:
#  the first part 'mtcars[' says we're going to subset the mtcars
#  data frame. Inside the [ ] we say how we want to subset.
#  The first part before the ',' is how we'll subset the rows.
#  The second part after the ',' is how we'll subset the columns.
# Here's the first part (the rows) by itself
mtcars$cyl == 4
# That's a boolean vector, one element for each row in mtcars
# Remember how we indexed a vector by boolean values above?
# Now, we're going to index the mtcars data frame in a similar way
#
# Let's look at the second part (the columns).
# Wait a second... there's nothing there! It's just blank space
# after the ','.
# When you don't specify anything after the column, that means
# to just take ALL the columns.
# Let's wrap it all together:
mtcars[mtcars$cyl == 4, ]
# The output is a new data frame that only contains the cars that
# have 4 cylinders
#
# We can also subset the columns, i.e.
mtcars[mtcars$cyl == 4, c(1,4)]
# OR
mtcars[mtcars$cyl == 4, c("mpg", "hp")]
# IMPORTANT: make sure you have a comma
# inside the [ ]; that specifies the row
# and column selections.  The code below
# won't work (copy and paste it to try):
# mtcars[mtcars$cyl == 4]
# There's no ',' there so it gives an error!
# I used to forget the comma all the time...
# It's frustrating but hang in there!

# If you want to do analysis on a subset
# of the data, save the subset result to
# a variable and work with that
mtcars_4cyl <- mtcars[mtcars$cyl == 4, ]
View(mtcars_4cyl)
mean(mtcars_4cyl$mpg)

# IMPORTANT: the tidyverse makes doing this
# type of analysis even easier.  It's still
# important to understand the "standard way"
# to work with data frames, but we'll go
# over examples with the tidyverse in the
# workshop.