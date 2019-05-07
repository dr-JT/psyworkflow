#' Download template R scripts
#'
#' This function will download R script templates
#' @param type String. Do you want to download "raw" or "score" task template files?
#' @param to a directory where to download R scripts
#' @param masterscript Logical. Download masterscript template? default = TRUE
#' @param rawscript Logical. Download rawscript template? default = FALSE
#' @param scorescript Logical. Download scorescript template? default = FALSE
#' @param mergescript Logical. Download mergescript template? default = FALSE
#' @param generic Logical. Download all generic templates? default = FALSE
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

template <- function(type = "both", to = "R Scripts", masterscript = FALSE,
                     rawscript = FALSE, scorescript = FALSE, generic = FALSE,
                     mergescript = FALSE, demographics = FALSE,
                     gf = FALSE, wmc = FALSE, ac = FALSE,
                     antisaccade = FALSE, stroop = FALSE, flanker = FALSE,
                     stroopDL = FALSE, flankerDL = FALSE, va4 = FALSE,
                     sact = FALSE, path = "./"){

  ## Setup ####
  to <- paste(path, to, sep = "/")

  if (generic == TRUE) {
    masterscript <- TRUE
    if (type == "raw") {
      rawscript <- TRUE
    } else if (type == "score") {
      scorescript <- TRUE
      mergescript <- TRUE
    } else {
      rawscript <- TRUE
      scorescript <- TRUE
      mergescript <- TRUE
    }
  }

  if (ac == TRUE) {
    antisaccade <- TRUE
    flanker <- TRUE
    stroop <- TRUE
    stroopDL <- TRUE
    flankerDL <- TRUE
    va4 <- TRUE
    sact <- TRUE
  }
  #####

  ## Download Generic Templates
  if (masterscript == TRUE) {
    download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Generic/masterscript.R",
                  paste(path, "masterscript.R", sep = "/"))
  }
  if (rawscript == TRUE) {
    download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Generic/0_taskname1_raw.R",
                  paste(to, "0_taskname1_raw.R", sep = "/"))
  }
  if (scorescript == TRUE) {
    download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Generic/1_taskname1_score.R",
                  paste(to, "1_taskname1_score.R", sep = "/"))
  }
  if (mergescript == TRUE) {
    download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Generic/2_merge.R",
                  paste(to, "2_merge.R", sep = "/"))
  }
  if (demographics == TRUE) {
    download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Analysis/Demographics.Rmd",
                  paste(to, "3_Demographics.Rmd", sep = "/"))
  }
  #####

  ## Download task templates
  if (gf == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/gf_raw.R",
                    paste(to, "0_gf_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/gf_score.R",
                    paste(to, "1_gf_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/gf_raw.R",
                    paste(to, "0_gf_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/gf_score.R",
                    paste(to, "1_gf_score.R", sep = "/"))
    }
  }
  if (wmc == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/wmc_raw.R",
                    paste(to, "0_wmc_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/wmc_score.R",
                    paste(to, "1_wmc_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/wmc_raw.R",
                    paste(to, "0_wmc_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/wmc_score.R",
                    paste(to, "1_wmc_score.R", sep = "/"))
    }
  }
  if (antisaccade == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/antisaccade_raw.R",
                    paste(to, "0_antisaccade_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/antisaccade_score.R",
                    paste(to, "1_antisaccade_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/antisaccade_raw.R",
                    paste(to, "0_antisaccade_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/antisaccade_score.R",
                    paste(to, "1_antisaccade_score.R", sep = "/"))
    }
  }
  if (stroop == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroop_raw.R",
                    paste(to, "0_stroop_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroop_score.R",
                    paste(to, "1_stroop_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroop_raw.R",
                    paste(to, "0_stroop_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroop_score.R",
                    paste(to, "1_stroop_score.R", sep = "/"))
    }
  }
  if (flanker == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flanker_raw.R",
                    paste(to, "0_flanker_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flanker_score.R",
                    paste(to, "1_flanker_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flanker_raw.R",
                    paste(to, "0_flanker_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flanker_score.R",
                    paste(to, "1_flanker_score.R", sep = "/"))
    }
  }
  if (stroopDL == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroopDL_raw.R",
                    paste(to, "0_stroopDL_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroopDL_score.R",
                    paste(to, "1_stroopDL_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroopDL_raw.R",
                    paste(to, "0_stroopDL_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroopDL_score.R",
                    paste(to, "1_stroopDL_score.R", sep = "/"))
    }
  }
  if (flankerDL == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flankerDL_raw.R",
                    paste(to, "0_flankerDL_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flankerDL_score.R",
                    paste(to, "1_flankerDL_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flankerDL_raw.R",
                    paste(to, "0_flankerDL_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flankerDL_score.R",
                    paste(to, "1_flankerDL_score.R", sep = "/"))
    }
  }
  if (va4 == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/va4_raw.R",
                    paste(to, "0_va4_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/va4_score.R",
                    paste(to, "1_va4_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/va4_raw.R",
                    paste(to, "0_va4_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/va4_score.R",
                    paste(to, "1_va4_score.R", sep = "/"))
    }
  }
  if (sact == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/sact_raw.R",
                    paste(to, "0_sact_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/sact_score.R",
                    paste(to, "1_sact_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/sact_raw.R",
                    paste(to, "0_sact_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/sact_score.R",
                    paste(to, "1_sact_score.R", sep = "/"))
    }
  }
}
