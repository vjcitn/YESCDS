#
# Makefile for jupyter notebook production for YESCDS
# assumes contents of $(notebooks) generated from Rmd in ../../vignettes
# also run make gupdate to get all png or jpg files into ../ipynb folder
#

notebooks: A1_cancer_table.ipynb A2_rates.ipynb A3_monitoring.ipynb A4_interactive_tables.ipynb \
	A5_data_graphics.ipynb A6_standardization.ipynb \
	B1_global.ipynb B2_table_plus_geo.ipynb B3_counties.ipynb

%.Rmd :
	cp ../../vignettes/$@ .

%.ipynb : %.Rmd
	R -e 'AnVILPublish::as_notebook("$<", namespace="use-strides", name="$@", update=FALSE)'
	cp $@ ../ipynb

gupdate:
	cp ../../vignettes/*jpg ../../vignettes/*png ../ipynb

