## Data Analysis for StudyName


#################################################
#------ 1. "tidy" raw data to Scored data ------#
#################################################
write(paste("log: ", format(Sys.Date(), "%B %d %Y"), "\n", sep = ""),
      file = "Data Files/Scored Data/log.txt", append = FALSE)

source("R Scripts/1_taskname_score.R", echo=TRUE)

rm(list=ls())
#############################################################
#------ 2. Create Final Merged Data File for Analysis ------#
#############################################################

source("R Scripts/2_merge.R", echo=TRUE)

rm(list=ls())
###############################
#------ 3. Data Analysis ------#
###############################
library(rmarkdown)

render("R Scripts/3_MainAnalyses.Rmd",
       output_dir = "Results", 
       output_file = "MainAnalyses.html")

rm(list=ls())
#################################################


