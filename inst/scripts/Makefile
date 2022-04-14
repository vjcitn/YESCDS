#A1_cancer_table.Rmd		MassachusettsCountiesMap.jpg	piecharts.jpg
#A2_rates.Rmd			SEERlist.jpg			rateOverview.jpg
#A3_monitoring.Rmd		colon.jpg			statesOverallMap.jpg

all: ../ipynb/A1_cancer_table.ipynb ../ipynb/A2_rates.ipynb ../ipynb/A3_monitoring.ipynb \
	../ipynb/SEERlist.jpg ../ipynb/piecharts.jpg ../ipynb/rateOverview.jpg ../ipynb/pancreas.jpg  \
	../ipynb/colon.jpg ../ipynb/colon8GroupIncidence.jpg

../ipynb/A1_cancer_table.ipynb: ../../vignettes/A1_cancer_table.Rmd
	R -e 'AnVILPublish::as_workspace("../../vignettes/A1_cancer_table.Rmd", namespace="use-strides", name="A1_cancer_table", update=FALSE)'
	mv ../../vignettes/A1_cancer_table.ipynb ../ipynb

../ipynb/A2_rates.ipynb: ../../vignettes/A2_rates.Rmd
	R -e 'AnVILPublish::as_workspace("../../vignettes/A2_rates.Rmd", namespace="use-strides", name="A2_rates", update=FALSE)'
	mv ../../vignettes/A2_rates.ipynb ../ipynb

../ipynb/A3_monitoring.ipynb: ../../vignettes/A3_monitoring.Rmd
	R -e 'AnVILPublish::as_workspace("../../vignettes/A3_monitoring.Rmd", namespace="use-strides", name="A3_monitoring", update=FALSE)'
	mv ../../vignettes/A3_monitoring.ipynb ../ipynb

../ipynb/SEERlist.jpg: ../../vignettes/SEERlist.jpg
	cp $< $@ 

../ipynb/piecharts.jpg: ../../vignettes/piecharts.jpg
	cp $< $@

../ipynb/rateOverview.jpg: ../../vignettes/rateOverview.jpg
	cp $< $@

../ipynb/pancreas.jpg: ../../vignettes/pancreas.jpg
	cp $< $@

../ipynb/colon.jpg: ../../vignettes/colon.jpg
	cp $< $@

../ipynb/colon8GroupIncidence.jpg: ../../vignettes/colon8GroupIncidence.jpg
	cp $< $@
