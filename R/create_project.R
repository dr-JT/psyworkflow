#' Setup directory and templates for a new research study
#'
#' This function can be used to automatically setup your study directory by
#' creating folders and template scripts
#' @param script_templates Logical. Download all script templates? default = FALSE
#' @param mainscript Logical. Download a main script template? default = TRUE
#' @param rawscript Logical. Download a raw script template? default = FALSE
#' @param scorescript Logical. Download a score script template? default = FALSE
#' @param mergescript Logical. Download a merge script template? default = FALSE
#' @param analysisscript Logical. Download template to do data analysis (.Rmd)? default = FALSE
#' @param study_doc Logical. Download a study documentation template? default = FALSE
#' @param data_raw Logical. Create a raw data directory? default = FALSE
#' @param data_scored Logical. Create a scored data directory? default = FALSE
#' @param documents Logical. Create documents directory? default = FALSE
#' @param results Logical. Create results directory? default = FALSE
#' @param tasks Logical. Create tasks directory? default = FALSE
#' @param sessions Numeric. How many sessions will the study have?
#' @param manuscript Logical. Create manuscript directory? default = FALSE
#' @param presentations Logical. Create presentations directory? default = FALSE
#' @param figures Logical. Create figures directory? default = FALSE
#' @param other List of other directories you want to create
#' @param standard_project Logical. Create a standard project directory? default = FALSE
#' @param path String. Home directory file path
#' @export
#'

create_project <- function(script_templates = FALSE,
                           mainscript = FALSE, rawscript = FALSE,
                           scorescript = FALSE, mergescript = FALSE,
                           analysisscript = FALSE, study_doc = FALSE,
                           data_raw = FALSE, data_scored = FALSE,
                           documents = FALSE, results = FALSE,
                           tasks = FALSE, sessions = NULL,
                           manuscript = FALSE, presentations = FALSE,
                           figures = FALSE, other = c(),
                           standard_project = FALSE,
                           path = "."){

  if (!is.na(sessions)) {
    if (sessions == "NULL") sessions <- NULL
  }

  ## Setup ####
  path <- paste(path, "/", sep = "")
  if (standard_project == TRUE) {
    script_templates <- TRUE
    data_raw <- TRUE
    data_scored <- TRUE
    documents <- TRUE
    results <- TRUE
    tasks <- TRUE
    manuscript <- TRUE
    presentations <- TRUE
    figures <- TRUE
  }
  #####

  ## Common Directories ####
  dir.create(paste(path, "R", sep = ""))
  dir.create(paste(path, "data", sep = ""))
  ##########################

  ## Other Directories ####
  if (data_raw == TRUE) dir.create(paste(path, "data/raw", sep = ""))
  if (data_scored == TRUE) dir.create(paste(path, "data/scored", sep = ""))
  if (documents == TRUE) dir.create(paste(path, "documents", sep = ""))
  if (results == TRUE) dir.create(paste(path, "results", sep = ""))
  if (tasks == TRUE) dir.create(paste(path, "tasks", sep = ""))
  if (!is.null(sessions)) {
    if (session > 1) {
      for (i in 1:sessions) {
        session <- paste(path, "tasks/session ", i, sep = "")
        dir.create(session)
      }
    }
  }
  if (manuscript == TRUE) dir.create(paste(path, "manuscript", sep = ""))
  if (presentations == TRUE) dir.create(paste(path, "presentations", sep = ""))
  if (figures == TRUE) {
    if (manuscript == TRUE) {
      dir.create(paste(path, "manuscript/figures", sep = ""))
    }
    if (presentations == TRUE) {
      dir.create(paste(path, "presentations/figures", sep = ""))
    }
    if (manuscript == FALSE & presentations == FALSE) {
      dir.create(paste(path, "figures", sep = ""))
    }
  }
  for (dir in other){
    dir <- paste(path, dir, sep = "")
    dir.create(dir)
  }
  #########################

  ## Download R Script Templates ####
  if (script_templates == TRUE) {
    mainscript <- TRUE
    rawscript <- TRUE
    scorescript <- TRUE
    mergescript <- TRUE
    analysisscript <- TRUE
    study_doc <- TRUE
  }

  get_template(to = "R/templates", path = path,
               mainscript = mainscript, rawscript = rawscript,
               scorescript = scorescript, mergescript = mergescript,
               analysisscript = analysisscript, study_doc = study_doc)

  # Download required packages script
  github_repo <-
    "https://raw.githubusercontent.com/dr-JT/workflow/master/script_templates/"

  download.file(paste(github_repo, "_required_packages.R",
                      sep = ""),
                paste(path, "R/", "_required_packages.R", sep = ""))
  ###################################
}

