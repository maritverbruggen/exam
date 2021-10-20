INPUT = ../../gen/analysis/input
RESULT = ../../gen/analysis/output

all: $(INPUT)/pivot_table.csv $(RESULT)/plot.pdf $(RESULT)/plot_all.pdf

 $(INPUT)/pivot_table.csv: create_pivot_table.R
	R --vanilla < create_pivot_table.R

$(RESULT)/plot.pdf: plot_data.R
	R --vanilla < plot_data.R

$(RESULT)/plot_all.pdf: plot_data_all.R
	R --vanilla < plot_data_all.R

