#' Bind Multiple Files
#'
#' Binds multiple files in the same directory into a single data frame.
#' Bind can occur by "rows" or "columns".
#' @param path Folder location of files to be binded
#' @param pattern Pattern to identify files to be binded
#' @param delim Delimiter used in files. Passed onto `readr::read_delim()`
#' @param bind Bind "rows" or "columns"?
#' @param output_file File name and path to be saved to.
#' @param source If data file comes from a specific software specify it here
#'     for better support. Currently supports "eprime".
#' @export
#'

files_bind <- function(path = "", pattern = "", delim = ",", bind = "rows",
                       output_file = "", source = "") {

  filelist <- list.files(path = path, pattern = pattern, full.names = TRUE)
  import <- list()
  for (i in seq_along(filelist)) {
    if (source == "eprime") {
      delim <- "\t"
      import[[i]] <- tryCatch(
        {
          readr::read_delim(filelist[[i]],
                            delim,
                            escape_double = FALSE,
                            trim_ws = TRUE,
                            na = "NULL")
        },
        error = function(err) {
          uni <- readr::read_delim(filelist[[i]],
                                   locale = readr::locale(encoding = "UCS-2LE"),
                                   delim,
                                   escape_double = FALSE,
                                   trim_ws = TRUE,
                                   na = "NULL")
          return(uni)
        }
      )
    }

    if (delim == ",") {
      import[[i]] <- readr::read_csv(filelist[[i]])
    }

    if (delim != "," & source == "") {
      import[[i]] <- readr::read_delim(filelist[[i]],
                                       delim,
                                       escape_double = FALSE,
                                       trim_ws = TRUE)
    }
  }

  if (bind == "rows") {
    bound <- dplyr::bind_rows(import)
  }
  if (bind == "columns" | bind == "cols") {
    bound <- dplyr::bind_cols(import)
  }

  if (output_file != "") {
    readr::write_csv(bound, output_file)
  }

  return(bound)
}
