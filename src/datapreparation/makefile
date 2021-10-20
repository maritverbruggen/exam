INPUT = ../../gen/datapreparation/input
OUTPUT = ../../gen/datapreparation/ouput
DATA = ../../data

all: $(DATA)/listings.csv $(DATA)/reviews.csv $(INPUT)/merged_df.csv $(OUTPUT)/grouped_df.csv

$(DATA)/listings.csv $(DATA)/reviews.csv: download_data.R
	R --vanilla < download_data.R

$(INPUT)/merged_df.csv: merge_data.R
	R --vanilla < merge_data.R

$(OUTPUT)/grouped_df.csv: group_data.R
	R --vanilla < group_data.R
