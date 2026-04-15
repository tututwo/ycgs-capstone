# Chronic Absenteeism Data Metadata

## Source

- Publisher: California Department of Education (CDE)
- Dataset: Chronic Absenteeism Data
- Metadata page: https://www.cde.ca.gov/ds/ad/fsabd.asp
- CDE page last reviewed: April 7, 2026
- Project metadata prepared: April 15, 2026

## Dataset Summary

The Chronic Absenteeism files report chronic absenteeism measures by school year and by state, county, district, and school aggregation levels. Records are available for totals and for disaggregated student groups, including race/ethnicity, gender, program subgroup, and grade span.

The dataset includes:

- Chronic absenteeism eligible cumulative enrollment
- Chronic absenteeism count
- Chronic absenteeism rate

Data come from local educational agencies (LEAs) and charter schools through the annual CALPADS End-of-Year 3 submission. Districts and independently reporting charter schools that did not certify the relevant CALPADS submission are excluded.

## Unit of Observation

Each row is an aggregate for one combination of:

- Academic year
- Geographic/organizational aggregation level
- County, district, and/or school identifier
- Charter-school filter
- DASS-school filter
- Reporting category

Rows are not mutually exclusive across all filters. Use the filter guidance below before summarizing, or totals can be duplicated.

For chronic absenteeism files before 2021-22, the `dass` field may be absent because CDE added that field beginning with 2021-22 files. Add a missing-value or harmonized `dass` column before binding older and newer files together.

## Important Analysis Filters

- `aggregate_level`: Choose exactly one aggregation level when computing unduplicated totals.
- `charter`: Choose one charter filter within the selected aggregation level.
- `dass`: Choose one DASS filter within the selected aggregation level.
- `reporting_category`: Use `TA` for totals that are not disaggregated by student group.

Common filters:

- One total row per school: `aggregate_level == "S"`, `reporting_category == "TA"`, and school-applicable charter/DASS rows.
- School-level student-group rows for non-charter schools: `aggregate_level == "S"`, `charter` for non-charter schools, `reporting_category != "TA"`.
- District-level non-charter student-group rows: `aggregate_level == "D"`, `charter` for non-charter schools, `dass == "All"`, `reporting_category != "TA"`.

## Chronic Absenteeism Definition

CDE determines chronic absenteeism eligibility from expected attendance days and actual days attended reported in CALPADS. Students are excluded from the eligible population when they are expected to attend fewer than 31 instructional days at the selected entity, were enrolled but did not attend there, or meet one of the exempt-status conditions.

Exempt statuses include enrollment in a non-public school, home or hospital instructional setting, or full-time community college attendance.

A student is counted as chronically absent at a reporting level when the student is eligible at that level and absent for 10 percent or more of expected attendance days.

## Privacy and Suppression

CDE suppresses cells with `*` when the selected chronic absenteeism eligible cumulative enrollment is 10 or fewer students. Race/ethnicity values for "Did Not Report" may also be suppressed when suppression of another race/ethnicity group could otherwise reveal protected information.

Treat `*` as a suppressed value, not as zero. Counts and rates derived from suppressed fields should be handled carefully.

## Data Dictionary

| CDE field | Suggested snake_case | Description |
| --- | --- | --- |
| Academic Year | `academic_year` | School year for the July 1 through June 30 reporting period. |
| Aggregate Level | `aggregate_level` | Reporting level: state, county, district, or school. |
| County Code | `county_code` | Two-digit county code. |
| District Code | `district_code` | Five-digit district code. |
| School Code | `school_code` | Seven-digit school code. |
| County Name | `county_name` | County name. |
| District Name | `district_name` | District or administrative authority name. |
| School Name | `school_name` | School name. |
| Charter (ALL/Y/N) | `charter` | Filter indicating all schools, charter schools only, or non-charter schools only. Downloaded files may use `All`, `Yes`, and `No`; CDE documentation labels the choices as `All`, `Y`, and `N`. |
| DASS (ALL/Y/N) | `dass` | Filter indicating all schools, DASS schools only, or non-DASS schools only. CDE added this field beginning with 2021-22 files. Downloaded files may use `All`, `Yes`, and `No`; CDE documentation labels the choices as `All`, `Y`, and `N`. |
| Reporting Category | `reporting_category` | Student group, grade span, or total category. |
| Chronic Absenteeism Eligible Cumulative Enrollment | `chronic_absenteeism_eligible_cumulative_enrollment` | Cumulative enrollment after excluding students who were not eligible for chronic absenteeism calculations. |
| Chronic Absenteeism Count | `chronic_absenteeism_count` | Number of eligible students in the selected aggregate who were absent for at least 10 percent of expected attendance days. |
| Chronic Absenteeism Rate | `chronic_absenteeism_rate` | Chronic absenteeism count divided by chronic absenteeism eligible cumulative enrollment. |

## Code Values

### Aggregate Level

| Code | Meaning |
| --- | --- |
| `T` | State |
| `C` | County |
| `D` | District |
| `S` | School |

### Charter Filter

| Value | Meaning |
| --- | --- |
| `All` | Includes all schools in the selected state, county, or district aggregate. Older school-level files may include `All`; current school-level rows use the school's applicable charter status. |
| `Y` / `Yes` | Charter schools only for state/county/district aggregates; school is a charter school for school-level rows. |
| `N` / `No` | Non-charter schools only for state/county/district aggregates; school is not a charter school for school-level rows. |

### DASS Filter

| Value | Meaning |
| --- | --- |
| `All` | Includes all schools regardless of DASS status for state, county, or district aggregates. Not used for school-level rows. |
| `Y` / `Yes` | DASS schools only for state/county/district aggregates; school is a DASS school for school-level rows. |
| `N` / `No` | Non-DASS schools only for state/county/district aggregates; school is not a DASS school for school-level rows. |

### Reporting Category

| Code | Meaning |
| --- | --- |
| `RB` | African American |
| `RI` | American Indian or Alaska Native |
| `RA` | Asian |
| `RF` | Filipino |
| `RH` | Hispanic or Latino |
| `RD` | Did not report race/ethnicity |
| `RP` | Pacific Islander |
| `RT` | Two or more races |
| `RW` | White |
| `GM` | Male |
| `GF` | Female |
| `GX` | Non-binary gender, beginning in 2019-20 |
| `GZ` | Missing gender |
| `SE` | English learners |
| `SD` | Students with disabilities |
| `SS` | Socioeconomically disadvantaged students |
| `SM` | Migrant students |
| `SF` | Foster students |
| `SH` | Homeless students |
| `GRKN` | Kindergarten; older files used `GRK` before 2020-21 |
| `GR13` | Grades 1-3 |
| `GR46` | Grades 4-6 |
| `GR78` | Grades 7-8 |
| `GRK8` | Grades K-8 |
| `GR912` | Grades 9-12 |
| `GRUG` | Ungraded elementary and secondary, retired in 2017-18 |
| `TA` | Total |

## Notes for Project Use

- Use `TA` when the analysis requires one total record per selected entity.
- Use non-`TA` reporting categories only for disaggregated analysis.
- Do not sum across `charter`, `dass`, or `reporting_category` values unless the analysis explicitly needs overlapping subgroup rows.
- Convert suppressed `*` values to missing values before numeric calculations.
- Recalculate `chronic_absenteeism_rate` only after confirming the numerator and denominator are unsuppressed and numeric.
