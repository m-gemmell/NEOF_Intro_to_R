#Read in data
df <- read.csv("tea-consumption-by-country-2025.csv",
               sep = ",", check.names = FALSE)
#Read in old df
df_old <- read.csv("tea_consumption_old.csv",
                   sep = ",", check.names=FALSE)

#Library tidyverse
library("tidyverse")
#Edit df
tea_df <- df |>
  #Rename per capita column
  dplyr::rename(KG=TeaConsumptionAnnualPerCapita_2022) |>
  dplyr::rename(Country=country) |>
  #Select the 2 columns we want
  dplyr::select(Country, KG) |>
  #Arrange rows by capita KG tea usage
  dplyr::arrange(desc(KG))

#Add rank column
tea_df[,"Rank"] <- 1:nrow(tea_df)

tea_df <- tea_df |>
  #Move Rank column to first column
  dplyr::relocate(Rank) |>
  #Create column with LB values
  dplyr::mutate(LB = round(KG*2.20462, digits = 2)) |>
  #Unite KG and LB columns
  tidyr::unite("KG_LB_annual_per_capita", KG:LB, sep="_")

#Write out table
write.table(x = tea_df, file = "tea_consumption.csv", sep = ",", quote = FALSE, row.names = FALSE)
