project_dataset_report.html: project_dataset_report.Rmd code/03_render_report.R make_tables make_figures
	Rscript code/03_render_report.R

make_tables:
	Rscript code/01_make_tables.R
	
make_figures:
	Rscript code/02_make_figures.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f *.html && rm -f output/*.png && rm -f report/*html

project_image:
	docker build -t project_image .
	touch $@

.PHONY: final_report
final_report: 
	docker run -v "$$(pwd)/report":/project/report monicazhu99/project_image
	

