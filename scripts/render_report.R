args <- commandArgs(trailingOnly = FALSE)
file_arg <- grep("^--file=", args, value = TRUE)

if (length(file_arg) > 0) {
  script_path <- normalizePath(sub("^--file=", "", file_arg[[1]]), mustWork = TRUE)
  repo_root <- normalizePath(file.path(dirname(script_path), ".."), mustWork = TRUE)
} else {
  repo_root <- normalizePath(getwd(), mustWork = TRUE)
}

find_quarto <- function() {
  quarto_path <- Sys.which("quarto")
  if (nzchar(quarto_path)) {
    return(quarto_path)
  }

  fallback_paths <- c(
    "/Applications/RStudio.app/Contents/Resources/app/quarto/bin/quarto",
    "/Applications/Quarto.app/Contents/MacOS/quarto"
  )

  existing_path <- fallback_paths[file.exists(fallback_paths)][1]
  if (is.na(existing_path)) {
    return("")
  }

  existing_path
}

quarto_path <- find_quarto()

if (!nzchar(quarto_path)) {
  stop("Quarto is not installed or is not available on PATH. Install Quarto before rendering.")
}

old_wd <- getwd()
on.exit(setwd(old_wd), add = TRUE)
setwd(repo_root)

status <- system2(
  quarto_path,
  args = c("render", "analysis/wildfire_absenteeism_analysis.qmd"),
  stdout = "",
  stderr = ""
)

if (!identical(status, 0L)) {
  stop("Quarto render failed with exit status ", status)
}

final_report <- file.path(repo_root, "reports", "wildfire_absenteeism_analysis.pdf")
quarto_report <- file.path(repo_root, "reports", "analysis", "wildfire_absenteeism_analysis.pdf")

if (file.exists(quarto_report)) {
  if (!dir.exists(dirname(final_report))) {
    dir.create(dirname(final_report), recursive = TRUE)
  }
  copied <- file.copy(quarto_report, final_report, overwrite = TRUE)
  if (!isTRUE(copied)) {
    stop("Rendered PDF exists, but copying it to the final report path failed.")
  }
} else if (!file.exists(final_report)) {
  stop("Quarto render completed, but the expected PDF was not found.")
}

message("Rendered final report to ", final_report)
