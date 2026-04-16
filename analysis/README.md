# Analysis Workflow

The primary analysis is `wildfire_absenteeism_analysis.qmd`, a Quarto/R notebook that performs the full workflow:

1. Load and clean the school closure dataset.
2. Calculate wildfire missed student-days.
3. Summarize burden by year, county, district, and school.
4. Load CDE Chronic Absenteeism files for 2017-18 and 2018-19.
5. Compare county wildfire burden with chronic absenteeism rates.
6. Load CDE Absenteeism by Reason files for supporting school-year analysis.
7. Document join coverage, sensitivity checks, high-burden school profiles, and limitations.

`wildfire_absenteeism_flagship_viz.qmd` is a supporting visualization notebook used to create the final communication figures.

The main notebook is intentionally kept as the primary project artifact because the capstone rubric accepts notebooks/scripts and the current work is already in a reproducible Quarto/R format.
