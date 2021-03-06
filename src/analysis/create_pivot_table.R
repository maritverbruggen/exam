library(dplyr)
library(tidyverse)
library(reshape2)
######################
# CREATE PIVOT TABLE #
######################

#load df_grouped file
df_grouped <- read.csv("../../gen/datapreparation/output/df_grouped.csv")
df_grouped$date <- as.Date(paste0(df_grouped$year, "-", df_grouped$month, "-01"))

# create pivot table
df_pivot <- df_grouped %>% dcast(date ~ neighbourhood, fun.aggregate = sum, value.var = "num_reviews")

#save df_pivot as file 
dir.create('../../gen/analysis/input/', recursive = T)
write.csv(df_pivot, "../../gen/analysis/input/df_pivot.csv")
