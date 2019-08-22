#' Download R Script Templates
#'
#' This function will download template scripts for data analysis in R
#' @param to a directory where to download R scripts.
#'     default: "R Scripts/templates"
#' @param overwrite Logical. Overwite any existing templates? default: FALSE
#' @param masterscript String. Which type of masterscript template to download.
#'     options: "data preparation" or "data analysis".
#' @param rawscript Logical. Download template to convert a "messy" raw data file
#'     to a "tidy" raw data file? default = FALSE
#' @param scorescript Logical. Download template to perform data cleaning and
#'     scoring (aggregate) on a "tidy" raw data file? default = FALSE
#' @param mergescript Logical. Download template to merge multiple scored data
#'     files? default = FALSE
#' @param path String. working directory file path. Ignore...
#' @export
#'

template <- function(to = "R Scripts/templates", overwrite = FALSE,
                     masterscript = NULL, rawscript = FALSE,
                     scorescript = FALSE, mergescript = FALSE,
                     path = "."){

  ## Setup ####
  to <- paste(path, to, sep = "/")
  github_repo <-
    "https://raw.githubusercontent.com/dr-JT/workflow/master/script_templates/"

  if (!dir.exists(to)) dir.create(to, recursive = TRUE)
  if (is.null(masterscript)) masterscript <- "none"
  #####

  ## Download Generic Templates
  if (masterscript == "data preparation") {
    exists <- file.exists(paste(path, "masterscript.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. masterscript.R already exists")
    } else {
      download.file(paste(github_repo, "masterscript_prep.R",
                          sep = ""),
                    paste(path, "masterscript.R", sep = "/"))
    }
  } else if (masterscript == "data analysis") {
    exists <- file.exists(paste(path, "masterscript.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. masterscript.R already exists")
    } else {
      download.file(paste(github_repo, "masterscript_analysis.R",
                          sep = ""),
                    paste(path, "masterscript.R", sep = "/"))
    }
  }

  if (rawscript == TRUE) {
    exists <- file.exists(paste(to, "0_taskname_raw.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. 0_taskname_raw.R already exists")
    } else {
      download.file(paste(github_repo, "0_taskname_raw.R",
                          sep = ""),
                    paste(to, "0_taskname_raw.R", sep = "/"))
    }
  }

  if (scorescript == TRUE) {
    exists <- file.exists(paste(to, "1_taskname_score.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. 1_taskname_score.R already exists")
    } else {
      download.file(paste(github_repo, "1_taskname_score.R",
                          sep = ""),
                    paste(to, "1_taskname_score.R", sep = "/"))
    }
  }

  if (mergescript == TRUE) {
    exists <- file.exists(paste(path, "R Scripts", "2_merge.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. 2_merge.R already exists")
    } else {
      download.file(paste(github_repo, "2_merge.R",
                          sep = ""),
                    paste(path, "R Scripts", "2_merge.R", sep = "/"))
    }
  }
  #####
}
