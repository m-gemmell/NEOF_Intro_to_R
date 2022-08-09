#Kaggle page
#https://www.kaggle.com/datasets/kyleahmurphy/nass-honey-bee-20152021?select=NASS_Bee-Colony_2015-2021.csv

#Libraries
library("tidyverse")

#Read in file
df <- read.csv(file = "NASS_Bee-Colony_2015-2021.csv",
               check.names=FALSE)
#Keep only 4 States
#states_to_keep <- sample(unique(df$State), size = 4)
#save(states_to_keep, file = "states_to_keep")
load("states_to_keep")

#Subset df
df <- df[df$State %in% states_to_keep,]

#Keep states, starting colonies, and year column
df <- df[,c("State", "Year", "Starting Colonies")]
#Convert to wide table
df_wide <- spread(df, State, `Starting Colonies`)
#Missing data in 2019 so we will only keep the 2015-2018 info
df_wide <- df_wide[1:16,]

#Save file
write.table(df_wide, file = "honey_bee.tsv", 
            sep = "\t", quote = FALSE, row.names = FALSE)

## Uk retail solution
#Read in file
bee_colonies_df <- read.csv("Chapter_8_files/honey_bee.tsv", 
                         sep = "\t", row.names = 1, check.names = FALSE)
#
#Can index to get the desired columns
bee_colonies_2017_2018_df <- bee_colonies_df[9:16,]
#Alternatively the tail() function can be used
#It is like head() but will get lowest rows
bee_colonies_2017_2018_df <- tail(bee_colonies_df, n = 8)
#
paste("The number of colonies in Minnesota for", row.names(bee_colonies_2017_2018_df),
      "was", bee_colonies_2017_2018_df$Minnesota, 
      sep = " ")
#Do not include total row
bee_colonies_2017_2018_df["Average",] <- colMeans(bee_colonies_2017_2018_df)
#
write.table(uk_retail_2020_df, "Chapter_8_files/UK_retail_2020.tsv", 
            sep = "\t", col.names = NA, quote = FALSE)

