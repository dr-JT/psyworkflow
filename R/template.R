#' Download template R scripts
#'
#' This function will download R script templates
#' @param all Logical. Download all R script templates?
#' @param to a directory where to download R scripts
#' @param masterscript Logical. Download masterscript template? default = TRUE
#' @param rawscript Logical. Download rawscript template? default = FALSE
#' @param scorescript Logical. Download scorescript template? default = FALSE
#' @param mergescript Logical. Download mergescript template? default = FALSE
#' @param demographics Logical. Download demographics template? default = FALSE
#' @param sem Logical. Download sem analysis templates? default = FALSE
#' @param type String. Do you want to download "raw" or "score" task template files?
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

template <- function(all = FALSE, to = "R Scripts", masterscript = FALSE,
                     rawscript = FALSE, scorescript = FALSE,
                     mergescript = FALSE, demographics = FALSE, sem = FALSE,
                     type = "both", gf = FALSE, wmc = FALSE, ac = FALSE,
                     antisaccade = FALSE, stroop = FALSE, flanker = FALSE,
                     stroopDL = FALSE, flankerDL = FALSE, va4 = FALSE,
                     sact = FALSE){

  ## Setup ####
  if (all == TRUE) {
    masterscript <- TRUE
    rawscript <- TRUE
    scorescript <- TRUE
    mergescript <- TRUE
    demographics <- TRUE
    sem <- TRUE
  }

  if (ac == TRUE) {
    antisaccade <- TRUE
    stroopDL <- TRUE
    flankerDL <- TRUE
    va4 <- TRUE
    sact <- TRUE
  }
  #####

  ## Download Generic Templates
  if (masterscript == TRUE) {
    download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/General/masterscript.R",
                  "./masterscript.R")
  }
  if (rawscript == TRUE) {
    download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/General/1_taskname1_raw.R",
                  paste(to, "1_taskname1_raw.R", sep = "/"))
  }
  if (scorescript == TRUE) {
    download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/General/2_taskname1_score.R",
                  paste(to, "2_taskname1_score.R", sep = "/"))
  }
  if (mergescript == TRUE) {
    download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/General/3_merge.R",
                  paste(to, "3_merge.R", sep = "/"))
  }
  if (demographics == TRUE) {
    download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Analysis/Demographics.Rmd",
                  paste(to, "4_Demographics.Rmd", sep = "/"))
  }
  if (sem == TRUE) {
    download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Analysis/Correlations.Rmd",
                  paste(to, "4_Correlations.Rmd", sep = "/"))
    download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Analysis/SEM.Rmd",
                  paste(to, "5_MainAnalyses.Rmd", sep = "/"))
  }
  #####

  ## Download task templates
  if (gf == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/gf_raw.R",
                    paste(to, "1_gf_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/gf_score.R",
                    paste(to, "2_gf_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/gf_raw.R",
                    paste(to, "1_gf_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/gf_score.R",
                    paste(to, "2_gf_score.R", sep = "/"))
    }
  }
  if (wmc == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/wmc_raw.R",
                    paste(to, "1_wmc_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/wmc_score.R",
                    paste(to, "2_wmc_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/wmc_raw.R",
                    paste(to, "1_wmc_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/wmc_score.R",
                    paste(to, "2_wmc_score.R", sep = "/"))
    }
  }
  if (antisaccade == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/antisaccade_raw.R",
                    paste(to, "1_antisaccade_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/antisaccade_score.R",
                    paste(to, "2_antisaccade_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/antisaccade_raw.R",
                    paste(to, "1_antisaccade_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/antisaccade_score.R",
                    paste(to, "2_antisaccade_score.R", sep = "/"))
    }
  }
  if (stroop == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroop_raw.R",
                    paste(to, "1_stroop_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroop_score.R",
                    paste(to, "2_stroop_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroop_raw.R",
                    paste(to, "1_stroop_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroop_score.R",
                    paste(to, "2_stroop_score.R", sep = "/"))
    }
  }
  if (flanker == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flanker_raw.R",
                    paste(to, "1_flanker_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flanker_score.R",
                    paste(to, "2_flanker_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flanker_raw.R",
                    paste(to, "1_flanker_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flanker_score.R",
                    paste(to, "2_flanker_score.R", sep = "/"))
    }
  }
  if (stroopDL == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroopDL_raw.R",
                    paste(to, "1_stroopDL_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroopDL_score.R",
                    paste(to, "2_stroopDL_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroopDL_raw.R",
                    paste(to, "1_stroopDL_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/stroopDL_score.R",
                    paste(to, "2_stroopDL_score.R", sep = "/"))
    }
  }
  if (flankerDL == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flankerDL_raw.R",
                    paste(to, "1_flankerDL_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flankerDL_score.R",
                    paste(to, "2_flankerDL_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flankerDL_raw.R",
                    paste(to, "1_flankerDL_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/flankerDL_score.R",
                    paste(to, "2_flankerDL_score.R", sep = "/"))
    }
  }
  if (va4 == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/va4_raw.R",
                    paste(to, "1_va4_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/va4_score.R",
                    paste(to, "2_va4_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/va4_raw.R",
                    paste(to, "1_va4_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/va4_score.R",
                    paste(to, "2_va4_score.R", sep = "/"))
    }
  }
  if (sact == TRUE) {
    if (type == "raw") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/sact_raw.R",
                    paste(to, "1_sact_raw.R", sep = "/"))
    } else if (type == "score") {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/sact_score.R",
                    paste(to, "2_sact_score.R", sep = "/"))
    } else {
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/sact_raw.R",
                    paste(to, "1_sact_raw.R", sep = "/"))
      download.file("https://raw.githubusercontent.com/EngleLab/R-Templates/master/Tasks/sact_score.R",
                    paste(to, "2_sact_score.R", sep = "/"))
    }
  }
}
