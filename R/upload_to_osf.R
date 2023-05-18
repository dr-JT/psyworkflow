#' Upload a directory of files to OSF
#'
#' This function makes it convenient to upload a large number of files to an
#' OSF project, particularly when there are many levels of nested sub-folders.
#' It relies on the osfr package.
#'
#' @param project An osf_tbl representation created with
#'     osfr::osf_retrieve_node()
#' @param dir A file path to a first-level directory in your local project
#'     folder. e.g., "data". Do not specifiy second-level directories
#'     e.g., "data/raw".
#'
#'     To upload files from the root project folder, specify dir = "." or leave
#'     out argument.
#' @param skip_files An array of file/folder names and pattern strings to not
#'     include in the upload to OSF. e.g., you might have a folder of "old"
#'     scripts or data files that you do not want uploaded.
#' @param conflicts This determines what happens when a file with the same name
#'     exists at the specified destination. Can be one of the following:
#'     - "error" (the default): throw an error and abort the file transfer
#'     operation.
#'     - "skip": skip the conflicting file(s) and continue transferring the
#'     remaining files.
#'     - "overwrite": replace the existing file with the transferred copy.
#' @export

upload_to_osf <- function(project = "", dir = ".", skip_files = c(),
                          conflicts = c("error", "skip", "overwrite")) {

  conflicts <- match.arg(conflicts)

  if (dir == ".") {
    upload_files <- setdiff(list.files(),
                            list.dirs(recursive = FALSE, full.names = FALSE))
    osfr::osf_upload(project, upload_files, conflicts = conflicts)
    upload_files <- c()
  }

  if (dir != ".") {
    # create directory on osf
    dir_name <- tail(stringr::str_split(dir, "/")[[1]], 1)
    osfr::osf_mkdir(project, dir_name)
    # get files to upload
    upload_files <- list.files(dir, recursive = FALSE, full.names = TRUE) |>
      stringr::str_subset(paste(skip_files, collapse = "|"), negate = TRUE)
    # proceed only if there are files in directory
    if (!identical(upload_files, character(0))) {
      # get osf object for sub directory
      osf_dir <-
        osfr::osf_ls_files(project, type = "folder") |>
        dplyr::filter(name == dir_name)
      # upload files
      osfr::osf_upload(osf_dir, upload_files, conflicts = conflicts)
    }

    upload_files <- c()
    osf_dir <- c()

    # get list of sub directories
    sub_dirs <- list.dirs(dir, recursive = TRUE, full.names = FALSE) |>
      stringr::str_subset(paste(skip_files, collapse = "|"), negate = TRUE) |>
      tail(-1)
    if (!identical(sub_dirs, character(0))) {
      sub_dirs <- paste(dir_name, sub_dirs, sep = "/")
      # create sub directories on osf
      purrr::map(sub_dirs, function(x) osfr::osf_mkdir(project, x))
      # for each sub directory upload files
      for (sub_dir in sub_dirs) {
        # get files to upload
        upload_files <- list.files(sub_dir, recursive = FALSE, full.names = TRUE) |>
          stringr::str_subset(paste(skip_files, collapse = "|"),  negate = TRUE)
        # proceed only if there are files in sub directory
        if (!identical(upload_files, character(0))) {
          # get osf object for sub directory
          osf_dir <-
            osfr::osf_ls_files(project,
                               path =
                                 stringr::str_flatten(
                                   head(stringr::str_split(sub_dir, "/")[[1]],
                                        -1), collapse = "/"
                                   )) |>
            dplyr::filter(name ==
                            tail(stringr::str_split(sub_dir, "/")[[1]], 1))
          # upload files
          osfr::osf_upload(osf_dir, upload_files, conflicts = conflicts)
        }

        upload_files <- c()
        osf_dir <- c()
      }
    }
  }
}
