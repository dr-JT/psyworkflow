#' Build a new OSF project
#'
#' This function will build a new OSF project
#' @param title name of project to build on OSF
#' @param tokenid name associated with token file stored on Server (otherwise your token password)
#' @param tokentype file or password (default = file)
#' @keywords osf
#' @export
#' @examples
#'

build_osf <- function(title, tokenid, tokentype = "file"){

  if (tokentype == "file"){
    download.file(paste("http://englelab.gatech.edu/R/osf_tokens/osf_token_", tokenid, ".rds", sep = ""), "token_temp.rds")
    token <- readRDS("token_temp.rds")
    file.remove("token_temp.rds")
  }
  if (tokentype == "password"){
    token <- tokenid
  }
  osfr::osf_auth(token)

  osf_project <- osfr::osf_create_project(title)
  saveRDS(osf_project, "osf_project.rds")
}
