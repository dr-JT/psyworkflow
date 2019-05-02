package_template <- function(path, type, sessions, messy.dir, scored.dir, manuscript.dir,
                             results.dir, generic, gf, wmc, ac) {
  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  create_study(type = type, sessions = sessions, messy.dir = messy.dir,
               scored.dir = scored.dir, manuscript.dir = manuscript.dir,
               results.dir = results.dir, generic = generic,
               gf = gf, wmc = wmc, ac = ac, path = path, messy.name = "E-Merge")
}
