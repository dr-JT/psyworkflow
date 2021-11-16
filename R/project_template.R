project_template <- function(script_templates, mainscript, rawscript,
                             scorescript, mergescript, study_doc, data_raw,
                             data_scored, documents, results, tasks, sessions,
                             manuscript, presentations, figures, other,
                             standard_project, path) {
  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # create project
  create_project(script_templates = script_templates,
                 mainscript = mainscript, rawscript = rawscript,
                 scorescript = scorescript, mergescript = mergescript,
                 study_doc = study_doc, data_raw = data_raw,
                 data_scored = data_scored, documents = documents,
                 results = results, tasks = tasks, sessions = sessions,
                 manuscript = manuscript, presentations = presentations,
                 figures = figures, other = c(),
                 standard_project = standard_project, path = path)
}
