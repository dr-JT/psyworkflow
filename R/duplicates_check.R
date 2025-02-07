#' Check and Remove Duplicate IDs
#'
#' Checks and removes duplicate subject ids that can happen when misentered
#' during task administration
#' @param x dataframe
#' @param id Column name that SHOULD be unique and will be used to check for
#'     duplicate id's grouped by these columns (e.g., "Subject", c("Subject, Session))
#' @param date_time Column names that uniquely identify a testing administration
#'     (e.g., "SessionDate", "SessionTime").
#' @param n Number of unique id's expected (default: 1).
#' @param remove logical. Remove duplicate ids from data? (default: TRUE)
#' @param keep_by Which duplicate id should be kept?
#'     options: "none", "first date", "least missing"
#' @param save_as Folder path and file name to output the duplicate ID's
#' @param unique deprecated. Use date_time instead.
#' @export

duplicates_check <- function(x, id = "Subject",
                             date_time = c("SessionDate", "SessionTime"),
                             n = 1, remove = TRUE,
                             keep_by = c("none", "first date", "least missing"),
                             save_as = NULL,
                             unique = c("SessionDate", "SessionTime")) {
  keep_by <- match.arg(keep_by)

  # get duplicate ids
  if ("none" %in% date_time | is.null(date_time)) {
    duplicates <- x |>
      dplyr::mutate(.by = id, count = n()) |>
      dplyr::filter(count > n) |>
      dplyr::select(-n)
  } else {
    duplicates <- dplyr::select(x, id, dplyr::all_of(date_time))
    duplicates <- dplyr::distinct(duplicates)
    duplicates <- dplyr::group_by(duplicates, dplyr::across(id))
    duplicates <- dplyr::mutate(duplicates, count = n())
    duplicates <- dplyr::ungroup(duplicates)
    duplicates <- dplyr::filter(duplicates, count > n)
    duplicates <- dplyr::select(duplicates, -count)
    duplicates <- dplyr::right_join(x, duplicates, by = c(id, date_time))
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
      if (remove == TRUE) {
        x <- dplyr::anti_join(x, remove_duplicates, by = id)
        message("duplicates_check: Duplicate IDs found AND removed!")
      }
    }
    if (keep_by == "first date") {
      remove_duplicates <- dplyr::group_by(duplicates, dplyr::across(id))
      remove_duplicates <- dplyr::arrange(remove_duplicates, dplyr::across(date_time))
      remove_duplicates <- dplyr::slice(remove_duplicates, -1)
      if (remove == TRUE) {
        suppressMessages(x <- dplyr::anti_join(x, remove_duplicates))
        message("duplicates_check: Kept one duplicate that occured first by date.",
                " ALL others were removed.")
      }

    }
    if (keep_by == "least missing") {
      remove_duplicates <- duplicates |>
        dplyr::mutate(missing = rowSums(dplyr::across(dplyr::everything(), ~ is.na(.x)))) |>
        dplyr::group_by(dplyr::across(id)) |>
        dplyr::slice_min(missing, with_ties = TRUE) |>
        dplyr::ungroup() |>
        dplyr::select(-missing)

      suppressMessages(remove_duplicates <- dplyr::anti_join(duplicates, remove_duplicates))
      if (remove == TRUE) {
        suppressMessages(x <- dplyr::anti_join(x, remove_duplicates))
        message("duplicates_check: Kept one duplicate that had the least missing data",
                " ALL others were removed.")
      }
    }

    ids_removed <- dplyr::select(remove_duplicates, id, dplyr::any_of(date_time))

    if (remove == FALSE) {
      message("duplicates_check: Duplicate IDs found BUT not removed!")
    }

    print(ids_removed)

  } else {
    message("duplicates_check: No duplicate IDs found!")
  }
  return(x)
}
