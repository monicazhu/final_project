
#add correct file path
here::i_am(
  "code/01_make_tables.R"
)

#read data from CSV file
data <- read.csv(file = here::here("data/heart_failure_clinical_records_dataset.csv"))

#save the dataset as .rds file
saveRDS(
  data,
  file = here::here("output/data.rds")
)

#Characteristics of the `r nrow(data)` patients' information from the Heart Failure Prediction database are displayed
#in the table below.

library(labelled)
library(gtsummary)

var_label(data) <- list(
  age = "Age",
  anaemia = "Anaemia",
  creatinine_phosphokinase = "Level of the CPK enzyme",
  diabetes = "Diabetes",
  ejection_fraction = "Percentage of blood leaving the heart at each contraction",
  high_blood_pressure = "If the patient has hypertension",
  platelets = "Platelets in the blood",
  serum_creatinine = "Level of serum sodium in the blood",
  sex = "Woman or man",
  smoking = "If the patient smokes or not",
  time = "Follow-up period (days)",
  DEATH_EVENT = "If the patient deceased during the follow-up period"
)

data$age_group <- ifelse(data$age < 50, "< 50", ">= 50")

table_one <-data |>
  select("age", "high_blood_pressure", "anaemia", "age_group") |>
  tbl_summary(by = age_group) |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Age Group**") |>
  add_overall() |>
  add_p()


saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
)





