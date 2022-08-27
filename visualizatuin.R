seoul_bike_sharing <- "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0321EN-SkillsNetwork/labs/datasets/seoul_bike_sharing.csv" 

download.file(seoul_bike_sharing , destfile = "seoul_bike_sharing.csv")

seoul_bike_df <- read.csv(seoul_bike_sharing)

head(seoul_bike_df)

seoul_bike_df <- seoul_bike_df %>%
      mutate(DATE = as.Date(DATE, formart="%d/%m/%Y"))

DATE <- as.Date(seoul_bike_df$DATE)
DATE <- format(seoul_bike_df$DATE, format="%d/%m/%Y")
DATE


HOUR <- factor(seoul_bike_df$HOUR)
hour

str(seoul_bike_df)

sum(is.na(seoul_bike_df))

summary(seoul_bike_df)
