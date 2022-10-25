#Final project organization and GitHub repository

> Organize the code for me final project and create a GitHub repository

------------------------------------------------------------------------

## Contents of the repository

`code/01_make_tables.R`

  - read dataset from a .csv file
  - saves data as a `.rds` object in `output/` folder
  - create tabular analysis

`code/02_make_figures.R`

  - load dataset
  - create graphical analysis


`code/03_render_report.R`

  - renders `report.Rmd`

`project_dataset_report.Rmd`

  - reads tables generated by `code/01_make_tables.R`
  - reads figures generated by `code/02_make_figures.R`
  - makes report with explanations of the results
  - The report basically has two parts: tabular analysis and graphical analysis. From the tabular analysis, we can see      that the percentages of hypertension and Anaemia are both higher in elder age group, while such difference is only      statistically significant for Anaemia characteristics (p-value<0.05). From the graphical analysis, there is no          substantial trend between age and platetes.
  
------------------------------------------------------------------------  
