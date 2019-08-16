# Detect proper script_path (you cannot use args yet as they are build with tools in set_env.r)
script_path <- (function() {
  args <- commandArgs(trailingOnly = FALSE)
  script_path <- dirname(sub("--file=", "", args[grep("--file=", args)]))
  if (!length(script_path)) {
    return("R")
  }
  if (grepl("darwin", R.version$os)) {
    base <- gsub("~\\+~", " ", base) # on MacOS ~+~ in path denotes whitespace
  }
  return(normalizePath(script_path))
})()

# Setting .libPaths() to point to libs folder
source(file.path(script_path, "set_env.R"), chdir = T)

config <- load_config()
args <- args_parser()


#########################################################################

library(dataviz.pkgs)

# Rscript -e "bookdown::render_book(input = 'index.Rmd', output_format = 'bookdown::gitbook', config_file = '_bookdown_draft.yml')"

loginfo("--> Pandoc version: %s", rmarkdown::pandoc_version())

book_src_dir <- file.path(rprojroot::find_rstudio_root_file(), "work", "dataviz")
setwd(book_src_dir)

bookdown::render_book(input = 'index.Rmd', output_format = 'bookdown::gitbook',
                      config_file = '_bookdown_draft.yml')

