# Absenteeism by Reason Data Metadata

## Source

- Publisher: California Department of Education (CDE)
- Dataset: Absenteeism by Reason Data
- Metadata page: https://www.cde.ca.gov/ds/ad/fsabr.asp
- CDE page last reviewed: April 7, 2026
- Project metadata prepared: April 15, 2026

## Dataset Summary

The Absenteeism by Reason files report attendance-related measures by school year and by state, county, district, and school aggregation levels. Records are available for totals and for disaggregated student groups, including race/ethnicity, gender, program subgroup, grade span, and chronic absenteeism status.

The dataset includes eligible cumulative enrollment, counts of students with one or more absences, average and total days absent, and absence counts/percentages by reason:

- Excused absences
- Unexcused absences
- Out-of-school suspension absences
- Incomplete independent study absences

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

## Important Analysis Filters

- `aggregate_level`: Choose exactly one aggregation level when computing unduplicated totals.
- `charter`: Choose one charter filter within the selected aggregation level.
- `dass`: Choose one DASS filter within the selected aggregation level.
- `reporting_category`: Use `TA` for totals that are not disaggregated by student group.

Common filters:

- One total row per school: `aggregate_level == "S"`, `reporting_category == "TA"`, and school-applicable charter/DASS rows.
- School-level student-group rows for non-charter schools: `aggregate_level == "S"`, `charter` for non-charter schools, `reporting_category != "TA"`.
- District-level non-charter student-group rows: `aggregate_level == "D"`, `charter` for non-charter schools, `dass == "All"`, `reporting_category != "TA"`.

## Privacy and Suppression

CDE suppresses cells with `*` when the selected eligible cumulative enrollment is 10 or fewer students. Race/ethnicity values for "Did Not Report" may also be suppressed when suppression of another race/ethnicity group could otherwise reveal protected information.

Treat `*` as a suppressed value, not as zero. Counts, rates, and percentages derived from suppressed fields should be handled carefully.

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
| DASS (All/Y/N) | `dass` | Filter indicating all schools, DASS schools only, or non-DASS schools only. Downloaded files may use `All`, `Yes`, and `No`; CDE documentation labels the choices as `All`, `Y`, and `N`. |
| Reporting Category | `reporting_category` | Student group, grade span, chronic absenteeism status, or total category. |
| Eligible Cumulative Enrollment | `eligible_cumulative_enrollment` | Cumulative enrollment after excluding students who were not eligible for chronic absenteeism calculations, such as students expected to attend fewer than 31 instructional days, students enrolled but not attending, and exempt students. |
| Count of Students with One or More Absences | `count_students_one_or_more_absences` | Number of eligible students with at least one day absent in the selected aggregate. |
| Average Days Absent | `average_days_absent` | Total absent days divided by the number of students with one or more absences. |
| Total Days Absent | `total_days_absent` | Total days missed for any reason. |
| Excused Absences (percent) | `excused_absences_percent` | Excused absence days divided by total absence days. |
| Unexcused Absences (percent) | `unexcused_absences_percent` | Unexcused absence days divided by total absence days. |
| Out-of-School Suspension Absences (percent) | `out_of_school_suspension_absences_percent` | Out-of-school suspension absence days divided by total absence days. |
| Incomplete Independent Study Absences (percent) | `incomplete_independent_study_absences_percent` | Incomplete independent study absence days divided by total absence days. |
| Excused Absences (count) | `excused_absences_count` | Count of excused absent days. |
| Unexcused Absences (count) | `unexcused_absences_count` | Count of unexcused absent days. |
| Out-of-School Suspension Absences (count) | `out_of_school_suspension_absences_count` | Count of absent days due to out-of-school suspension. |
| Incomplete Independent Study Absences (count) | `incomplete_independent_study_absences_count` | Count of absent days due to incomplete independent study. |

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
| `All` | Includes all schools in the selected state, county, or district aggregate. Not used for school-level rows in current files. |
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
| `GRK` | Kindergarten, 2017-18 through 2019-20 |
| `GRKN` | Kindergarten, 2020-21 through 2022-23 |
| `GRTKKN` | Grades TK-KN, beginning in 2023-24 |
| `GR13` | Grades 1-3 |
| `GR46` | Grades 4-6 |
| `GR78` | Grades 7-8 |
| `GRK8` | Grades K-8, 2017-18 through 2022-23 |
| `GRTK8` | Grades TK-8, beginning in 2023-24 |
| `GR912` | Grades 9-12 |
| `CAY` | Chronically absent |
| `CAN` | Not chronically absent |
| `TA` | Total |

## Notes for Project Use

- Use `TA` when the analysis requires one total record per selected entity.
- Use non-`TA` reporting categories only for disaggregated analysis.
- Do not sum across `charter`, `dass`, or `reporting_category` values unless the analysis explicitly needs overlapping subgroup rows.
- Convert suppressed `*` values to missing values before numeric calculations.
- Keep absence percentages and absence counts distinct; percentages represent shares of total absent days, not rates over enrollment.
