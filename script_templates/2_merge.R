#### Setup ####
## Load Packages
library(here)
library(datawrangling) # for files_join()
library(dplyr)
library(tidyr)

## Set Import/Output Directories
import_dir <- "data/scored"
output_dir <- "data"
output_scores <- "name_of_datafile.csv"
output_reliabilities <- "Reliabilities.csv"
################

#### Import Files ####
data_import <- files_join(here(import_dir), pattern = "Scores", id = "Subject")
######################

#### Select only important variables ####
data_scores <- data_import %>%
  select(Subject)

## Create list of final subjects
subj_list <- select(data_scores, Subject)
#################################################################

#### Get reliabilities ####
data_reliabilities <- data_import %>%
  select(contains("splithalf"), contains("cronbach_alpha")) %>%
  drop_na() %>%
  distinct() %>%
  pivot_longer(everything(),
               names_to = c("Task", "Metric"),
               names_sep = "_",
               values_to = "Estimate") %>%
  pivot_wider(id_cols = "Task",
              names_from = "Metric",
              values_from = "Estimate")
###########################

#### Output ####
write_csv(data_scores, here(output_dir, output_scores))
write_csv(data_reliabilities, here(output_dir, output_reliabilities))
write_csv(subj_list, here(output_dir, "subjlist_final.csv"))
################

rm(list=ls())
