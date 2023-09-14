#' Download R Script Templates
#'
#' This function will download template scripts for data analysis in R
#' @param to a directory where to download R scripts.
#'     default: "R/templates".
#'     For analysis_script will change to "analyses/templates" if the "analyses
#'     folder exists.
#' @param overwrite Logical. Overwite any existing templates? default: FALSE
#' @param main_script Logical. Download a main script template to source all
#'     other R scripts?
#' @param raw_script Logical. Download template to convert a "messy" raw data
#'     file to a "tidy" raw data file? default = FALSE
#' @param score_script Logical. Download template to perform data cleaning and
#'     scoring on a "tidy" raw data file? default = FALSE
#' @param merge_script Logical. Download template to merge multiple scored data
#'     files? default = FALSE
#' @param analysis_script Logical. Download template to do data analysis (.Rmd)?
#'     default = FALSE
#' @param path String. working directory file path. Ignore...
#' @export
#'

get_template <- function(to = "R/templates", overwrite = FALSE,
                         main_script = FALSE, raw_script = FALSE,
                         score_script = FALSE, merge_script = FALSE,
                         analysis_script = FALSE,
                         path = "."){

  ## Setup ####
  to <- paste(path, to, sep = "/")
  github_repo <-
    "https://raw.githubusercontent.com/dr-JT/psyworkflow/main/script_templates/"

  if (!dir.exists(to)) dir.create(to, recursive = TRUE)
  #####

  ## Download Templates
  if (main_script == TRUE) {
    exists <- file.exists(paste(path, "mainscript.qmd", sep = "/"))
    if (exists == TRUE) {
      message("Did not download file. mainscript.qmd already exists")
    } else {
      download.file(paste(github_repo, "mainscript.qmd",
                          sep = ""),
                    paste(path, "mainscript.qmd", sep = "/"))
    }
  }

  if (raw_script == TRUE) {
    exists <- file.exists(paste(to, "1_taskname_raw.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. 1_taskname_raw.R already exists")
    } else {
      download.file(paste(github_repo, "1_taskname_raw.R",
                          sep = ""),
                    paste(to, "1_taskname_raw.R", sep = "/"))
    }
  }

  if (score_script == TRUE) {
    exists <- file.exists(paste(to, "2_taskname_score.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. 2_taskname_score.R already exists")
    } else {
      download.file(paste(github_repo, "2_taskname_score.R",
                          sep = ""),
                    paste(to, "2_taskname_score.R", sep = "/"))
    }
  }

  if (merge_script == TRUE) {
    exists <- file.exists(paste(to, "3_merge.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. 3_merge.R already exists")
    } else {
      download.file(paste(github_repo, "3_merge.R",
                          sep = ""),
                    paste(to, "3_merge.R", sep = "/"))
    }
  }

  if (analysis_script == TRUE) {
    if (dir.exists(paste(path, "analyses", sep = "/"))) {
      if (!dir.exists(paste(path, "analyses/templates", sep = "/"))) {
        dir.create(paste(path, "analyses/templates", sep = "/"), recursive = TRUE)
      }
      analysis_to <- paste(path, "analyses/templates", sep = "/")
    } else {
      analysis_to <- to
    }
    exists <- file.exists(paste(analysis_to, "Analysis_Template.qmd", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. Analysis_Template.qmd already exists")
    } else {
      download.file(paste(github_repo, "Analysis_Template.qmd",
                          sep = ""),
                    paste(analysis_to, "Analysis_Template.qmd", sep = "/"))
    }
  }

  #####
}
