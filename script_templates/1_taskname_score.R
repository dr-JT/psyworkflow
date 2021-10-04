#### Setup ####
## Load Packages
library(here)
library(readr)
library(dplyr)

## Set Import/Output Directories
import_dir <- "Data Files/Raw Data"
output_dir <- "Data Files/Scored Data"

## Set Import/Output File Names
task <- "taskname"
import_file <- paste(task, "raw.csv", sep = "_")
output_file <- paste(task, "Scores.csv", sep = "_")

## Set Data Cleaning Parameters

###############

#### Import Data ####
data_import <- read_csv(here(import_dir, import_file))
#####################

#### Score Data ####
data_scores <- data_import %>%
  filter() %>%
  group_by() %>%
  summarise()
####################

#### Clean Data ####

####################

#### Calculate Reliability ####

###############################

#### Output ####
write_csv(data, here(output_dir, output_file))
################

## << Log is optional - delete if not using >> ##

## Create Log ####
log_header <- paste("===== TASKNAME: 1_SCRIPTNAME_score.R =====\n\n",
                    format(Sys.Date(), "%B %d %Y"), sep = "")
log_init_n <- paste("\n-- Initial subject count: ",
                    length(unique(data_import$Subject)), "--\n", sep = "")
log_remove <- paste("\n-- Number of problematic subjects removed: ",
                    length(unique(data_remove$Subject)), " --\n", sep = "")
log_outlier <- paste("\n-- Number of outliers removed: ",
                     length(unique(data_outliers$Subject)), " --\n", sep = "")
log_final_n <- paste("\n-- Final subject count: ",
                     length(unique(data_scores$Subject)), "--\n", sep = "")
log_footer <- "\n==================================================\n"

sink(file = here(output_dir, "log.txt"), append = TRUE, split = TRUE)
cat(log_header, log_init_n,
    log_remove, kable(data_remove, digits = 2, format = "markdown"),
    log_outlier, kable(data_outliers, digits = 2, format = "markdown"),
    log_final_n, log_footer, fill = TRUE)
sink()
##################

rm(list=ls())
