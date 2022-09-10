# ---- Setup ----
# packages
library(here)
library(readr)
library(dplyr)
library(englelab)    # for data cleaning functions
library(tidyr)       # for pivot_wider. delete if not using
library(psych)       # for cronbach's alpha. delete if not using

# directories
import_dir <- "data/raw"
output_dir <- "data/scored"

# file names
task <- "taskname"
import_file <- paste(task, "raw.csv", sep = "_")
output_file <- paste(task, "Scores.csv", sep = "_")

## data cleaning parameters
outlier_cutoff <- 3.5
# ---------------

# ---- Import Data ----
data_import <- read_csv(here(import_dir, import_file))
# ---------------------

# ---- Score Data ----
data_scores <- data_import %>%
  filter() %>%
  group_by() %>%
  summarise()
# --------------------

# ---- Clean Data ----
data_cleaned <- data_scores %>%
  remove_problematic(filter = "",
                     log_file =
                       here(output_dir, "logs",
                            paste(task, "_problematic.csv", sep = ""))) %>%
  replace_outliers(variables = c(),
                   cutoff = outlier_cutoff,
                   with = "NA",
                   log_file =
                     here(output_dir, "logs",
                          paste(task, "_outliers.csv", sep = ""))) %>%
  filter(!is.na())
# --------------------

# ---- Calculate Reliability ----
reliability <- data_import %>%
  filter(Subject %in% data_cleaned$Subject)

splithalf <- reliability %>%
  group_by(Subject) %>%
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

data_cleaned$splithalf <- splithalf$r
# ^ the column name in data_cleaned should include the task name
# e.g., data_cleaned$taskname_splithalf

cronbachalpha <- reliability %>%
  select(Subject, Trial, Accuracy) %>%
  pivot_wider(id_cols = "Subject",
              names_from = "Trial",
              values_from = "Accuracy") %>%
  select(-Subject) %>%
  alpha()

data_cleaned$cronbachalpha <- cronbachalpha$total$std.alpha
# ^ the column name in data_cleaned should include the task name
# e.g., data_cleaned$taskname_cronbachalpha
# -------------------------------

# ---- Output ----
write_csv(data_cleaned, here(output_dir, output_file))
# ----------------

rm(list = ls())