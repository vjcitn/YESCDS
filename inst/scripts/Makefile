#
# Makefile for jupyter notebook production for YESCDS
# assumes contents of $(notebooks) generated from Rmd in ../../vignettes
# also run make gupdate to get all png or jpg files into ../ipynb folder
#
# USAGE: 
#   make prepare
#   make gupdate
#   make
#

notebooks: A1_cancer_table.ipynb A2_rates.ipynb A3_monitoring.ipynb A4_interactive_tables.ipynb \
	A5_data_graphics.ipynb A6_standardization.ipynb \
	B1_global.ipynb B2_table_plus_geo.ipynb B3_counties.ipynb C1_body_overall.ipynb \
	C2_variation_survival.ipynb \
	C3_subtypes_molecular.ipynb \
	D1_clin_trial_concepts.ipynb \
	D2_equipoise.ipynb \
	D3_randomization_bias.ipynb \
	D4_comparing_trt.ipynb


%.ipynb : %.Rmd
	R -e 'AnVILPublish::as_notebook("$<", namespace="use-strides", name="$@", update=FALSE)'
	cp $@ ../ipynb

gupdate:
	cp ../../vignettes/*jpg ../../vignettes/*png ../ipynb

prepare:
	-mkdir /tmp/dumpst
	-mv *.Rmd *.md *ipynb /tmp/dumpst
	cp ../../vignettes/*Rmd .
