#Introduction to R Basics
#*********************************************

# Data types in R
# In addition to the below exercises, R swirl is helpful to learn R basics

# creating a numeric variable
my_numeric <- 42

# Creating a char variable
my_character <- "universe"

# Assigning my_logical to be FALSE
my_logical <- FALSE

# Understanding how arithmetic operations work in R

# An addition
5 + 5 

# A subtraction
5 - 5 

# A multiplication
3 * 5

# A division
(5 + 5) / 2 

# Exponentiation
2^5

# Modulo
28 %% 6

#***************************************

# Learning more about vectors

# Creating other types of vectors - i.e numeric, character and boolean
numeric_vector <- c(1, 10, 49)
character_vector <- c("a", "b", "c")

# Complete the code for boolean_vector
boolean_vector <-c(TRUE,FALSE,TRUE)


# Learning how to name a vector
#Creating a vector below
poker_vector <- c(140, -50, 20, -120, 240)

#function "names" helps to name it

names(poker_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# How to add two vectors
A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

# Take the sum of A_vector and B_vector
total_vector <- A_vector + B_vector

# Print out total_vector
total_vector
