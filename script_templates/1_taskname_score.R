#### Setup ####
## Load Packages
library(here)
library(readr)
library(dplyr)

## Set Import/Output Directories
import_dir <- "Data Files/Raw Data"
output_dir <- "Data Files/Scored Data"

## Set Import/Output Filenames
task <- "taskname"
import_file <- paste(task, "raw.csv", sep = "_")
output_file <- paste(task, "Scores.csv", sep = "_")

## Set Data Cleaning Params

###############

#### Import ####
data_import <- read_csv(here(import_dir, import_file)) %>%
  filter()
################

#### Score Data ####
data_scores <- data_import %>%
  group_by() %>%
  summarise()
####################

#### Clean Data ####

####################

#### Calculate Reliability ####

###############################

#### Output ####
write_csv(data_scores, here(output_dir, output_file))
################

rm(list=ls())
