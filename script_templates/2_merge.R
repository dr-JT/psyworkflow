#### Setup ####
## Load Packages
library(here)
library(datawrangling) # to use files_join()
library(dplyr)

## Set Import/Output Directories
import_dir <- "Data Files/Scored Data"
output_dir <- "Data Files"
output_file <- "name_of_datafile.csv"
################

#### Import Files ####
data_import <- files_join(here(import_dir), pattern = "Scores", id = "Subject")
######################

#### Select only important variables and trim outlier scores ####
data_merge <- data_import %>%
  select()

## Create list of final subjects
subj_list <- select(data_merge, Subject)
#################################################################

#### Output ####
write_csv(data_merge, here(output_dir, output_file))
write_csv(subj_list, here(output_dir, "subjlist_final.csv"))
################

rm(list=ls())
