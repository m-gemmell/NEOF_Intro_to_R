#
#
#
#
#
#
library("knitr")
library(kableExtra)
english_df <- read.csv("english_speaking_population_of_countries.txt", 
                   sep = "\t", 
                   row.names = 1,
                   check.names = FALSE)
english_df[is.na(english_df)] <- 0
english_complete_datasets_df <- 
  english_df[
    (english_df$`As first language` + english_df$`As an additional language`) ==
      english_df$`Total English speakers`,
    ]
english_100mil_df <- english_complete_datasets_df[english_complete_datasets_df$`Eligible population` > 100000000,]
english_100mil_df$`Fraction of population that are English speakers` <- 
  english_100mil_df$`Total English speakers` /
  english_100mil_df$`Eligible population`
english_100mil_df["Mean",] <- colMeans(english_100mil_df)
english_100mil_df["Total",1:4] <- colSums(english_100mil_df[1:7,1:4])
english_100mil_df["Total","Fraction of population that are English speakers"] <- 
  english_100mil_df["Total","Total English speakers"] /
  english_100mil_df["Total","Eligible population"]

kbl(english_100mil_df) %>%
  scroll_box(width = "100%")
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
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
```
#
#
#
#
#
#
english_100mil_df <- english_complete_datasets_df[
  english_complete_datasets_df$`Eligible population` > 100000000,
  ]
```
#
#
#
#
#
english_100mil_df$`Fraction of population that are English speakers` <- 
  english_100mil_df$`Total English speakers` /
  english_100mil_df$`Eligible population`
```
#
#
#
#
#
english_100mil_df["Mean",] <- colMeans(english_100mil_df)
```
#
#
#
#
#
#
english_100mil_df["Total",1:4] <- colSums(english_100mil_df[1:7,1:4])
```
#
#
#
#
#
#
#
english_100mil_df["Total","Fraction of population that are English speakers"] <- 
  english_100mil_df["Total","Total English speakers"] /
  english_100mil_df["Total","Eligible population"]
```
#
#
#
#
#
#
#
english_100mil_df["Total","Fraction of population that are English speakers"] <- 
  english_100mil_df["Total","Total English speakers"] /
  english_100mil_df["Total","Eligible population"]
```
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
write.table(x = english_100mil_df, 
            file = "Chapter_10-11/English_top_7_populated_countries.csv", 
            col.names=NA,
            quote = TRUE, 
            sep = ",")
```
#
#
#
#
