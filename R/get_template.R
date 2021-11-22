#' Download R Script Templates
#'
#' This function will download template scripts for data analysis in R
#' @param to a directory where to download R scripts.
#'     default: "R Scripts/templates"
#' @param overwrite Logical. Overwite any existing templates? default: FALSE
#' @param mainscript Logical. Download a main script template to source all
#'     other R scripts?
#' @param rawscript Logical. Download template to convert a "messy" raw data file
#'     to a "tidy" raw data file? default = FALSE
#' @param scorescript Logical. Download template to perform data cleaning and
#'     scoring (aggregate) on a "tidy" raw data file? default = FALSE
#' @param mergescript Logical. Download template to merge multiple scored data
#'     files? default = FALSE
#' @param analysisscript Logical. Download template to do data analysis (.Rmd)?
#'     default = FALSE
#' @param study_doc Logical. Download a study documentation template? default = FALSE
#' @param path String. working directory file path. Ignore...
#' @export
#'

get_template <- function(to = "R/templates", overwrite = FALSE,
                         mainscript = FALSE, rawscript = FALSE,
                         scorescript = FALSE, mergescript = FALSE,
                         analysisscript = FALSE, study_doc = FALSE,
                         path = "."){

  ## Setup ####
  to <- paste(path, to, sep = "/")
  github_repo <-
    "https://raw.githubusercontent.com/dr-JT/workflow/master/script_templates/"

  if (!dir.exists(to)) dir.create(to, recursive = TRUE)
  #####

  ## Download Templates
  if (mainscript == TRUE) {
    exists <- file.exists(paste(path, "mainscript.Rmd", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. mainscript.Rmd already exists")
    } else {
      download.file(paste(github_repo, "mainscript.Rmd",
                          sep = ""),
                    paste(path, "mainscript.Rmd", sep = "/"))
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
    exists <- file.exists(paste(to, "2_merge.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. 2_merge.R already exists")
    } else {
      download.file(paste(github_repo, "2_merge.R",
                          sep = ""),
                    paste(to, "2_merge.R", sep = "/"))
    }
  }

  if (analysisscript == TRUE) {
    exists <- file.exists(paste(to, "3_Analysis.Rmd", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. 3_Analysis.Rmd already exists")
    } else {
      download.file(paste(github_repo, "3_Analysis.Rmd",
                          sep = ""),
                    paste(to, "3_Analysis.Rmd", sep = "/"))
    }
  }
  #####
}
