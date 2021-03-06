library(dplyr)
library(tidyverse)
library(ggplot2)
library(reshape2)
##############
### PLOT  ####
##############

#load pivot table 
df_pivot <- read.csv("../../gen/analysis/input/df_pivot.csv")
# convert the `date` column into date format.
df_pivot$date <- as.Date(df_pivot$date)
View(df_pivot)
dir.create("../../gen/analysis/output")
pdf("../../gen/analysis/output/plot.pdf")
plot(x = df_pivot$date, 
     y = df_pivot$`la.Barceloneta`, 
     col = "red", 
     type = "l", 
     xlab = "",
     ylab = "Total number of reviews", 
     main = "Effect of COVID-19 pandemic\non Airbnb review count")

lines(df_pivot$date, df_pivot$`Porta`, col="blue")
lines(df_pivot$date, df_pivot$`Navas`, col="green")

legend("topleft", c("La Barceloneta", "Porta", "Navas"), fill=c("red", "blue", "green"))
dev.off()
