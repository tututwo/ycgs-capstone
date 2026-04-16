# Rubric Alignment

## GitHub Repository Submission

- Repository has a clear folder structure: `analysis/`, `data/`, `docs/`, `reports/`, `scripts/`, `communication/`, and `archive/`.
- Main analysis artifact is easy to find at `analysis/wildfire_absenteeism_analysis.qmd`.
- Rendered report is easy to find at `reports/wildfire_absenteeism_analysis.pdf`.
- Final figures and generated tables are separated from source notebooks under `reports/figures/` and `reports/tables/`.
- Repository history should show multiple meaningful commits after this cleanup.

## Datasets Included

- The primary school closure dataset and codebook are included in `data/raw/school_fire/`.
- CDE attendance datasets are public, linked in `docs/data_provenance.md`, and downloadable through `scripts/download_cde_data.R`.
- Metadata and data dictionaries are included in `data/metadata/`.

## Project Notebook

- `analysis/wildfire_absenteeism_analysis.qmd` contains the full Quarto/R workflow.
- The notebook documents loading, cleaning, exploratory analysis, joins, visualizations, sensitivity checks, and limitations.
- Relative paths were updated for the reorganized repository.

## README Summary

- `README.md` opens with a concise findings summary of roughly 50 words.
- The README identifies the project question, data sources, workflow, interpretation, citation, and license.

## Project Clarity And Reproducibility

- `docs/workflow.md` gives step-by-step reproduction instructions.
- `docs/ethics.md` documents privacy, governance, and bias considerations.
- `environment.yml` defines the R/Quarto environment.
- `scripts/check_environment.R` checks local prerequisites.
- `scripts/render_report.R` renders the report.
- `docs/limitations.md` documents interpretation caveats.
