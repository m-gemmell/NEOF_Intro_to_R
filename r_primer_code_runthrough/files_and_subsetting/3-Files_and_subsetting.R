# Files and subsetting
# Reading ####

liv_beaches_df <- read.csv("Liverpool_beaches.csv")

liv_beaches_df <- read.csv("Liverpool_beaches.csv", row.names = 1)

global_eco_footprint_df <- read.csv("Global_eco_footprint.tsv", 
                                 row.names = 1, sep = "\t")

global_eco_footprint_df <- read.csv("Global_eco_footprint.tsv", 
                                    row.names = 1, sep = "\t", 
                                    check.names = FALSE)

# Vector subsetting ####

even_seq <- seq(from = 0, to = 8, by = 2)
odd_seq <- seq(from = 1, to = 9, by = 2)
long_seq <- seq(from = 10, to = 300, by = 10)

even_seq[2]
odd_seq[1]
long_seq[10]
even_seq[2:3]
odd_seq[1:4]
long_seq[21:24]
long_seq[24:21]
even_seq[c(2,3)]
odd_seq[c(1,3,2,5)]
long_seq[c(1,21,21:24,24:21,1)]
#As long as the contents within the [] equal numbers they will work
even_seq[seq(from = 1, to = 3, by = 2)]
even_seq[seq(from = 0, to = 5, by = 3)]
long_seq[seq(from = 1, to = 19, by = 2)]
even_seq[1*2]
odd_seq[2/1]
long_seq[(1:10)*2]

even_seq[6]
even_seq[c(4,7)]
odd_seq[3:9]

#Will give NA
1 + NA
2 - NA
even_seq[2] * NA
odd_seq[5] / NA
#mean() function without NA
mean(even_seq[2:5])
#mean() function with NA
mean(c(1,2,3,4,5,NA))
mean(even_seq[2:7])

even_seq[-2]
odd_seq[-3:-5]
long_seq[c(-1,-2,-6)]

#Replicate vector even_seq 2 times
rep(x = even_seq, 2)
#Replicate vector even_seq 4 times and then assign even_seq as the newly created vector
even_seq <- rep(x = even_seq, 4)
#More examples
odd_seq <- rep(x = odd_seq, 4)
long_seq <- rep(x = long_seq, 3)

even_seq > 3
even_seq[even_seq  > 2]
odd_seq[odd_seq <= 1 ]
long_seq <- long_seq[long_seq < 50]
long_seq

#First some basic modulus examples
2%%2
3%%2
#Create a vector with numbers 0 to 9
single_digit_vec <- 0:9
#Extract even numbers then odd numbers from the vector
#We carry this out by determining if numbers are divisible by 2 or not
even_seq <- single_digit_vec[(single_digit_vec %% 2) == 0 ]
odd_seq <- single_digit_vec[(single_digit_vec %% 2) != 0]
#We can determine which numbers in a vector are divisible by any specific number
#Divisible by 3
#remember variable names cannot start with numbers
divis_3_vec <- single_digit_vec[(single_digit_vec %% 3) == 0]
#Divisible by 7
divis_7_vec <- single_digit_vec[(single_digit_vec %% 7) == 0]
#Try out other numbers!

# Data frame subsetting ####

#Read in the file
parks_df <- read.csv("parks_biodiveristy.csv", check.names = FALSE,
                     row.names = 1)
#View the resulting object
parks_df
#View its column names
colnames(parks_df)

#Scalar from the 1st row and 1st column
parks_df[1,1]
#Row names and column names can be used for indexing
#Scalar from the row called YOSE and the column called Amphibian
parks_df["YOSE","Amphibian"]
#More examples
parks_df[1:10,2]
parks_df[1:10,"State"]
parks_df[3,2:4]
parks_df["SAGU",2]
parks_df[1:10,"Bird"]
parks_df[c(1,3,5,6),c("Bird","Fish")]

#Return first 6 rows
head(parks_df)
#Return first 10 rows
head(parks_df, 10)

parks_df <- head(parks_df, 20)

parks_df[,]
parks_df[,2]
parks_df[3,]
parks_df[,"State"]
parks_df[2:4,]

parks_df$State
parks_df$Amphibian
parks_df$Fish

parks_df$State[2]
parks_df$Amphibian[2]
parks_df$Fish[4:7]

#Sum the values of a numeric vector
sum(parks_df$Mammal)
#Mean of the values of a numeric vector
mean(parks_df$Mammal)

#Sum numeric columns
colSums(parks_df[,3:6])
#Sum numeric rows
rowSums(parks_df[,4:5])
#Mean of numeric columns
colMeans(parks_df[,3:6])
#Mean of numeric rows
rowMeans(parks_df[,4:5])
#Summary information for each column
#This works for string and numeric columns with different outputs
summary(parks_df)

parks_df[3:5]
t(parks_df[,3:5])
summary(t(parks_df[,3:5]))

# Writing ####

parks_t_df <- parks_df

parks_t_df$Total_species <- rowSums(parks_df[,3:8])

#Transpose dataframe
parks_t_df <- t(parks_t_df[,3:9])
#Check structure
str(parks_t_df)
#It is not a dataframe
#Let us therefore convert it to a data frame
parks_t_df <- as.data.frame(parks_t_df)
#Structure check
str(parks_t_df)

write.table(parks_t_df, file = "Park_species_info.csv", sep = ",", col.names=NA)

#Read in
global_eco_footprint_df <- read.csv("Global_eco_footprint.tsv", 
                                    row.names = 1, sep = "\t", 
                                    check.names = FALSE)
#Transpose ensuring output is a data frame
global_eco_footprint_t_df <- as.data.frame(t(global_eco_footprint_df))

write.table(global_eco_footprint_t_df, 
            "Global_eco_footprint_transposed.tsv", 
            sep = "\t",  
            col.names=NA, 
            quote = FALSE)
