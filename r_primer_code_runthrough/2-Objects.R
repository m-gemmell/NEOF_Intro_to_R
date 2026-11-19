# Classes ####

#Numeric

#Class of 2
class(2)
#class of 3.14
class(3.14)
#class of 6
class(6)

#Creating a variable using the assignment operator
pie <- 3.14

#Printing out previously made variable as numeric, integer, and double
as.numeric(pie)
as.integer(pie)
as.double(pie)

#Checking the class of our variable
class(pie)
class(as.numeric(pie))
class(as.integer(pie))
class(as.double(pie))

#The R pi is equal to 3.141593
pi
#assign pi to 3.14
pi <- 3.14
#print out pi to see you have changed the variable's object
pi
#in this case if you want the original R pi object back, we can remove the one we made
rm(pi)
pi

#Logical
# 2 less than 4
2 < 4
# 2 greater than 4
2 > 4
# 2 less than or equal to 4
2 <= 4
# 2 greater than or equal to 4
2 >= 4
# 2 equal to 4
2 == 4
# 2 not equal to 4
2 != 4

#String
one_character_string <- "A"
one_character_string
word_string <- "alphabet"
word_string
long_string <- "Strings can be long and contain more than letters. \\.("
long_string

number_string <- "1066"
number_string
class(number_string)

number <- 1066
numeric_to_string <- as.character(number)
numeric_to_string
class(numeric_to_string)

#will get an error as strings and maths don't mix
"6" - 3
#will work as maths and numerics work
as.numeric("6") - 4
#Below will not work as only strings containing numbers can be converted to numeric
as.numeric("not_a_number_12")

# "character" the same as "character"
"character" == "character"
#"1066" not the same as "character"
"1066" != "character"
#"numeric" the same as "string"
"numeric" == "string"

paste("The following is a string:", long_string) 
paste(number_string, "and the", word_string)
#By default paste will put a space (sep = " ") between each string you provide
#You can use the sep option to specify your own
paste("However", " this is separated by a comma", sep = ",")
#Or you can make it so there is no separator
paste("no separator",numeric_to_string, sep = "")
#Alternatively you can use paste0()
#Where there is no separator by default (sep ="")
paste0("no separator",numeric_to_string)

# Data structures ####

# Scalar
#A number
1
#A string
"How long is a string?"
#A logical
TRUE

number_vec <- c(1,2,4,8,16)
number_vec
number_series_vec <- 1:6
number_series_vec
animals <- c("Whale","Seal","Hedgehog","Mouse","Owl","Squirrel","Vole","Shrew")
animals

#Fifth element
birds <- animals[5]
birds
#First to second element
aquatic <- animals[1:2]
aquatic
#Fourth, sixth, and seventh element
rodents <- animals[c(4,6,7)]
rodents
#All except the fifth element
mammals <- animals[-5]
mammals

#Minus 1 from all elements
number_vec - 1
#Multiple all elements by 2
number_vec * 2
#Log value of all elements
log(number_vec)
#The length of vector (i.e. the number of elements)
length(rodents)

mean(number_vec)
summary(number_vec)

#Provides vector of logical values for each element
aquatic == "Whale"
number_vec > 4
#Prints elements with values >4
number_vec[number_vec > 4]

paste("Animals", animals)
bird_or_mammal <- c("mammal","mammal","mammal","mammal","bird","mammal","mammal","mammal")
paste(animals, bird_or_mammal, sep = ":")
paste(animals, " is a ", bird_or_mammal, sep = "")

# Data frames & matrices
mtcars
cars_info <- mtcars
rm(cars_info)

Crab <- c(10,1,1)
Oystercatcher <- c(5,6,4)
Starfish <- c(3,3,7)

beach_df <- data.frame(Crab,Oystercatcher,Starfish)

colnames(beach_df)
row.names(beach_df)

row.names(beach_df) <- c("Formby","West Kirby","Crosby")
