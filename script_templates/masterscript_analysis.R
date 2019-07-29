## Data Analysis for StudyName


#################################################
#------ 1. "tidy" raw data to Scored data ------#
#################################################
library(here)

source(here("R Scripts", "1_taskname_score.R"), echo=TRUE)

rm(list=ls())
#############################################################
#------ 2. Create Final Merged Data File for Analysis ------#
#############################################################
library(here)

source(here("R Scripts", "2_merge.R"), echo=TRUE)

rm(list=ls())
###############################
#------ 3. Data Analysis ------#
###############################
library(here)
library(markdown)

render(here("R Scripts", "3_MainAnalyses.Rmd"),
       output_dir = here("Results"), output_file = "MainAnalyses.html",
       params = list(data = here("Data Files", "Name_of_datafile.csv")))

rm(list=ls())
#################################################


