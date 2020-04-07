#### Set up ####
## Load packages
library(here)
library(datawrangling) # to use files_join() and trim()
library(dplyr)

## Set import/output directories
import_dir <- "Data Files/Scored Data"
output_dir <- "Data Files"
output_file <- "name_of_datafile.csv"
################

#### Import Files ####
import <- files_join(here(import_dir), pattern = "Scores", id = "Subject")
######################

#### Select only important variables and trim outlier scores ####
data_merge <- import %>%
  select() %>%
  trim(variables = "all", cutoff = 3.5, id = "Subject")

## Create list of final subjects
subj.list <- select(data_merge, Subject)
#################################################################

#### Output ####
write_csv(data_merge, here(output_dir, output_file))
write_csv(subj.list, here(output_dir, "subjlist_final.csv"))
################

rm(list=ls())
