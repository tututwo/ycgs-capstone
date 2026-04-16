# Reports

`wildfire_absenteeism_analysis.pdf` is the current rendered report generated from `analysis/wildfire_absenteeism_analysis.qmd`.

`figures/` contains final image exports for the report and plain-language summary. `tables/` contains generated summary CSVs from supporting visualization notebooks.

To regenerate it, install the environment and run:

```bash
Rscript scripts/render_report.R
```

The render script copies Quarto's nested PDF output to the top-level report path so the grading artifact is easy to find.
