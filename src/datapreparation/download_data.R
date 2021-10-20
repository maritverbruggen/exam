library(dplyr)
library(reshape2)

######################
### DOWNLOAD DATA ####
######################

download_data <- function(url, filename){
  download.file(url = url, destfile = paste0(filename, ".csv"))
}

url_listings <- "http://data.insideairbnb.com/spain/catalonia/barcelona/2021-09-10/visualisations/listings.csv"
url_reviews <- "http://data.insideairbnb.com/spain/catalonia/barcelona/2021-09-10/visualisations/reviews.csv"

dir.create('../../data', recursive = T)
download_data(url_listings, "../../data/listings")
download_data(url_reviews, "../../data/reviews")
