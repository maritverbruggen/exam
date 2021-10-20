library(dplyr)
library(reshape2)


######################
#### CLEAN DATA ######
######################

reviews <- read.csv("../../data/reviews.csv")
listings <- read.csv("../../data/listings.csv")

# convert date column
reviews$date <- as.Date(reviews$date)

# filter for reviews published since...
reviews_filtered <- reviews %>% filter(date > "2015-01-01")

# filter for `listings` that have received at least ... reviews.
listings_filtered <- listings %>% filter(number_of_reviews > 1)

# merge the `reviews` and `listings` dataframes on a common columns (the type of join doesn't really matter since we already filtered out listings without any reviews)
df_merged <- reviews_filtered %>% 
  inner_join(listings_filtered, by = c("listing_id" = "id"))

dir.create('../../gen/datapreparation/input', recursive = T)
write.csv(df_merged, "../../gen/datapreparation/input/df_merged.csv", row.names = FALSE)

