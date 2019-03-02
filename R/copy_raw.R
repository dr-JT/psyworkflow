#' Copy raw data files from one direcoty to another
#'
#' This function will automatically copy files from the Task directory to
#' the Raw data directory
#' @param from a directory of task folders
#' @param to a directory where raw data files are to be copied to
#' @param pattern a string pattern identifying a specific
#'     type of raw data file (e.g. .edat2).
#' @param subj.list a file path to a list of subjects who completed
#'     the entire study. (Default: NULL).
#' @param remove logical. Should the files in the 'from' directory
#'     be deleted? (Default: FALSE)
#' @export
#'

copy_raw <- function(from, to, pattern, subj.list = NULL, remove = FALSE){

  dirs <- list.dirs(from, full.names = FALSE, recursive = FALSE)
  for (task_dir in dirs){
    files <- list.files(paste(from, task_dir, sep = "/"), pattern = pattern, recursive = TRUE, full.names = TRUE)
    if (length(files)>0){
      task <- stringr::str_split(task_dir, ". ")
      if (length(task[[1]])==1){
        task <- task[[1]][1]
      } else {
        task <- task[[1]][2]
      }
      copy_dir <- paste(to, task, sep = "/")
      if (dir.exists(copy_dir)==TRUE){
        file.copy(files, copy_dir, copy.date = TRUE)
      } else {
        dir.create(copy_dir)
        file.copy(files, copy_dir, copy.date = TRUE)
      }
      if (remove==TRUE){
        file.remove(files)
      }
    }
  }
}
