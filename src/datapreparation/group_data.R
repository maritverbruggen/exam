library(dplyr)
library(reshape2)


######################
#### GROUP DATA ######
######################

df_merged <- read.csv("../../gen/datapreparation/input/df_merged.csv")
# convert date column
df_merged$date <- as.Date(df_merged$date)

# group the number of reviews by month and neighborhood.
df_grouped <- df_merged %>%
  mutate(month = format(date, "%m"), year = format(date, "%Y")) %>%
  group_by(year, month, neighbourhood) %>%
  summarise(num_reviews = n())

# create date column
df_grouped$date <- as.Date(paste0(df_grouped$year, "-", df_grouped$month, "-01"))

#save df_grouped 
dir.create('../../gen/datapreparation/output/', recursive = T)
write.csv(df_grouped, "../../gen/datapreparation/output/df_grouped.csv", row.names = FALSE)
