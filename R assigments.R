
library(tidyverse)

url <- "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0321EN-SkillsNetwork/labs/datasets/raw_bike_sharing_systems.csv"
download.file(url, destfile = "raw_bike_sharing_systems.csv")

# Download raw_cities_weather_forecast.csv
url <- "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0321EN-SkillsNetwork/labs/datasets/raw_cities_weather_forecast.csv"
download.file(url, destfile = "raw_cities_weather_forecast.csv")

# Download raw_worldcities.csv
url <- "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0321EN-SkillsNetwork/labs/datasets/raw_worldcities.csv"
download.file(url, destfile = "raw_worldcities.csv")

# Download raw_seoul_bike_sharing.csv
url <- "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0321EN-SkillsNetwork/labs/datasets/raw_seoul_bike_sharing.csv"
download.file(url, destfile = "raw_seoul_bike_sharing.csv")


dataset_list <- c('raw_bike_sharing_systems.csv', 'raw_seoul_bike_sharing.csv', 'raw_cities_weather_forecast.csv', 'raw_worldcities.csv')
bike_sharing_df <- read_csv("raw_bike_sharing_systems.csv")
head(bike_sharing_df)
sub_bike_sharing_df <- bike_sharing_df %>% select(COUNTRY, City, SYSTEM, BICYCLES)

sub_bike_sharing_df %>% 
  summarize_all(class) %>%
  gather(variable, class)


find_character <- function(strings) grepl("[^0-9]", strings)
sub_bike_sharing_df %>% 
  select(BICYCLES) %>% 
  filter(find_character(BICYCLES)) %>%
  slice(0:10)


ref_pattern <- "\\[[A-z0-9]+\\]"
find_reference_pattern <- function(strings) grepl(ref_pattern, strings)


sub_bike_sharing_df %>% 
  select(COUNTRY) %>% 
  filter(find_reference_pattern(COUNTRY)) %>%
  slice(0:10)


sub_bike_sharing_df %>% 
  select(City) %>% 
  filter(find_reference_pattern(City)) %>%
  slice(0:10)


sub_bike_sharing_df %>% 
  select(SYSTEM) %>% 
  filter(find_reference_pattern(SYSTEM)) %>%
  slice(0:10)


remove_ref <- function(strings) {
  ref_pattern <- "Define a pattern matching a reference link such as [1]"
  # Replace all matched substrings with a white space using str_replace_all()
  str_replace_all(sub_bike_sharing_df,find_reference_pattern(City)," ")
  result <- str_replace_all(sub_bike_sharing_df,find_reference_pattern(SYSTEM)," ")
  # Trim the reslt if you want
  trim (result)
  # return(result)
  return(result)
  result %>% 
    select(City, SYSTEM, BICYCLES) %>% 
    filter(find_reference_pattern(City) | find_reference_pattern(SYSTEM) | find_reference_pattern(BICYCLES))
}

