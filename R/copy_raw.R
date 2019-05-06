#' Copy raw data files from one direcoty to another
#'
#' This function will automatically copy files from the Task directory to
#' the Raw data directory
#' @param from a directory of task folders
#' @param to a directory where raw data files are to be copied to
#' @param filetype a string pattern identifying a specific
#'     type of raw data file (e.g. .edat2).
#' @param remove logical. Should the files in the 'from' directory
#'     be deleted? (Default: FALSE)
#' @param subj.file a file path to a list of subjects who completed
#'     the entire study. (Default: NULL).
#' @param copy logical. Do you want to copy or only remove the files? (Default = TRUE)
#' @export
#'

copy_raw <- function(from, to, filetype, remove = FALSE,
                     subj.file = NULL, copy = TRUE){

  if (copy == TRUE) {
    delim <- ifelse(stringr::str_detect(subj.file, ".csv"), ",",
                    ifelse(stringr::str_detect(subj.file, ".txt"), "\t", NULL))
    if (delim == ",") {
      subj.list <- readr::read_csv(subj.file)
      colnames(subj.list) <- "Subject"
    } else if (delim == "\t") {
      subj.list <- readr::read_delim(subj.file, "\t",
                                     escape_double = FALSE, trim_ws = TRUE)
      colnames(subj.list) <- "Subject"
    } else {
      subj.list <- data.frame(Subject = NA)
    }
    subj.list <- as.character(subj.list$Subject)

    dirs <- list.dirs(from, full.names = FALSE, recursive = FALSE)
    for (task_dir in dirs){
      files <- list.files(paste(from, task_dir, sep = "/"), pattern = filetype,
                          recursive = TRUE, full.names = TRUE)
      if (length(files)>0){
        files.error <- c()
        files.keep <- c()
        files.drop <- c()
        for (i in seq_along(files)){
          subj.complete <-
            length(which(stringr::str_detect(files[i], subj.list) == TRUE))
          error <-
            length(which(stringr::str_detect(files[i], "conflicted copy") == TRUE))

          if (error == 1) {
            files.error <- c(files.error, files[i])
          } else if (subj.complete == 1) {
            files.keep <- c(files.keep, files[i])
          } else if (subj.complete == 0) {
            files.drop <- c(files.drop, files[i])
          }
        }

        task <-
          paste(stringr::str_c(stringr::str_split(task_dir, " ")[[1]][-1]),
                sep = " ", collapse = "")
        if (length(task[[1]])==1){
          task <- task[[1]][1]
        } else {
          task <- task[[1]][2]
        }
        copy_dir <- paste(to, task, sep = "/")
        if (dir.exists(copy_dir) == FALSE){
          dir.create(copy_dir)
        }
        drop_dir <- paste(copy_dir, "Did not finish all sessions", sep = "/")
        if (dir.exists(drop_dir) == FALSE) {
          dir.create(drop_dir)
        }
        error_dir <- paste(copy_dir, "error", sep = "/")
        if (dir.exists(error_dir) == FALSE) {
          dir.create(error_dir)
        }

        file.copy(files.keep, copy_dir, copy.date = TRUE)
        file.copy(files.drop, drop_dir, copy.date = TRUE)
        file.copy(files.error, error_dir, copy.date = TRUE)

        cat("   ", "\n")
        cat("-----------------------------------------", "\n")
        cat("Files Copied: ", task, "\n")
        cat("Completed Subjects: ", length(files.keep), "\n")
        cat("Did not finish all sessions: ", length(files.drop), "\n")
        cat("Files with errors: ", length(files.error), "\n")
        cat("Total Files: ", length(files), "\n")
        cat("-----------------------------------------", "\n")

        if (remove == TRUE){
          file.remove(files)
        }
      }
    }
  } else {
    if (remove == TRUE) {
      dirs <- list.dirs(from, full.names = FALSE, recursive = FALSE)
      for (task_dir in dirs) {
        files <- list.files(paste(from, task_dir, sep = "/"), pattern = filetype,
                            recursive = TRUE, full.names = TRUE)

        file.remove(files)
      }
    }
  }
}
