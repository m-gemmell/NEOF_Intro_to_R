# Exercise 1 ####

# Operators
## Basic arithmetic
2+2
7-7
10/5
3*3
6+2+4
8-1-3
## BODMAS
3 + 2 * 2/5
((3+2) * 2) / 5
3 - 2*4 + 1
(3-2) * (4+1)
3 * 3/2 * 2 - 1
(3*3) / ((2*2) - 1)

# Variables
## Roman numeral examples
bakers_dozen <- 13
kilobyte <- 1024
I <- 1
II <- I + 1
V <- 7 - II
X <- (II / I) * V
L <- X * V
## Printing out variables
L

# Exercise 2 ####
# df
One <- c(2,4,6)
Three <- c(6,12,18)
Five <- c(10,20,30)
row_names <- c("Two", "Four", "Six")

df <- data.frame(One,Three,Five)

row.names(df) <- row_names

df <- data.frame(One,Three,Five, row.names = row_names)

# beach_df_2
Crab <- c(10,1,1,4)
Oystercatcher <- c(5,6,4,4)
Sandpiper <- c(1,1,2,3)
Starfish <- c(3,3,7,4)
row_names_2 <- c("Formby","West Kirby","Crosby","New Brighton")

beach_df_2 <- data.frame(Crab,Oystercatcher,Sandpiper,Starfish)
row.names(beach_df_2) <- row_names_2

beach_df_2 <- data.frame(Crab,Oystercatcher,Sandpiper,Starfish, row.names = row_names_2)

# Files & subsetting exercises

# Bat roosts ####
#1
bat_df <- read.csv("bats_and_bees/bat_roosts.csv", 
                   row.names = 1, check.names = FALSE)
#2
str(bat_df)
#3
bat_df["UK",] <- colSums(bat_df) 
#4
bat_df[,"Regions"] <- rowSums(bat_df)
#5
bat_t_df <- as.data.frame(t(bat_df))
#6
write.table(bat_t_df, file = "bats_and_bees/bat_roosts_t.csv", 
            sep = ",", quote = FALSE, col.names = NA)

#Question 1: Which region has no roosts?
col_names_logical_vec <- bat_t_df["Regions",] == 0
colnames(bat_t_df)[col_names_logical_vec]

#Question 2: Which region has the largest amount of Myotis brandtii roosts?
species <- "Myotis brandtii"
df_wo_total_species_and_uk <- bat_t_df[
  1:(nrow(bat_t_df)-1),1:(ncol(bat_t_df)-1)]
max_colonies <- max(df_wo_total_species_and_uk[species,])
col_names_logical_vec <- df_wo_total_species_and_uk[species,] == max_colonies
colnames(df_wo_total_species_and_uk)[col_names_logical_vec]

#Question 3: Which Bat species has the highest number of roosts across the UK?
max_uk <- max(bat_t_df[1:(nrow(bat_t_df)-1),"UK"])
row_names_logical_vec <- bat_t_df$UK == max_uk
row.names(bat_t_df)[row_names_logical_vec]

#Question 4: Which Bat species has the lowest number of roosts across the UK?
min_uk <- min(bat_t_df[1:(nrow(bat_t_df)-1),"UK"])
row_names_logical_vec <- bat_t_df$UK == min_uk
row.names(bat_t_df)[row_names_logical_vec]

# Honey bee colonies ####
#1
bee_colonies_df <- read.csv("bats_and_bees/honey_bee.tsv", 
                            sep = "\t", row.names = 1, check.names = FALSE)
#2
#Can index to get the desired columns
bee_colonies_2017_2018_df <- bee_colonies_df[9:16,]
#Alternatively the tail() function can be used
#It is like head() but will get lowest rows
bee_colonies_2017_2018_df <- tail(bee_colonies_df, n = 8)
#3
paste("The number of colonies in Minnesota for", 
      row.names(bee_colonies_2017_2018_df),
      "was", bee_colonies_2017_2018_df$Minnesota, 
      sep = " ")
#4
bee_colonies_2017_2018_df["Average",] <- colMeans(bee_colonies_2017_2018_df)
#5
write.table(bee_colonies_2017_2018_df, 
            "bats_and_bees/bee_colonies_2017_2018.tsv", 
            sep = "\t", col.names = NA, quote = FALSE)

#Question 1: Which state has the lowest average?
min_average <- min(bee_colonies_2017_2018_df["Average",])
states <- colnames(bee_colonies_2017_2018_df)
min_average_state <- states[
  bee_colonies_2017_2018_df["Average",] == min_average]
min_average_state

#Question 2: Which state has the highest minimum value of colonies?
bee_summary <- summary(bee_colonies_2017_2018_df[1:8,])
bee_summary

#Question 3: Which state had 20,000 colonies in Q3 of 2018 (2018-Q3)?
n <- 20000
column_logical_vec <- bee_colonies_2017_2018_df["2018-Q3",] == n
column_logical_vec
colnames(bee_colonies_2017_2018_df)[column_logical_vec]

# Tips ####
# Tea ####

tea_df <- read.csv("tips_and_tricks/tea_consumption.csv", check.names=FALSE)
tea_df$lb <- tea_df$KG_LB_annual_per_capita
tea_df$lb <- gsub(pattern = ".*_", replacement = "", tea_df$lb)
colnames(tea_df)[3] <- "kg"
tea_df$kg <- gsub(pattern = "_.*", replacement = "", tea_df$kg)
tea_df$kg <- as.numeric(tea_df$kg)
tea_df$lb <- as.numeric(tea_df$lb)

countries <- c("Ireland", "United Kingdom", "France", "Australia")

row.names(tea_df) <- tea_df$Country

tea_df_subset <- tea_df[countries,]

tea_df_subset$kg <- round(x = tea_df_subset$kg, digits = 1)

paste0(tea_df_subset$Country, " is the number ", 
       tea_df_subset$Rank, " consumer of tea. It consumes ", 
       tea_df_subset$kg, "kg of tea annually per capita.")

# English ####

english_df <- read.csv(
  "tips_and_tricks/english_speaking_population_of_countries.tsv", 
  sep = "\t", 
  row.names = 1,
  check.names = FALSE)
english_df[is.na(english_df)] <- 0
english_complete_datasets_df <- 
  english_df[
    (english_df$`As first language` + english_df$`As an additional language`) ==
      english_df$`Total English speakers`,
  ]

english_100mil_df <- english_complete_datasets_df[
  english_complete_datasets_df$`Eligible population` > 100000000,
]

english_100mil_df$`Fraction of population that are English speakers` <- 
  english_100mil_df$`Total English speakers` /
  english_100mil_df$`Eligible population`

english_100mil_df["Mean",] <- colMeans(english_100mil_df)

english_100mil_df["Total",1:4] <- colSums(english_100mil_df[1:7,1:4])

english_100mil_df["Total","Fraction of population that are English speakers"] <- 
  english_100mil_df["Total","Total English speakers"] /
  english_100mil_df["Total","Eligible population"]

write.table(x = english_100mil_df, 
            file = "tips_and_tricks/English_top_7_populated_countries.csv", 
            col.names=NA,
            quote = TRUE, 
            sep = ",")
