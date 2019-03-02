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
                         sact = FALSE){

  ## Setup ####
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

  messy.name <- paste("Data Files/Raw Data/", messy.name, sep = "")
  #####

  ## Create directory structure ####
  if (scripts.dir==TRUE & dir.exists("./R Scripts")==FALSE) {
    dir.create("./R Scripts")
  }
  if (data.dir==TRUE & dir.exists("Data Files")==FALSE) {
    dir.create("Data Files")
  }
  if (raw.dir==TRUE & dir.exists("Data Files/Raw Data")==FALSE) {
    dir.create("Data Files/Raw Data")
  }
  if (messy.dir==TRUE & dir.exists(messy.name)==FALSE) {
    dir.create(messy.name)
  }
  if (scored.dir==TRUE & dir.exists("Data Files/Scored Data")==FALSE) {
    dir.create("Data Files/Scored Data")
  }
  if (tasks.dir==TRUE & dir.exists("Tasks")==FALSE) {
    dir.create("Tasks")
  }
  if (documents.dir==TRUE & dir.exists("Documents")==FALSE) {
    dir.create("Documents")
  }
  if (results.dir==TRUE & dir.exists("Results")==FALSE) {
    dir.create("Results")
  }
  if (figures.dir==TRUE & dir.exists("Results/Figures")==FALSE) {
    dir.create("Results/Figures")
  }
  if (manuscript.dir==TRUE & dir.exists("Manuscript")==FALSE) {
    dir.create("Manuscript")
  }
  if (presentations.dir==TRUE & dir.exists("Presentations")==FALSE) {
    dir.create("Presentations")
  }
  for (dir in other.dir){
    if (dir.exists(dir)==FALSE) dir.create(dir)
  }
  #####

  ## Download Templates ####
  template(masterscript = masterscript, rawscript = rawscript,
           scorescript = scorescript, mergescript = mergescript,
           demographics = demographics, sem = sem, gf = gf, wmc = wmc, ac = ac,
           antisaccade = antisaccade, stroop = stroop, flanker = flanker,
           stroopDL = stroopDL, flankerDL = flankerDL, va4 = va4, sact = sact)
  #####
}

