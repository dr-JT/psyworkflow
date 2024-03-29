% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/duplicates_check.R
\name{duplicates_check}
\alias{duplicates_check}
\title{Check and Remove Duplicate IDs}
\usage{
duplicates_check(
  x,
  id = "Subject",
  unique = c("SessionDate", "SessionTime"),
  n = 1,
  remove = TRUE,
  keep_by = c("none", "first date"),
  save_as = NULL
)
}
\arguments{
\item{x}{dataframe}

\item{id}{Subject ID variable name.}

\item{unique}{Column names that are unique and should be used to
check for duplicate id's (session date and/or time)}

\item{n}{Number of unique id's expected (default: 1). More than 1 if data
file contains multiple sessions per subject id}

\item{remove}{logical. Remove duplicate ids from data? (default: TRUE)}

\item{keep_by}{If remove = TRUE, should one or more of the dupilcate id's be kept?
options: "none", "first date"}

\item{save_as}{Folder path and file name to output the duplicate ID's}
}
\description{
Checks and removes duplicate subject ids that can happen when misentered
during task administration
}
