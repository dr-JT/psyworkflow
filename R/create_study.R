#' Setup directory and templates for a new research study
#'
#' This function can be used to automatically setup your study directory by
#' creating folders and template scripts
#' @param type String. Options: "standard" or "sem". (Default = "standard").
#'     "sem" will add sem analysis templates
#' @param sessions Numeric. How many sessions will the study have?
#' @param all Logical. Create all project directories?
#' @param templates Logical. Add all R script templates?
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
#' @param masterscript Logical. Download masterscript template? default = TRUE
#' @param rawscript Logical. Download rawscript template? default = FALSE
#' @param scorescript Logical. Download scorescript template? default = FALSE
#' @param mergescript Logical. Download mergescript template? default = FALSE
#' @param demographics Logical. Download demographics template? default = FALSE
#' @param gf Logical. Do you want to download gf template files?
#' @param wmc Logical. Do you want to download wmc template files?
#' @param ac Logical. Do you want to download all attention control template files?
#' @param antisaccade Logical. Do you want to download antisaccade template files?
#' @param stroop Logical. Do you want to download stroop template files?
#' @param flanker Logical. Do you want to download flanker template files?
#' @param stroopDL Logical. Do you want to download stroopDL template files?
#' @param flankerDL Logical. Do you want to download flankerDL template files?
#' @param va4 Logical. Do you want to download va4 template files?
#' @param sact Logical. Do you want to download sact template files?
#' @param path String. Home directory file path
#' @export
#'

create_study <- function(type = "standard", sessions = 1, all = FALSE,
                         templates = FALSE, scripts.dir = TRUE, data.dir = TRUE,
                         raw.dir = TRUE, messy.dir = TRUE, messy.name = "messy",
                         scored.dir = TRUE, tasks.dir = TRUE,
                         documents.dir = TRUE, results.dir = TRUE,
                         figures.dir = FALSE, manuscript.dir = FALSE,
                         presentations.dir = FALSE, other.dir = c(),
                         masterscript = TRUE, rawscript = FALSE,
                         scorescript = FALSE, mergescript = FALSE,
                         demographics = FALSE, gf = FALSE, wmc = FALSE, ac = FALSE,
                         antisaccade = FALSE, stroop = FALSE, flanker = FALSE,
                         stroopDL = FALSE, flankerDL = FALSE, va4 = FALSE,
                         sact = FALSE, path = "./"){

  ## Setup ####
  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  if (all == TRUE) {
    scripts.dir <- TRUE
    data.dir <- TRUE
    raw.dir <- TRUE
    messy.dir <- TRUE
    scored.dir <- TRUE
    tasks.dir <- TRUE
    documents.dir <- TRUE
    results.dir <- TRUE
    figures.dir <- TRUE
    manuscript.dir <- TRUE
    presentation.dir <- TRUE
    masterscript <- TRUE
    rawscript <- TRUE
    scorescript <- TRUE
    mergescript <- TRUE
    demographics <- TRUE
  }

  if (templates == TRUE) {
    masterscript <- TRUE
    rawscript <- TRUE
    scorescript <- TRUE
    mergescript <- TRUE
    demographics <- TRUE
  }

  if (type == "sem") {
    sem <- TRUE
  } else {
    sem <- FALSE
  }

  messy.name <- paste(path, "Data Files/Raw Data/", messy.name, sep = "")
  #####

  ## Create directory structure ####
  if (scripts.dir==TRUE & dir.exists(paste(path, "R Scripts", sep = ""))==FALSE) {
    dir.create(paste(path, "R Scripts", sep = ""))
  }
  if (data.dir==TRUE & dir.exists(paste(path, "Data Files", sep = ""))==FALSE) {
    dir.create(paste(path, "Data Files", sep = ""))
  }
  if (raw.dir==TRUE & dir.exists(paste(path, "Data Files/Raw Data", sep = ""))==FALSE) {
    dir.create(paste(path, "Data Files/Raw Data", sep = ""))
  }
  if (messy.dir==TRUE & dir.exists(messy.name)==FALSE) {
    dir.create(messy.name)
  }
  if (scored.dir==TRUE & dir.exists(paste(path, "Data Files/Scored Data", sep = ""))==FALSE) {
    dir.create(paste(path, "Data Files/Scored Data", sep = ""))
  }
  if (tasks.dir==TRUE & dir.exists(paste(path, "Tasks", sep = ""))==FALSE) {
    dir.create(paste(path, "Tasks", sep = ""))
  }
  if (documents.dir==TRUE & dir.exists(paste(path, "Documents", sep = ""))==FALSE) {
    dir.create(paste(path, "Documents", sep = ""))
  }
  if (results.dir==TRUE & dir.exists(paste(path, "Results", sep = ""))==FALSE) {
    dir.create(paste(path, "Results", sep = ""))
  }
  if (figures.dir==TRUE & dir.exists(paste(path, "Results/Figures", sep = ""))==FALSE) {
    dir.create(paste(path, "Results/Figures", sep = ""))
  }
  if (manuscript.dir==TRUE & dir.exists(paste(path, "Manuscript", sep = ""))==FALSE) {
    dir.create(paste(path, "Manuscript", sep = ""))
  }
  if (presentations.dir==TRUE & dir.exists(paste(path, "Presentations", sep = ""))==FALSE) {
    dir.create(paste(path, "Presentations", sep = ""))
  }
  for (dir in other.dir){
    dir <- paste(path, dir, sep = "")
    if (dir.exists(dir)==FALSE) dir.create(dir)
  }
  #####

  ## Download Templates ####
  template(masterscript = masterscript, rawscript = rawscript,
           scorescript = scorescript, mergescript = mergescript,
           demographics = demographics, sem = sem, gf = gf, wmc = wmc, ac = ac,
           antisaccade = antisaccade, stroop = stroop, flanker = flanker,
           stroopDL = stroopDL, flankerDL = flankerDL, va4 = va4, sact = sact,
           path = path)
  #####
}

