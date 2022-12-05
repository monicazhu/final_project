FROM rocker/r-ubuntu

RUN apt-get update && apt-get install -y pandoc libcurl4-openssl-dev


RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('labelled')"
RUN Rscript -e "install.packages('gtsummary')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('rmarkdown')"

RUN mkdir /project
WORKDIR /project

RUN mkdir code
RUN mkdir output
RUN mkdir data
RUN mkdir report
COPY code code
COPY Makefile .
COPY README.md .
COPY project_dataset_report.Rmd .
COPY data/heart_failure_clinical_records_dataset.csv data

CMD make && mv project_dataset_report.html report

