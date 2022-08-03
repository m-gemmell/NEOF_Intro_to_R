#Read in file
df <- read.csv("countries.csv", check.names=FALSE, row.names = 1)
df <- df[,5:10]
#
colnames(df) <- c("1.Cropland Footprint","2.Grazing Footprint","3.Forest Footprint",
                  "4.Carbon Footprint","5.Fish Footprint","6.Total Ecological Footprint")
#write file
write.table(df, file = "Global_eco_footprint.tsv", sep="\t", 
            quote = FALSE, col.names = NA
            )
#Test to read
global_eco_footprint <- read.csv("Global_eco_footprint.tsv", 
                        row.names = 1, sep = "\t")
global_eco_footprint <- read.csv("Global_eco_footprint.tsv", row.names = 1, 
                        sep = "\t", check.names = FALSE)
