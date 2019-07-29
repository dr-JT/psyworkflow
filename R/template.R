#' Download template R scripts
#'
#' This function will download R script templates
#' @param to a directory where to download R scripts
#' @param overwrite Logical. Overwite any existing templates?
#' @param masterscript String. Which type of masterscript template to download.
#'     masterscript = "data preparation" or masterscript = "data analysis".
#' @param rawscript Logical. Download rawscript template? default = FALSE
#' @param scorescript Logical. Download scorescript template? default = FALSE
#' @param mergescript Logical. Download mergescript template? default = FALSE
#' @param path String. Home directory file path. Ignore...
#' @export
#'

template <- function(to = "R Scripts/templates", overwrite = FALSE,
                     masterscript = NULL, rawscript = FALSE,
                     scorescript = FALSE, mergescript = FALSE,
                     path = "."){

  ## Setup ####
  to <- paste(path, to, sep = "/")
  if (!dir.exists(to)) dir.create(to, recursive = TRUE)
  if (is.null(masterscript)) masterscript <- "none"
  #####

  ## Download Generic Templates
  if (masterscript == "data preparation") {
    exists <- file.exists(paste(path, "masterscript.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. masterscript.R already exists")
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Generic/raw_masterscript.R",
                    paste(path, "masterscript.R", sep = "/"))
    }
  } else if (masterscript == "data analysis") {
    exists <- file.exists(paste(path, "masterscript.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. masterscript.R already exists")
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Generic/score_masterscript.R",
                    paste(path, "masterscript.R", sep = "/"))
    }
  }

  if (rawscript == TRUE) {
    exists <- file.exists(paste(to, "0_taskname1_raw.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. 0_taskname1_raw.R already exists")
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Generic/0_taskname1_raw.R",
                    paste(to, "0_taskname1_raw.R", sep = "/"))
    }
  }

  if (scorescript == TRUE) {
    exists <- file.exists(paste(to, "1_taskname1_score.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. 1_taskname1_score.R already exists")
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Generic/1_taskname1_score.R",
                    paste(to, "1_taskname1_score.R", sep = "/"))
    }
  }

  if (mergescript == TRUE) {
    exists <- file.exists(paste(to, "2_merge.R", sep = "/"))
    if (exists == TRUE & overwrite == FALSE) {
      message("Did not download file. 2_merge.R already exists")
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Generic/2_merge.R",
                    paste(to, "2_merge.R", sep = "/"))
    }
  }
  #####
}
