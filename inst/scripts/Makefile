#
# Makefile for jupyter notebook production for YESCDS
# also run make gupdate to get all png or jpg files into ../ipynb folder
#
# USAGE: 
#   make prepare
#   make gupdate
#   make
#

default:
	mkdir -p pub_files
	ls ../../vignettes | grep ".Rmd" | sed "s/.Rmd//" | xargs -i bash -c "cp ../../vignettes/{}.Rmd ./ && R -e \"AnVILPublish::as_notebook('{}.Rmd', namespace='use-strides', name='{}.ipynb', update=FALSE)\" && cp {}.ipynb ../ipynb && mv {}.* pub_files/"

gupdate:
	rm -r ../ipynb/images && cp -r ../../vignettes/images ../ipynb/

prepare:
	cp ../../vignettes/*Rmd .
	mkdir -p publish_files
