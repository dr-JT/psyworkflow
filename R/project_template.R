project_template <- function(path, type, sessions, masterscript, rawscript,
                             scorescript, mergescript,
                             figures.dir, manuscript.dir, presentations.dir) {
  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  create_study(type = type, sessions = sessions, figures.dir = figures.dir,
               manuscript.dir = manuscript.dir,
               presentations.dir = presentations.dir, masterscript = masterscript,
               rawscript = rawscript, scorescript = scorescript,
               mergescript = mergescript, path = path)
}
