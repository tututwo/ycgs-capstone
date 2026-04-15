args <- commandArgs(trailingOnly = FALSE)
file_arg <- grep("^--file=", args, value = TRUE)

if (length(file_arg) > 0) {
  script_path <- normalizePath(sub("^--file=", "", file_arg[[1]]), mustWork = TRUE)
  repo_root <- normalizePath(file.path(dirname(script_path), ".."), mustWork = TRUE)
} else {
  repo_root <- normalizePath(getwd(), mustWork = TRUE)
}

force_download <- "--force" %in% commandArgs(trailingOnly = TRUE)
target_dir <- file.path(repo_root, "data", "raw", "cde_attendance")
dir.create(target_dir, recursive = TRUE, showWarnings = FALSE)

sources <- data.frame(
  file_name = c(
    "chronicabsenteeism18.txt",
    "chronicabsenteeism19.txt",
    "absenteeismreason18.txt",
    "absenteeismreason19.txt"
  ),
  url = c(
    "https://www3.cde.ca.gov/demo-downloads/attendance/chronicabsenteeism18.txt",
    "https://www3.cde.ca.gov/demo-downloads/attendance/chronicabsenteeism19.txt",
    "https://www3.cde.ca.gov/demo-downloads/attendance/absenteeismreason18.txt",
    "https://www3.cde.ca.gov/demo-downloads/attendance/absenteeismreason19.txt"
  ),
  stringsAsFactors = FALSE
)

for (i in seq_len(nrow(sources))) {
  destination <- file.path(target_dir, sources$file_name[[i]])

  if (file.exists(destination) && !force_download) {
    message("Skipping existing file: ", destination)
    next
  }

  message("Downloading ", sources$url[[i]])
  download.file(
    url = sources$url[[i]],
    destfile = destination,
    mode = "wb",
    quiet = FALSE
  )
}

message("CDE attendance files are available in ", target_dir)
