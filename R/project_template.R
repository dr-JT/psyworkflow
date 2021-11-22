project_template <- function(path, mainscript, rawscript, scorescript,
                             mergescript, analysisscript,
                             study_doc, data_raw, data_scored,
                             documents, results, tasks, sessions) {
  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # create project
  create_project(path = path, mainscript = mainscript, rawscript = rawscript,
                 scorescript = scorescript, mergescript = mergescript,
                 analysisscript = analysisscript,
                 study_doc = study_doc, data_raw = data_raw,
                 data_scored = data_scored, documents = documents,
                 results = results, tasks = tasks, sessions = sessions)
}
