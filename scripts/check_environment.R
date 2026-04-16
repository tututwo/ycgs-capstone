args <- commandArgs(trailingOnly = FALSE)
file_arg <- grep("^--file=", args, value = TRUE)

if (length(file_arg) > 0) {
  script_path <- normalizePath(sub("^--file=", "", file_arg[[1]]), mustWork = TRUE)
  repo_root <- normalizePath(file.path(dirname(script_path), ".."), mustWork = TRUE)
} else {
  repo_root <- normalizePath(getwd(), mustWork = TRUE)
}

required_packages <- c("tidyverse", "janitor", "scales", "sf")
missing_packages <- required_packages[!vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)]

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

required_files <- c(
  "analysis/wildfire_absenteeism_analysis.qmd",
  "data/raw/school_fire/annual_school_closures_standardized_test_scores_ca_2003_2019.csv",
  "data/raw/school_fire/codebook_school_closures_standardized_test_scores_ca_2003_2019.docx",
  "data/metadata/cde_chronic_absenteeism_metadata.md",
  "data/metadata/cde_absenteeism_by_reason_metadata.md",
  "docs/data_provenance.md",
  "docs/workflow.md",
  "docs/ethics.md",
  "docs/limitations.md",
  "docs/rubric_alignment.md",
  "communication/final_summary.md",
  "reports/wildfire_absenteeism_analysis.pdf",
  "reports/figures/wildfire_absenteeism_map.png",
  "reports/figures/wildfire_absenteeism_relationship.png",
  "reports/tables/statewide_by_year.csv",
  "reports/tables/statewide_share.csv",
  "README.md",
  "environment.yml"
)

missing_files <- required_files[!file.exists(file.path(repo_root, required_files))]
quarto_path <- find_quarto()

message("R version: ", getRversion())
message("Repository root: ", repo_root)

if (nzchar(quarto_path)) {
  message("Quarto: ", quarto_path)
} else {
  message("Quarto: not found on PATH or supported fallback locations")
}

if (length(missing_packages) > 0) {
  message("Missing R packages: ", paste(missing_packages, collapse = ", "))
}

if (length(missing_files) > 0) {
  message("Missing required files: ", paste(missing_files, collapse = ", "))
}

if (length(missing_packages) > 0 || length(missing_files) > 0 || !nzchar(quarto_path)) {
  quit(status = 1)
}

message("Environment check passed.")
