
#Data from
#https://www.kaggle.com/code/jonathanbouchet/biodiversity-in-us-national-parks-2016/data
#Analysis help
# https://www.kaggle.com/code/jonathanbouchet/biodiversity-in-us-national-parks-2016/report

#libraries
library("tidyverse")

# Read in data

species<-read.csv('species.csv',sep=',')
parks<-read.csv('parks.csv',sep=',')
colnames(species)

#merge dfs
status<-function(x){
  if(x==''){return('Safe')}
  else {return(as.character(x))}
}
species$Status<-sapply(species$Conservation.Status,status)
merged<-merge(species, parks,by="Park.Name")
head(merged)

#Distribuiton of species per park and status
Cat2<-as.data.frame(merged %>% 
                      dplyr::group_by(Category,Park.Name, Park.Code, State) %>% 
                      dplyr::summarise(number = n()) %>% 
                      arrange(-number))

#Now to do some of my own stuff
#Covert from long to wide so one column per category
df <- spread(Cat2, Category, number, )
#convert na to 0
df[is.na(df)] <- 0
#Remove some unwanted columns
df <- df[,c(2,1,3,5,6,8,10,12,14)]
#change columns names
colnames(df)[1:2] <- c("Park code", "Park name")

#Change occurences of "," in stae column
df$State <- gsub(pattern = ",", " &", x= df$State)

#Write as csv file
write.table(df, file="parks_biodiveristy.csv",
          sep = ",", quote = FALSE, row.names = FALSE)

