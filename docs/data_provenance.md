# Data Provenance

## School Closure Dataset

Path: `data/raw/school_fire/annual_school_closures_standardized_test_scores_ca_2003_2019.csv`

Codebook: `data/raw/school_fire/codebook_school_closures_standardized_test_scores_ca_2003_2019.docx`

The codebook describes this file as California public school academic-year records from 2003 through 2019. It includes school closure days by cause, enrollment, demographic fields, socioeconomic fields, standardized test measures, ACT/SAT fields, and AP passing-rate fields.

The codebook states that:

- school closure data come from CalMatters' Disaster Days dataset;
- demographic, socioeconomic, and academic data come from the California Department of Education;
- `year` refers to the ending year of the academic year;
- wildfire closure days are stored as `days.Wildfires` in the CSV and standardized to `days_wildfire` in the analysis.

## CDE Chronic Absenteeism Data

Metadata: `data/metadata/cde_chronic_absenteeism_metadata.md`

Official CDE metadata page: <https://www.cde.ca.gov/ds/ad/fsabd.asp>

Files used:

| Academic year | Local filename | Official URL |
| --- | --- | --- |
| 2017-18 | `chronicabsenteeism18.txt` | <https://www3.cde.ca.gov/demo-downloads/attendance/chronicabsenteeism18.txt> |
| 2018-19 | `chronicabsenteeism19.txt` | <https://www3.cde.ca.gov/demo-downloads/attendance/chronicabsenteeism19.txt> |

Main analysis filters:

- `aggregate_level == "C"` for county-level totals;
- `reporting_category == "TA"` for total rows;
- `charter == "All"`;
- `dass == "All"` when the field is present, or a harmonized `"All"` value for older files without the field.

The outcome is pooled chronic absenteeism rate, calculated from chronic absenteeism counts and eligible cumulative enrollment across 2017-18 and 2018-19.

## CDE Absenteeism By Reason Data

Metadata: `data/metadata/cde_absenteeism_by_reason_metadata.md`

Official CDE metadata page: <https://www.cde.ca.gov/ds/ad/fsabr.asp>

Files used:

| Academic year | Local filename | Official URL |
| --- | --- | --- |
| 2017-18 | `absenteeismreason18.txt` | <https://www3.cde.ca.gov/demo-downloads/attendance/absenteeismreason18.txt> |
| 2018-19 | `absenteeismreason19.txt` | <https://www3.cde.ca.gov/demo-downloads/attendance/absenteeismreason19.txt> |

Main analysis filters:

- `aggregate_level == "S"` for school-level rows;
- `reporting_category == "TA"` for total rows;
- school-year joins use the 14-digit CDS code and academic-year ending year.

## Temporal Scope

The attendance analysis uses 2017-18 and 2018-19 because they align with closure `year == 2018` and `year == 2019`. The 2019-20 absenteeism year is intentionally excluded because CDE marks that year unavailable/not valid due to COVID-era disruption.

## Suppression And Ethics

CDE suppresses small cells with `*` for privacy. Suppressed values are converted to missing values before numeric calculations. The project reports aggregate patterns and avoids identifying individual students.
