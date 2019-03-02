package_template <- function(path, type, sessions, figures.dir, manuscript.dir,
                             presentations.dir, templates, gf, wmc, ac) {
  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  create_study(type = type, sessions = sessions, figures.dir = figures.dir,
               manuscript.dir = manuscript.dir, presentations.dir = presentations.dir,
               templates = templates, gf = gf, wmc = wmc, ac = ac, path = path)
}
