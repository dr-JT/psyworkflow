#### Setup ####
## Load Packages
library(here)
library(readr)
library(dplyr)

## Set Import/Output Directories
import_dir <- "data/raw/messy"
output_dir <- "data/raw"

## Set Import/Output File Names
task <- "taskname"
import_file <- paste(task, ".txt", sep = "")
output_file <- paste(task, "raw.csv", sep = "_")
################

#### Import Data ####
data_import <- read_delim(here(import_dir, import_file),
                          "\t", escape_double = FALSE, trim_ws = TRUE)
#####################

#### Tidy Raw Data ####
data_raw <- data_import %>%
  filter() %>%
  rename() %>%
  mutate() %>%
  select()
#######################

#### Output ####
write_csv(data_raw, here(output_dir, output_file))
################

rm(list=ls())
