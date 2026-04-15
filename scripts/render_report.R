args <- commandArgs(trailingOnly = FALSE)
file_arg <- grep("^--file=", args, value = TRUE)

if (length(file_arg) > 0) {
  script_path <- normalizePath(sub("^--file=", "", file_arg[[1]]), mustWork = TRUE)
  repo_root <- normalizePath(file.path(dirname(script_path), ".."), mustWork = TRUE)
} else {
  repo_root <- normalizePath(getwd(), mustWork = TRUE)
}

quarto_path <- Sys.which("quarto")

if (!nzchar(quarto_path)) {
  stop("Quarto is not installed or is not available on PATH. Install Quarto before rendering.")
}

old_wd <- getwd()
on.exit(setwd(old_wd), add = TRUE)
setwd(repo_root)

status <- system2(
  quarto_path,
  args = c("render", "analysis/initial_EDA.qmd"),
  stdout = "",
  stderr = ""
)

if (!identical(status, 0L)) {
  stop("Quarto render failed with exit status ", status)
}

message("Rendered report outputs to ", file.path(repo_root, "reports"))
