#' Sync to an OSF project
#'
#' This function will sync to an existing OSF project
#' @param tokenid name associated with token file stored on Server (otherwise your token password)
#' @param tokentype file or password (default = file)
#' @keywords osf
#' @export
#' @examples
#'

update_osf <- function(components, tokenid, tokentype = "file"){

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
  overwrite_comp <- components[which(components %in% osf_components$name)]


  osf_files <- list()
  osf_folders <- list()
  for (comp in overwrite_comp){
    osf_comp <- dplyr::filter(osf_components, name == comp)

    osf_files <- osfr::osf_ls_files(osf_comp, type = "files")
    local_files <- list.files(comp, recursive = TRUE)
    remove <- osf_files$name[which(!(osf_files$name %in% local_files))]
    for (file in remove){
      rm_file <- dplyr::filter(osf_files, name == file)
      osfr::osf_rm(rm_file)
    }

   i <- legnth(overwrite_comp)
   osf_dir <- osf_components
   sub <- overwrite_comp
   whlie (i > 0) {
     dir <- sub[i]
     osf_sub <- dplyr::filter(osf_dir, name = dir)

     osf_files <- osfr::osf_ls_files(osf_sub, type = "files")
     remove <- osf_files$name[which(!(osf_files$name %in% local_files))]
     for (file in remove){
       rm_file <- dplyr::filter(osf_files, name == file)
       osfr::osf_rm(rm_file)
     }

     osf_folders <- osfr::osf_ls_files(osf_sub, type = "folders")
     n <- nrow(osf_folders)
     if (n==0){
       i <- i - 1
       next
     }

     for (j in seq_along(1:n)){
       osf_subfolder <- osf_folders[j,]

       osf_files <- osfr::osf_ls_files(osf_subfolder, type = "files")
       remove <- osf_files$name[which(!(osf_files$name %in% local_files))]
       for (file in remove){
         rm_file <- dplyr::filter(osf_files, name == file)
         osfr::osf_rm(rm_file)
       }
     }





   }



   osf_folders <- osfr::osf_ls_files(osf_comp, type = "folders")
   n <- nrow(osf_folders)
   if (n==0) break

   osf_subfolders <- list()
   for (i in seq_along(nrow(osf_folders))){
     osf_folder <- osf_folders[i,]

   }

   i <- 0
   repeat {
     i <- i + 1
     osf_folders[[i]] <- osfr::osf_ls_files(osf_comp, type = "folders")
     n <- nrow(osf_folders[[i]])
     if (n==0) break
   }


   if (n==0) break

   while (n > 0){

   }

   for (folder in osf_folders$name){
     osf_folder <- dplyr::filter(osf_folders, name == folder)

     osf_files <- osfr::osf_ls_files(osf_folder, type = "files")
     remove <- osf_files$name[which(!(osf_files$name %in% local_files))]
     for (file in remove){
       rm_file <- dplyr::filter(osf_files, name == file)
       osfr::osf_rm(rm_file)
     }

     osf_subfolders <- osfr::osf_ls_files(osf_folder, type = "folders")
     n <- nrow(osf_subfolders)
     if (n==0) break

   }
  }
}


