# ---- Setup ----
# packages
library(here)
library(readr)
library(plyr)
library(dplyr)
library(tidyr)

# directories
import_dir <- "data/scored"
output_dir <- "data"

# file names
output_scores <- "name_of_datafile.csv"
output_reliabilities <- "Reliabilities.csv"
# ---------------

# ---- Import Data ----
files <- list.files(here(import_dir), pattern = "Scores", full.names = TRUE)
data_import <- files %>%
  lapply(read_csv) %>%
  join_all(by = "Subject", type = "full")
# ---------------------

# ---- Select Variables ----
data_scores <- data_import %>%
  select(Subject)

# list of final subjects
subj_list <- select(data_scores, Subject)
# --------------------------

# ---- Reliabilities ----
data_reliabilities <- data_import %>%
  select(contains("splithalf"), contains("cronbach_alpha")) %>%
  drop_na() %>%
  distinct() %>%
  pivot_longer(everything(),
               names_to = c("Task", "metric"),
               names_pattern = "(\\w+.\\w+).(\\w+)",
               values_to = "value") %>%
  pivot_wider(id_col = Task,
              names_from = metric,
              values_from = value)
# -----------------------

# ---- Save Data ----
write_csv(data_scores, here(output_dir, output_scores))
write_csv(data_reliabilities, here(output_dir, output_reliabilities))
write_csv(subj_list, here(output_dir, "subjlist_final.csv"))
# -------------------

rm(list = ls())
