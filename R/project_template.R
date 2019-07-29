project_template <- function(path, type, sessions,
                             figures.dir, manuscript.dir, presentations.dir) {
  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # which scripts
  if (type == "data collection") {
    masterscript <- "data preparation"
    rawscript <- TRUE
    scorescript <- FALSE
    mergescript <- FALSE
  }

  if (type == "data analysis") {
    masterscript <- "data analysis"
    rawscript <- FALSE
    scorescript <- TRUE
    mergescript <- TRUE
  }

  create_study(type = type, sessions = sessions, figures.dir = figures.dir,
               manuscript.dir = manuscript.dir,
               presentations.dir = presentations.dir,
               masterscript = masterscript, rawscript = rawscript,
               scorescript = scorescript, mergescript = mergescript,
               path = path)
}
