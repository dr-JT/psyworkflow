# psyworkflow

An R package to aid in the **workflow** of getting a research project setup and convenient functions for preliminary data processing steps.

## Install

```r
devtools::install_github("dr-JT/psyworkflow")
```

## Usage

Most of the functions are designed to easily and quickly get you through some preliminary data processing steps so you can get to work on processing and analyzing your data.


### Templates

- **R project template**

    Create a research project directory with folders and R script templates:
    
    File -> New Project -> New Directory -> then choose the 'Research Study' template
    
- **Download R script templates**

    R script templates can be downloaded with `get_template()`
    
- **Download Quarto analysis template**

    R script templates can be downloaded with `get_template(analysis_script = TRUE)`
    
### Organize and process data

- **Organize files from different computers**

    We often collect data on multiple computers on a battery of cognitive tasks. The `copy_files()` function helps to get all the files for each task, organized on multiple computers, into one location (usually a network drive or shared folder on a cloud storage system). 

- **Check for duplicate subject ID's in your data files**

    In large data collection efforts it is not uncommon that subject ID's will occasionally get entered incorrectly when adminstering a task. The `duplicates_check()` function will check for duplicate subject ID's, remove them, and save them to a file so you can sort them out later. 
    
### Upload to OSF

- **Upload files to an OSF project**

    OSF does not make it easy to upload files especially when you have several leves of nested folders - you cannot upload folders directly to OSF! The `upload_to_osf() function makes it more convenient to upload multiple files and sub-folders to OSF.
    
