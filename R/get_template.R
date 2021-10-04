#' Download R Script Templates
#'
#' This function will download template scripts for data analysis in R
#' @param to a directory where to download R scripts.
#'     default: "R Scripts/templates"
#' @param overwrite Logical. Overwite any existing templates? default: FALSE
#' @param mainscript String. Which type of mainscript template to download.
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

get_template <- function(to = "R Scripts/templates", overwrite = FALSE,
                         mainscript = NULL, rawscript = FALSE,
                         scorescript = FALSE, mergescript = FALSE,
                         path = "."){

  ## Setup ####
  to <- paste(path, to, sep = "/")
  github_repo <-
    "https://raw.githubusercontent.com/dr-JT/workflow/master/script_templates/"

  if (!dir.exists(to)) dir.create(to, recursive = TRUE)
  if (is.null(mainscript)) mainscript <- "none"
  #####

  ## Download Generic Templates
  if (mainscript == "data preparation") {
    exists <- file.exists(paste(path, "mainscript.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. mainscript.R already exists")
    } else {
      download.file(paste(github_repo, "mainscript_collection.Rmd",
                          sep = ""),
                    paste(path, "mainscript.R", sep = "/"))
    }
  } else if (mainscript == "data analysis") {
    exists <- file.exists(paste(path, "mainscript.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. mainscript.R already exists")
    } else {
      download.file(paste(github_repo, "mainscript_analysis.Rmd",
                          sep = ""),
                    paste(path, "mainscript.R", sep = "/"))
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
