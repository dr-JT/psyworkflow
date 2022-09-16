#' Copy raw data files from one direcoty to another
#'
#' This function will automatically copy files from the Task directory to
#' the Raw data directory
#' @param from a directory of task folders
#' @param to a directory where raw data files are to be copied to
#' @param filetype a string pattern identifying a specific
#'     type of raw data file (e.g. .edat2).
#' @param sub_folder optional. do you want to copy files to a sub folder within
#'     the `to = ` directory?
#' @param task_dir.names Relationship between task name and task folder name.
#'     Default is "numbered". Alternative options are; "asis".
#' @param remove logical. Should the files in the 'from' directory
#'     be deleted? (Default: FALSE)
#' @param copy logical. Do you want to copy the files? (Default = TRUE)
#' @export
#'

copy_raw <- function(from, to, filetype, sub_folder = NULL,
                     task_dir.names = "numbered",
                     remove = FALSE, copy = TRUE) {

  # function to remove trailing slashes at the end of file paths
  remove_slash <- function(x, pattern = "/") {
    if (stringr::str_ends(x, pattern)) {
      x <- substr(x, 1, nchar(x) - 1)
    }
    return(x)
  }

  if (copy == TRUE) {

    if (!is.list(task_dir.names)) {
      # get list of task folders
      dirs <- list.dirs(from, full.names = FALSE, recursive = FALSE)
      if (identical(dirs, character(0))) dirs <- ""
      for (task_dir in dirs) {
        # get list of data files within a task folder
        files <- list.files(paste(from, task_dir, sep = "/"), pattern = filetype,
                            recursive = TRUE, full.names = TRUE)

        files <- lapply(files, remove_slash)

        # only continue if there are files in the folder
        if (length(files) > 0) {

          # remove numbers or keep as is for new copied task folder
          if (task_dir.names == "numbered") {
            task <- strsplit(task_dir, "\\. ")[[1]][2]

            # extra stuff just making sure the task folder is named correctly
            if (length(task[[1]]) == 1) {
              task <- task[[1]][1]
            } else {
              task <- task[[1]][2]
            }
          }
          if (task_dir.names == "asis") {
            task <- task_dir
          }

          # create file paths for where to copy files
          to_dir <- paste(to, task, sep = "/")

          to_dir <- remove_slash(to_dir)

          if (dir.exists(to_dir) == FALSE) {
            dir.create(to_dir)
          }
          # if needed, extend files paths to a sub folder
          if (!is.null(sub_folder)) {
            to_dir <- paste(to_dir, sub_folder, sep = "/")
            if (dir.exists(to_dir) == FALSE) {
              dir.create(to_dir)
            }
          }
          # create a temporary directory for duplicates
          dup_dir <- paste(to_dir, "/dup", sep = "")
          if (dir.exists(dup_dir) == FALSE) {
            dir.create(dup_dir)
          }

          # check for duplicate file names in copy to directory
          check_files <- list.files(to_dir, pattern = filetype,
                                    recursive = FALSE, full.names = FALSE)
          duplicated_n <- 0
          for (file in files) {
            # get file name and check for duplicates
            filename <- strsplit(file, "/")[[1]][length(strsplit(file, "/")[[1]])]
            duplicate <-
              length(which(lapply(filename, grepl, x = check_files)[[1]] == TRUE))
            if (duplicate >= 1) {
              duplicated_n <- duplicated_n + 1
              # copy file to temporary directory and rename as a duplicate
              file.copy(file, dup_dir, copy.date = TRUE)
              new_filename <-
                paste("DUPLICATED (", duplicate, ") ", filename, sep = "")
              file_from <- list.files(dup_dir, filename, full.names = TRUE)
              file_to <- paste(dup_dir, new_filename, sep = "/")
              file.rename(file_from, file_to)
              # copy renamed file to copy to directory and remove from files
              file.copy(file_to, to_dir, copy.date = TRUE)
              file.remove(file_to)
              files <- files[-which(file == files)]
            }
          }

          unlink(dup_dir, recursive = TRUE)

          # copy over files
          file.copy(files, to_dir, copy.date = TRUE)

          cat("   ", "\n")
          cat("-----------------------------------------", "\n")
          cat("Task: ", task, "\n")
          cat("Files Copied: ", length(files), "\n")
          cat("Duplicate Subject Files: ", duplicated_n, "\n")
          cat("-----------------------------------------", "\n")

          if (remove == TRUE) {
            file.remove(files)
          }
        }
      }
    }
    if (is.list(task_dir.names)) {

    }
  }
  else {
    if (remove == TRUE) {
      dirs <- list.dirs(from, full.names = FALSE, recursive = FALSE)
      for (task_dir in dirs) {
        files <- list.files(paste(from, task_dir, sep = "/"), pattern = filetype,
                            recursive = TRUE, full.names = TRUE)

        file.remove(files)
      }
    }
  }

  cat("   ", "\n")
  cat("-----------------------------------------", "\n")
  cat("Done!", "\n")
  cat("-----------------------------------------", "\n")
}
