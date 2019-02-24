#' Sync to an OSF project
#'
#' This function will sync to an existing OSF project
#' @param tokenid name associated with token file stored on Server (otherwise your token password)
#' @param tokentype file or password (default = file)
#' @keywords osf
#' @export
#' @examples
#'

sync_osf <- function(components, tokenid, tokentype = "file"){

  if (type == "file"){
    download.file(paste("http://englelab.gatech.edu/R/osf_tokens/osf_token_", tokenid, ".rds", sep = ""), "token_temp.rds")
    token <- readRDS("token_temp.rds")
    file.remove("token_temp.rds")
  }
  if (type == "password"){
    token <- tokenid
  }
 osfr::osf_auth(token)

 ## Update project with most current from OSF site
 osf_project <- readRDS("osf_project.rds")
 projectid <- osf_project$id[1]
 osf_project <- osfr::osf_retrieve_node(osf_p)

 ## Get a list of files, in each subdirectory and subcomponent
 osf_components <- osfr::osf_ls_nodes(osf_project)
 overwrite <- components[which(components %in% osf_components$name)]
 osf_folders <- list()
 for (comp in overwrite){
   osf_folders[[comp]] <- osfr::osf_ls_files(osf_components[which(osf_components$name==comp)])
 }

}


