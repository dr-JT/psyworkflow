# ---- Setup -------------------------------------------------------------------
# packages
library(here)
library(readr)
library(dplyr)
library(purrr)
library(tidyr)

# directories
import_dir <- "data/scored"
output_dir <- "data"

# file names
output_scores <- "TaskScores.csv"
# ------------------------------------------------------------------------------

# ---- Import Data -------------------------------------------------------------
files <- list.files(here(import_dir), pattern = "Scores", full.names = TRUE)
data_import <- files |>
  map(read_csv) |>
  reduce(full_join, by = "Subject")
# ------------------------------------------------------------------------------

# ---- Select Variables --------------------------------------------------------
data_scores <- data_import |>
  select(Subject) |>
  filter()

# list of final subjects
subjlist <- select(data_scores, Subject)
# ------------------------------------------------------------------------------

# ---- Save Data ---------------------------------------------------------------
write_csv(data_scores, here(output_dir, output_scores))
write_csv(subjlist, here(output_dir, "subjlist_final.csv"))
# ------------------------------------------------------------------------------

rm(list = ls())
