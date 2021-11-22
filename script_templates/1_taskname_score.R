#### Setup ####
## Load Packages
library(here)
library(readr)
library(dplyr)

## Set Import/Output Directories
import_dir <- "data/raw"
output_dir <- "data/scored"

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
data_remove <- data_scores %>%
  filter()

data_scores <- filter(data_scores, !(Subject %in% data_remove$Subject))

data_outliers <- data_scores %>%
  mutate() %>%
  filter()

data_scores <- filter(data_scores, !(Subject %in% data_outliers$Subject))
####################

#### Calculate Reliability ####
reliability <- data_import %>%
  filter(Subject %in% data_scores$Subject)

splithalf <- reliability %>%
  mutate(Trial = row_number(),
         Split = ifelse(Trial %% 2, "odd", "even")) %>%
  group_by(Subject, Split) %>%
  summarise() %>%
  ungroup() %>%
  pivot_wider(id_cols = "Subject",
              names_from = "Split",
              values_from = "") %>%
  summarise(r = cor(even, odd)) %>%
  mutate(r = (2 * r) / (1 + r))

data_scores$splithalf <- splithalf$r

cronbachalpha <- reliability %>%
  select(Subject, Trial, Accuracy) %>%
  pivot_wider(id_cols = "Subject",
              names_from = "Trial",
              values_from = "Accuracy") %>%
  select(-Subject) %>%
  alpha()

data_scores$cronbachalpha <- cronbachalpha$total$std.alpha
###############################

#### Output ####
write_csv(data, here(output_dir, output_file))
################

## << Report is optional - delete if not using >> ##

## Report ####
log_init_n <- paste("Initial subject count: ",
                    length(unique(data_import$Subject)), sep = "")
log_remove <- paste("Number of problematic subjects removed: ",
                    length(unique(data_remove$Subject)), sep = "")
log_outlier <- paste("Number of outliers removed: ",
                     length(unique(data_outliers$Subject)), sep = "")
log_final_n <- paste("Final subject count: ",
                     length(unique(data_scores$Subject)), sep = "")
cat(log_init_n, log_remove, log_outlier, log_final_n, fill = 1)

data_remove %>%
  kable(caption = "Problematic Subjects", digits = 2, format = "html") %>%
  kable_styling() %>%
  scroll_box(width = "100%")

data_outliers %>%
  kable(caption = "Outliers", digits = 2, format = "html") %>%
  kable_styling() %>%
  scroll_box(width = "100%")
##############

rm(list=ls())
