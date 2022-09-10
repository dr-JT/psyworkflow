# psyworkflow

An R package to aid in the **workflow** of data processing steps common in psychological research

## Install

```r
devtools::install_github("dr-JT/psyworkflow")
```

## Usage

This package has been developed specifically to aid in my own workflow in psychological research on individual differences in cognitive abilities. You may, however, find it applicable to your own research workflow.

Most of the functions are designed to easily and quickly get you through some preliminary data processing steps so you can get to work on processing and analyzing your data.

- **R project template**

    Create a research project directory with folders and R script templates:
    
    File -> New Project
    
- **Download R script templates**

    R script templates can be downloaded with `get_template()`

- **Organize files from different computers**

    I often collect data on multiple computers on a battery of cognitive tasks. The `copy_raw()` function helps to get all the files for each task, organized on multiple computers, into one location (usually a network drive or shared folder on a cloud storage system). 
    
- **Bind multiple data files together**

    Typically, you start out with individual data files for each subject. The first step, then, is to bind those individual data files into one large data file that contains the data for all subjects for a single task. The `files_bind()` function will bind (stack) the rows for multiple data files with the same column names.

- **Check for duplicate subject ID's in your data files**

    In large data collection efforts it is not uncommon that subject ID's will occasionally get entered incorrectly when adminstering a task. The `duplicates_check()` function will check for duplicate subject ID's, remove them, and save them to a file so you can sort them out later. 
    
- **Join multiple data files together**

    You start out with seperate data files for each task but at some point you will likely want to join (merge) the data files from multiple tasks into one data file that is ready for statistical analysis. The `files_join()` function will join (merge) multiple data files that have a common id column (e.g., Subject).


