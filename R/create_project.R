#' Setup directory and templates for a new research study
#'
#' This function can be used to automatically setup your study directory by
#' creating folders and template scripts
#' @param type String. Options: "data collection"; "data analysis".
#' @param sessions Numeric. How many sessions will the study have?
#' @param scripts.dir Logical. Create script directory? default = TRUE
#' @param data.dir Logical. Create data files directory? default = TRUE
#' @param raw.dir Logical. Create raw? default = TRUE
#' @param messy.dir Logical. Create raw messy directory? default = TRUE
#' @param messy.name String. Name of messy direcotry. default = "messy"
#' @param scored.dir Logical. Create scored directory? default = TRUE
#' @param tasks.dir Logical. Create tasks directory? default = TRUE
#' @param documents.dir Logical. Create documents directory? default = TRUE
#' @param results.dir Logical. Create results directory? default = TRUE
#' @param figures.dir Logical. Create figures directory? default = FALSE
#' @param manuscript.dir Logical. Create manuscript directory? default = FALSE
#' @param presentations.dir Logical. Create presentations directory? default = FALSE
#' @param other.dir List of other directories you want to create
#' @param generic Logical. Download all generic templates? default = FALSE
#' @param mainscript Logical. Download mainscript template? default = TRUE
#' @param rawscript Logical. Download rawscript template? default = FALSE
#' @param scorescript Logical. Download scorescript template? default = FALSE
#' @param mergescript Logical. Download mergescript template? default = FALSE
#' @param path String. Home directory file path
#' @export
#'

create_project <- function(type = "data analysis", sessions = 1,
                           figures.dir = FALSE, manuscript.dir = FALSE,
                           presentations.dir = FALSE, other.dir = c(),
                           mainscript = NULL, rawscript = FALSE,
                           scorescript = FALSE, mergescript = FALSE,
                           path = "."){

  ## Setup ####
  path <- paste(path, "/", sep = "")
  #####

  ## Common Directories ####
  dir.create(paste(path, "R Scripts", sep = ""))
  dir.create(paste(path, "Data Files", sep = ""))
  dir.create(paste(path, "Documents", sep = ""))
  for (dir in other.dir){
    dir <- paste(path, dir, sep = "")
    dir.create(dir)
  }
  ##########################

  ## Data Collection Directories ####
  if (type == "data collection") {
    messy.name <- paste(path, "Data Files/", "Merged", sep = "")
    dir.create(paste(path, "Data Files/Subject Files", sep = ""))
    dir.create(messy.name)
    dir.create(paste(path, "Tasks", sep = ""))
    if (sessions > 1) {
      for (i in 1:sessions) {
        session <- paste(path, "Tasks/Session ", i, sep = "")
        dir.create(session)
      }
    }
  }
  #######################

  ## Analysis Directories ####
  if (type == "data analysis") {
    dir.create(paste(path, "Data Files/Raw Data", sep = ""))
    dir.create(paste(path, "Data Files/Scored Data", sep = ""))
    dir.create(paste(path, "Results", sep = ""))
    if (figures.dir == TRUE) {
      dir.create(paste(path, "Figures", sep = ""))
    }
    if (manuscript.dir == TRUE) {
      dir.create(paste(path, "Manuscript", sep = ""))
    }
    if (presentations.dir == TRUE) {
      dir.create(paste(path, "Presentations", sep = ""))
    }
  }
  ############################

  ## Download Templates ####
  get_template(mainscript = mainscript, rawscript = rawscript,
               scorescript = scorescript, mergescript = mergescript,
               path = path)
  #####
}

