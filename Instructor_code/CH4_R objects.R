#4.2 Classes ####
##4.2.1 Numeric ####
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

#4.2.2 Logical ####
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

#4.2.3 String ####
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

"character" == "character"
"1066" != "character"
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

#4.4 Data structures ####
#4.4.2 Vectors & lists ####
number_vec <- c(1,2,4,8,16)
number_vec
number_series_vec <- 1:6
number_series_vec
animals <- c("Whale","Seal","Hedgehog","Mouse","Owl","Squirrel","Vole","Shrew")
animals

birds <- animals[5]
birds
aquatic <- animals[1:2]
aquatic
rodents <- animals[c(4,6,7)]
rodents
mammals <- animals[-5]
mammals

number_vec - 1
number_vec * 2
log(number_vec)
length(rodents)

mean(number_vec)
summary(number_vec)

aquatic == "Whale"
number_vec > 4
number_vec[number_vec > 4]

paste("Animals", animals)
bird_or_mammal <- c("mammal","mammal","mammal","mammal","bird","mammal","mammal","mammal")
paste(animals, bird_or_mammal, sep = ":")
paste(animals, " is a ", bird_or_mammal, sep = "")

#4.4.3 Data frames & Matrices ####
cars_info <- mtcars
rm(cars_info)

Crab <- c(10,1,1)
Oystercatcher <- c(5,6,4)
Starfish <- c(3,3,7)

#Using the function data.frame to create a data frame
beach_df <- data.frame(Crab,Oystercatcher,Starfish)

colnames(beach_df)
row.names(beach_df)

row.names(beach_df) <- c("Formby","West Kirby","Crosby")

