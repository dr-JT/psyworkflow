#' Check and Remove Duplicate IDs
#'
#' Checks and removes duplicate subject ids that can happen when misentered
#' during task administration
#' @param x dataframe
#' @param unique_id Column name(s) that should be uniquely identified and will be used to check for
#'     duplicate id's grouped by these columns (e.g., "Subject", c("Subject, Session))
#' @param date_time Column names that uniquely identify a testing administration.
#'     (e.g., "Date", "Time"). Can also be: "none" or NULL
#' @param n Number of unique id's expected (default: 1).
#' @param remove logical. Remove duplicate ids from data? (default: TRUE)
#' @param keep_by Which duplicate id should be kept?
#'     options: "none", "first date_time", "least missing"
#' @param save_as Folder path and file name to output the duplicate ID's
#' @param id deprecated. Use unique_id instead.
#' @param unique deprecated. Use date_time instead.
#' @export

duplicates_check <- function(x,
                             unique_id = "Subject",
                             date_time = c("SessionDate", "SessionTime"),
                             n = 1, remove = TRUE,
                             keep_by = c("none", "first date_time", "least missing"),
                             save_as = NULL,
                             id = "Subject",
                             unique = c("SessionDate", "SessionTime")) {
  # deprecated arguments
  if (!missing(id) | missing(unique_id)) {
    message("duplicates_check: 'id' argument is deprecated. Use 'unique_id' instead.")
    unique_id <- id
  }

  if (!missing(unique) | missing(date_time)) {
    message("duplicates_check: 'unique' argument is deprecated. Use 'date_time' instead.")
    date_time <- unique
  }

  keep_by <- match.arg(keep_by)

  if (keep_by == "missing") keep_by <- "least missing"
  if (keep_by == "first date") keep_by <- "first date_time"
  
  # get duplicate ids
  if ("none" %in% date_time | is.null(date_time)) {
    duplicates <- x |>
      dplyr::mutate(.by = unique_id, count = dplyr::n()) |>
      dplyr::filter(count > n) |>
      dplyr::select(-count)
  } else {
    duplicates <- dplyr::select(x, dplyr::all_of(unique_id), dplyr::all_of(date_time))
    duplicates <- dplyr::distinct(duplicates)
    duplicates <- dplyr::group_by(duplicates, dplyr::across(unique_id))
    duplicates <- dplyr::mutate(duplicates, count = dplyr::n())
    duplicates <- dplyr::ungroup(duplicates)
    duplicates <- dplyr::filter(duplicates, count > n)
    duplicates <- dplyr::select(duplicates, -count)
    duplicates <- dplyr::right_join(x, duplicates, by = c(unique_id, date_time))
  }

  # save duplicates to file
  if (!is.null(save_as)) {
    if (nrow(duplicates) > 0) {
      folder <- dirname(save_as)
      if (dir.exists(folder) == FALSE) {
        dir.create(folder, showWarnings = FALSE)
      }
      readr::write_csv(duplicates, save_as)
    }
  }

  # remove duplicates
  if (nrow(duplicates) > 0) {

    if (keep_by == "none") {
      remove_duplicates <- duplicates

      suppressMessages(
        ids_kept <- dplyr::anti_join(duplicates, remove_duplicates) |>
          dplyr::select(dplyr::all_of(unique_id), dplyr::any_of(date_time))
      )

      if (remove == TRUE) {
        x <- dplyr::anti_join(x, remove_duplicates, by = unique_id)
        message("duplicates_check: Duplicate IDs found AND removed!")
      }
    }
    if (keep_by == "first date_time") {
      remove_duplicates <- dplyr::group_by(duplicates, dplyr::across(unique_id))
      remove_duplicates <- dplyr::arrange(remove_duplicates, dplyr::across(date_time))
      remove_duplicates <- dplyr::slice(remove_duplicates, -1)

      suppressMessages(
        ids_kept <- dplyr::anti_join(duplicates, remove_duplicates) |>
          dplyr::select(dplyr::all_of(unique_id), dplyr::any_of(date_time))
      )

      if (remove == TRUE) {
        suppressMessages(
          x <- dplyr::anti_join(x, remove_duplicates)
        )
        message("duplicates_check: Kept duplicate that occured first by date.",
                " ALL others were removed.")
      }

    }
    if (keep_by == "least missing") {
      dup_missing <- duplicates |>
        dplyr::mutate(missing = rowSums(dplyr::across(dplyr::everything(), ~ is.na(.x)))) |>
        dplyr::select(dplyr::all_of(unique_id), dplyr::any_of(date_time), missing)

      remove_duplicates <- dup_missing |>
        dplyr::group_by(dplyr::across(unique_id)) |>
        dplyr::slice_min(missing, with_ties = TRUE) |>
        dplyr::ungroup()

      ids_kept <- dplyr::select(remove_duplicates, dplyr::all_of(unique_id), dplyr::any_of(date_time), missing)

      suppressMessages(
        remove_duplicates <- dplyr::anti_join(dup_missing, remove_duplicates)
      )
      if (remove == TRUE) {
        suppressMessages(
          x <- dplyr::anti_join(x, remove_duplicates)
        )
        message("duplicates_check: Kept duplicate that had the least missing data.",
                " Duplicates with the same amount of missing data were NOT removed.",
                " ALL others were removed.")
      }
    }

    ids_removed <- dplyr::select(remove_duplicates, dplyr::all_of(unique_id), dplyr::any_of(date_time), dplyr::any_of("missing"))

    if (remove == FALSE) {
      message("duplicates_check: Duplicate IDs found BUT not removed!")
      print(ids_removed)
    } else {
      message("-- Duplicates Removed --")
      print(ids_removed)

      message("-- Duplicates Kept --")
      print(ids_kept)

      ids_warning <- dplyr::anti_join(ids_kept, ids_removed, by = unique_id)
      if (nrow(ids_warning) > 0) {
        message("-- WARNING: Some duplicates remain in the data --")
        print(ids_warning)
      }
    }

  } else {
    message("duplicates_check: No duplicate IDs found!")
  }
  return(x)
}
