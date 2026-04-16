# Reproducible Workflow

## 1. Install Dependencies

Use the conda environment:

```bash
conda env create -f environment.yml
conda activate ycgs-capstone
```

The workflow requires R, Quarto, and these R packages: `tidyverse`, `janitor`, `scales`, and `sf`. The helper scripts can use Quarto from `PATH` or the Quarto binary bundled with RStudio on macOS.

## 2. Check Project Files

Run:

```bash
Rscript scripts/check_environment.R
```

This checks R package availability, Quarto availability, and required repository files.

## 3. Download Public CDE Attendance Files

The analysis can read CDE files directly from official URLs. To cache local copies first, run:

```bash
Rscript scripts/download_cde_data.R
```

The files are saved to `data/raw/cde_attendance/`. Existing files are skipped unless you pass `--force`:

```bash
Rscript scripts/download_cde_data.R --force
```

## 4. Render The Report

Run:

```bash
Rscript scripts/render_report.R
```

Rendered output is written to `reports/wildfire_absenteeism_analysis.pdf`. The top-level PDF is the canonical review artifact.

## 5. Main Output

Review:

- `reports/wildfire_absenteeism_analysis.pdf`
- `communication/final_summary.md`
- `docs/rubric_alignment.md`
