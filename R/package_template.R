package_template <- function(path, type, sessions, generic, gf, wmc, ac,
                             figures.dir, manuscript.dir, presentations.dir) {
  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  create_study(type = type, sessions = sessions, figures.dir = figures.dir,
               manuscript.dir = manuscript.dir,
               presentations.dir = presentations.dir, generic = generic,
               gf = gf, wmc = wmc, ac = ac, path = path)
}
