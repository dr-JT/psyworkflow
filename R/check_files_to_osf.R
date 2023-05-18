#' Check which files will be uploaded to OSF
#'
#' Verify that the file/folder names and pattern strings specificed in
#' upload_to_osf(skip_files = c()) argument will only upload the files you want
#' to upload.
#'
#' @param dir A file path to a first-level directory in your local project
#'     folder. e.g., "data". Do not specifiy second-level directories
#'     e.g., "data/raw".
#'
#'     To upload files from the root project folder, specify dir = "." or leave
#'     out argument.
#' @param skip_files An array of file/folder names and pattern strings to not
#'     include in the upload to OSF. e.g., you might have a folder of "old"
#'     scripts or data files that you do not want uploaded.
#' @param recursive Search files recursively? Set to FALSE if you only want the
#'     files in a first-level directory and not any further sub-directories.
#'     e.g., "data" or ".".
#' @export

check_files_to_osf <- function(dir = ".", skip_files = c(), recursive = TRUE) {
  list.files(dir, recursive = recursive, full.names = FALSE) |>
    setdiff(list.dirs(recursive = FALSE, full.names = FALSE)) |>
    stringr::str_subset(paste(skip_files, collapse = "|"),  negate = TRUE)
}
