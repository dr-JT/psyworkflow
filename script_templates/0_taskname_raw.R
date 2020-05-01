#### Setup ####
## Load packages
library(here)
library(readr)
library(dplyr)

## Set Import/Output Directories
import_dir <- "Data Files/Merged"
output_dir <- "Data Files"

## Set Import/Output Filenames
task <- "taskname"
import_file <- paste(task, ".txt", sep = "")
output_file <- paste(task, "raw.csv", sep = "_")
################

#### Import ####
data_import <- read_delim(here(import_dir, import_file), "\t", 
                          escape_double = FALSE, trim_ws = TRUE,
                          guess_max = 10000)
################

#### Tidy raw data ####
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
