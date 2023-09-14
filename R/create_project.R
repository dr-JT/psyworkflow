#' Setup directory and templates for a new research study
#'
#' This function can be used to automatically setup your study directory by
#' creating folders and template scripts
#' @param script_templates Logical. Download all script templates? default = FALSE
#' @param main_script Logical. Download a main script template? default = TRUE
#' @param raw_script Logical. Download a raw script template? default = FALSE
#' @param score_script Logical. Download a score script template? default = FALSE
#' @param merge_script Logical. Download a merge script template? default = FALSE
#' @param analysis_script Logical. Download template to do data analysis (.Rmd)? default = FALSE
#' @param data_raw Logical. Create a raw data directory? default = FALSE
#' @param data_scored Logical. Create a scored data directory? default = FALSE
#' @param analyses Logical. Create an analyses directory? default = FALSE
#' @param documents Logical. Create documents directory? default = FALSE
#' @param tasks Logical. Create tasks directory? default = FALSE
#' @param manuscript Logical. Create manuscript directory? default = FALSE
#' @param presentations Logical. Create presentations directory? default = FALSE
#' @param other List of other directories you want to create
#' @param standard_project Logical. Create a standard project directory? default = FALSE
#' @param path String. Home directory file path
#' @export
#'

create_project <- function(script_templates = FALSE,
                           main_script = FALSE, raw_script = FALSE,
                           score_script = FALSE, merge_script = FALSE,
                           analysis_script = FALSE,
                           data_raw = FALSE, data_scored = FALSE,
                           analyses = FALSE,
                           documents = FALSE, tasks = FALSE,
                           manuscript = FALSE, presentations = FALSE,
                           other = c(), standard_project = FALSE,
                           path = "."){

  ## Setup ####
  path <- paste(path, "/", sep = "")
  if (standard_project == TRUE) {
    script_templates <- TRUE
    data_raw <- TRUE
    data_scored <- TRUE
    analyses <- TRUE
    documents <- TRUE
    tasks <- TRUE
    manuscript <- TRUE
    presentations <- TRUE
  }
  #####

  ## Common Directories ####
  dir.create(paste(path, "R", sep = ""))
  dir.create(paste(path, "data", sep = ""))
  ##########################

  ## Other Directories ####
  if (data_raw == TRUE) {
    dir.create(paste(path, "data/raw", sep = ""))
    dir.create(paste(path, "data/raw/messy", sep = ""))
  }
  if (data_scored == TRUE) dir.create(paste(path, "data/scored", sep = ""))
  if (documents == TRUE) dir.create(paste(path, "documents", sep = ""))
  if (analyses == TRUE) {
    dir.create(paste(path, "analyses", sep = ""))
    dir.create(paste(path, "analyses/exploratory", sep = ""))
    dir.create(paste(path, "analyses/figures", sep = ""))
  }
  if (tasks == TRUE) dir.create(paste(path, "tasks", sep = ""))
  if (manuscript == TRUE) {
    dir.create(paste(path, "manuscript", sep = ""))
    dir.create(paste(path, "manuscript/figures", sep = ""))
  }
  if (presentations == TRUE) {
    dir.create(paste(path, "presentations", sep = ""))
    dir.create(paste(path, "presentations/figures", sep = ""))
  }

  for (dir in other) {
    dir <- paste(path, dir, sep = "")
    dir.create(dir)
  }
  #########################

  ## Download R Script Templates ####
  if (script_templates == TRUE) {
    main_script <- TRUE
    raw_script <- TRUE
    score_script <- TRUE
    merge_script <- TRUE
    analysis_script <- TRUE
  }

  get_template(to = "R/templates", path = path,
               main_script = main_script, raw_script = raw_script,
               score_script = score_script, merge_script = merge_script,
               analysis_script = analysis_script)

  # Download required packages script
  github_repo <-
    "https://raw.githubusercontent.com/dr-JT/psyworkflow/main/script_templates/"

  download.file(paste(github_repo, "_required_packages.R",
                      sep = ""),
                paste(path, "R/", "_required_packages.R", sep = ""))
  ###################################
}

