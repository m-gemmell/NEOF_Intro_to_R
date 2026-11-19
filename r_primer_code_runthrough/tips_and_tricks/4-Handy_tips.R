# Handy tips & tricks

# Wide vs long code ####
#Create a data frame called df
df <- data.frame(one = c(2,4,6), three = c(6,12,18), five = c(10,20,30), row.names = c("Two", "Four", "Six"))
#Create a data frame called beach_df_2
beach_df_2 <- data.frame(Crab = c(10,1,1,4), Oystercatcher = c(5,6,4,4), Sandpiper = c(1,1,2,3), Starfish = c(3,3,7,4), row.names = c("Formby","West Kirby","Crosby","New Brighton"))

#Create a data frame called df
df <- data.frame(one = c(2,4,6), 
                 three = c(6,12,18), 
                 five = c(10,20,30), 
                 row.names = c("Two", "Four", "Six"))
#Create a data frame called beach_df_2
beach_df_2 <- data.frame(Crab = c(10,1,1,4), 
                         Oystercatcher = c(5,6,4,4),
                         Sandpiper = c(1,1,2,3),
                         Starfish = c(3,3,7,4), 
                         row.names = c("Formby","West Kirby",
                                       "Crosby","New Brighton"))

# Multiplication table ####

#Vectors that will become columns
one <- 1:10
two <- one*2
three <- one+two
four <- seq(from = 4, to = 40, by = 4)
five <- (1:10)*5
six <- seq(from = 6, by = 6, length.out = 10)
seven <- one * (rep(x = 7, 10))
ate <- (1:80)[((1:80) %% 8) == 0]
nine <- one * (rep(x = 9, 10))
ten <- (seq(100,1000,100))/rep(10,10)
#Vector for row name
row_names <- c("one","two","three","four","five",
               "six","sefen","ate","nine","ten")
#Create data frame
multiplication_df <- data.frame(one, two, three,
                                four, five, six,
                                seven, ate, nine, ten,
                                row.names = row_names)

#Change the 8th column name ("ate") to "eight"
colnames(multiplication_df)[8] <- "eight"
#Change the 7th and 8th row names ("sefen" and "ate") to "seven" and "eight"
row.names(multiplication_df)[7:8] <- c("seven","eight")


# Tab complete ####

tea_df <- read.csv("tea_consumption.csv", check.names=FALSE)

english_df <- read.csv("english_speaking_population_of_countries.tsv", 
                       sep = "\t", 
                       row.names = 1,
                       check.names = FALSE)

# Tea ####

#Scalar string with mistake
sentence <- "The number 8 is spelt ate"
#gsub to print out line with mistake fixed
gsub(pattern = "ate", replacement = "eight", sentence)
#We can assign the scalar with the fix
sentence <- gsub(pattern = "ate", replacement = "eight", sentence)

#Vector with unwanted capital As
letter_vec <- c("A","Ab","Abc","Abcd")
#Replace pattern A with replacement a
letter_vec <- gsub(pattern = "A", replacement = "a", letter_vec)

#Vector with unwanted info after "_"
extra_info_vec <- c("A_some","B_nada","C_stuff","D_nill")
#Replace the _ and everything after it with nothing
#We signify this with ".*" 
#This means any character (.) repeated zero or more times (*)
gsub(pattern = "_.*", replacement = "", extra_info_vec)

#What if we use gsub() with numerics?
gsub(pattern = 5, replacement = 2, 1:20)
#The output will be strings!

#Create a column for lb (pound). We'll copy the KG_LB_annual_per_capita column
tea_df$lb <- tea_df$KG_LB_annual_per_capita
#For the lb column we'll replace the "_" and everything before it with nothing
tea_df$lb <- gsub(pattern = ".*_", replacement = "", tea_df$lb)

#Change the column name KG_LB_annual_per_capita to kg
colnames(tea_df)[3] <- "kg"
#For the kg column we'll replace the "_" and everything after it with nothing
tea_df$kg <- gsub(pattern = "_.*", replacement = "", tea_df$kg)

#Since the columns initially contained "_" they are string columns
#Check if this is correct with the str() function
str(tea_df)
#Change the kg and lb columns to numerics
tea_df$kg <- as.numeric(tea_df$kg)
tea_df$lb <- as.numeric(tea_df$lb)
#Check with str() to see if it is now numerics
str(tea_df)

fruit <- "Banono"
gsub(pattern = "no", replacement = "na", fruit)

fruit <- "Banono"
sub(pattern = "no", replacement = "na", fruit)

# English ####

english_df[is.na(english_df)] <- 0

#Create a vector of first language + additional language
english_total_vec <- english_df[,3] + english_df[,"As an additional language"]
#Compare the column of total english speakers against the vector we created above
#This will create a logical vector (TRUE or FALSE)
english_total_logical_vec <- 
  english_df$`Total English speakers` == english_total_vec
#Now create a new data frame by indexing the english_df rows by the logical vector
#This will mean all TRUE rows will be kept and all FALSE rows will not be kept
english_complete_datasets_df <- english_df[english_total_logical_vec,]
#Remove the vectors we do not need any more
rm(english_total_vec,english_total_logical_vec)

#Remove rows where total english speakers does not equal first language + additional language
english_complete_datasets_df_2 <- 
  english_df[
    (english_df$`As first language` + english_df$`As an additional language`) ==
      english_df$`Total English speakers`,
  ]

identical(english_complete_datasets_df,english_complete_datasets_df_2)

# Identical ####

identical(1,1)
identical(1,2)
identical("word","word")
identical("word","orb")
identical(1,"1")
identical("one",1)
identical(1:5,1:5)
identical(1:5,6:9)
identical(1:5,1:6)
identical(c("a","b"),c("a","b"))
identical(c("a","b"),c("c","b"))
identical(c("a","b"),c("b","a"))
identical(english_df,english_df)
identical(english_df,tea_df)






