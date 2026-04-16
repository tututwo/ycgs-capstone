# Rubric Reorganization Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Reorganize the capstone repository so the Quarto/R project is easy to navigate, documented, reproducible, and aligned with the provided capstone rubrics.

**Architecture:** Keep `analysis/wildfire_absenteeism_analysis.qmd` as the primary executable analysis. Move raw data, metadata, reports, documentation, scripts, communication products, and archived scratch work into clearly named top-level folders.

**Tech Stack:** Quarto, R, tidyverse, janitor, scales, sf, conda environment file, GitHub repository documentation.

---

### Task 1: Repository Structure

**Files:**
- Move the old EDA notebook to `analysis/wildfire_absenteeism_analysis.qmd`
- Move the old rendered PDF to `reports/wildfire_absenteeism_analysis.pdf`
- Move: `school_fire_data/*` to `data/raw/school_fire/`
- Move: `absenteeism_data/*metadata.md` to `data/metadata/`
- Move: scratch and LLM files to `archive/`

- [x] Create rubric-aligned top-level folders.
- [x] Move primary Quarto workflow into `analysis/`.
- [x] Move rendered PDF into `reports/`.
- [x] Move raw data and metadata into `data/`.
- [x] Archive scratch work and LLM notes.

### Task 2: Quarto Path Updates

**Files:**
- Modify: `analysis/wildfire_absenteeism_analysis.qmd`

- [x] Update the closure CSV path to `data/raw/school_fire/annual_school_closures_standardized_test_scores_ca_2003_2019.csv`.
- [x] Update CDE local file resolution to `data/raw/cde_attendance/`.
- [x] Preserve official CDE URL fallback behavior.

### Task 3: Documentation And Reproducibility

**Files:**
- Create: `README.md`
- Create: `docs/data_provenance.md`
- Create: `docs/workflow.md`
- Create: `docs/rubric_alignment.md`
- Create: `docs/limitations.md`
- Create: `environment.yml`
- Create: `CITATION.cff`
- Create: `LICENSE`

- [x] Add ~50-word findings summary to the README.
- [x] Document the project question, data sources, workflow, methods, and interpretation limits.
- [x] Add citation and license files.
- [x] Add conda environment file.

### Task 4: Utility Scripts

**Files:**
- Create: `scripts/download_cde_data.R`
- Create: `scripts/check_environment.R`
- Create: `scripts/render_report.R`

- [x] Add a script to download the four public CDE attendance files.
- [x] Add a script to check required R packages, Quarto, and project files.
- [x] Add a script to render the Quarto report.

### Task 5: Verification

**Files:**
- Review: repository tree, README links, Quarto path references, R scripts

- [x] Run file-tree and path-reference checks.
- [x] Run `Rscript scripts/check_environment.R` and report actual result: R packages and files are present, but Quarto is not installed on PATH in this local environment.
- [x] Run R syntax checks for utility scripts.
- [x] Report if Quarto rendering cannot be verified in the local environment.
