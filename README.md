# California Wildfire School Closures and Absenteeism

California wildfire closures in 2017-18 and 2018-19 were geographically concentrated. This project finds that missed student-days cluster in a small group of counties, while chronic absenteeism and absence-reason patterns vary across affected places. The results describe where attendance supports may be most useful after wildfire-related school disruption in California schools.

## Project Question

Where is wildfire disrupting schooling the most in 2017-18 and 2018-19, and do those same counties show higher chronic absenteeism rates?

The analysis treats wildfire missed student-days as the main burden metric: wildfire closure days multiplied by school-year enrollment. This combines duration of disruption with the number of students exposed.

## Repository Map

| Path | Purpose |
| --- | --- |
| `analysis/initial_EDA.qmd` | Primary Quarto/R workflow for loading, cleaning, analyzing, and visualizing the data. |
| `reports/initial_EDA.pdf` | Rendered report submitted as the current analysis artifact. |
| `data/raw/school_fire/` | Included school closure, enrollment, demographic, and test-score dataset plus codebook. |
| `data/raw/cde_attendance/` | Location for downloaded CDE attendance files; a small sample head file is tracked for structure reference. |
| `data/metadata/` | Data dictionaries and source notes for the CDE attendance files. |
| `docs/` | Provenance, workflow, limitations, and rubric-alignment documentation. |
| `scripts/` | Utility scripts for downloading public CDE files, checking the R/Quarto environment, and rendering the report. |
| `communication/` | Plain-language final summary for a non-technical audience. |
| `archive/` | Prior feedback, LLM notes, and scratch work not required for the main reproducible workflow. |

## Data Sources

The school closure file combines California school closure records with California Department of Education demographic, enrollment, and testing fields. The codebook states that closure data come from CalMatters' Disaster Days dataset and school attributes come from CDE sources.

The attendance analysis uses CDE Chronic Absenteeism and Absenteeism by Reason files for 2017-18 and 2018-19. The Quarto workflow can read local copies from `data/raw/cde_attendance/` or download from the official CDE URLs listed in the notebook and [docs/data_provenance.md](docs/data_provenance.md).

## Reproduce the Analysis

Install the R/Quarto environment:

```bash
conda env create -f environment.yml
conda activate ycgs-capstone
```

Optionally download local copies of the CDE attendance files:

```bash
Rscript scripts/download_cde_data.R
```

Check the environment and required project files:

```bash
Rscript scripts/check_environment.R
```

Render the Quarto report:

```bash
Rscript scripts/render_report.R
```

If Quarto is not installed, the existing PDF in `reports/` can still be reviewed, but rerendering requires Quarto.

## Methods Summary

The report cleans school closure records, standardizes California school identifiers, calculates wildfire missed student-days, summarizes wildfire disruption by county, district, and school, and compares county wildfire burden with CDE chronic absenteeism rates. It also joins school-year closure records to CDE Absenteeism by Reason records for supporting absence-day and absence-reason patterns.

## Interpretation

This is a descriptive project, not a causal estimate. Wildfire burden, chronic absenteeism, and absence reasons are compared to identify patterns and possible places for targeted attendance support. The analysis does not prove that wildfire closures caused absenteeism differences.

## Citation And License

Use [CITATION.cff](CITATION.cff) for citing this repository. Original code and documentation are MIT licensed; third-party datasets retain their original source terms.
