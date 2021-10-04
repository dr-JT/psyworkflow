project_template <- function(path, type, sessions,
                             figures.dir, manuscript.dir, presentations.dir) {
  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # which scripts
  if (type == "data collection") {
    mainscript <- "data preparation"
    rawscript <- TRUE
    scorescript <- FALSE
    mergescript <- FALSE
  }

  if (type == "data analysis") {
    mainscript <- "data analysis"
    rawscript <- FALSE
    scorescript <- TRUE
    mergescript <- TRUE
  }

  create_project(type = type, sessions = sessions, figures.dir = figures.dir,
                 manuscript.dir = manuscript.dir,
                 presentations.dir = presentations.dir,
                 mainscript = mainscript, rawscript = rawscript,
                 scorescript = scorescript, mergescript = mergescript,
                 path = path)
}
