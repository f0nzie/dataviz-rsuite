ace_rsuite <- find_rsuite_root()
lib_path  <- file.path(ace_rsuite, "libs")
sbox_path <- file.path(ace_rsuite, "sbox")
if (!file.exists(lib_path)) {
  lib_path <- file.path(find_rsuite_root(), "deployment", "libs")
  sbox_path <- file.path(find_rsuite_root(), "deployment", "sbox")
}

if (!dir.exists(sbox_path)) {
  dir.create(sbox_path, recursive = T)
}

.libPaths(c(normalizePath(sbox_path), normalizePath(lib_path), .libPaths()))

library(logging)
logging::logReset()
logging::setLevel(level = "INFO")
logging::addHandler(logging::writeToConsole, level = "FINEST")

log_fpath <- (function() {
  log_file <- gsub("-", "_", sprintf("%s.log", Sys.Date()))
  log_dir <- normalizePath(file.path(find_rsuite_root(), "logs"))
  fpath <- file.path(log_dir, log_file)
  if (file.exists(fpath) && file.access(fpath, 2) == -1) {
    fpath <- paste0(fpath, ".", Sys.info()[["user"]])
  }
  return(fpath)
})()

log_dir <- normalizePath(file.path(find_rsuite_root(), "logs"))
if (dir.exists(log_dir)) {
  logging::addHandler(logging::writeToFile, level = "FINEST", file = log_fpath)
}

script_path <- getwd()

args_parser <- function() {
  args <- commandArgs(trailingOnly = FALSE)
  list(
    get = function(name, required = TRUE,  default = NULL) {
      prefix <- sprintf("--%s=", name)
      value <- sub(prefix, "", args[grep(prefix, args)])

      if (length(value) != 1 || is.null(value)) {
        if (required) {
          logerror("--%s parameter is required", name)
          stop(1)
        }
        return(default)
      }
      return(value)
    }
  )
}

load_config <- function() {
  config_file <- file.path(script_path, "..", "config.txt")
  if (!file.exists(config_file)) {
    templ_file <- file.path(script_path, "..", "config_templ.txt")
    if (!file.exists(templ_file)) {
      return(list())
    }
    file.copy(templ_file, config_file)
  }

  config <- read.dcf(config_file)
  if ("LogLevel" %in% colnames(config)) {
    logging::setLevel(config[, "LogLevel"])
  }

  config_lst <- as.list(config)
  names(config_lst) <- colnames(config)

  return(config_lst)
}
