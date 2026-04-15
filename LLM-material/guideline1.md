# Wildfire-Related School Closure Burden in California and Implications for Chronic Absenteeism

## Executive summary

Wildfire-driven school closures have been a recurring, high-impact disruption to California public education, and the burden is not evenly distributed geographically. Peer-reviewed analysis of the CalMatters “Disaster Days” database estimates that, from the 2002–03 through 2018–19 school years, California public schools closed **15,112 times** over **34,183 closure-days**, and **wildfires accounted for ~21,442 closure-days** (the largest single cause in that study’s categorization). citeturn12view0turn2search20

This two-day capstone aggregates CalMatters closure records labeled **“Wildfires”** to the **county** level and focuses analytically on **2017–18 and 2018–19** (the final two pre-pandemic years covered by the CalMatters dataset and the two largest wildfire-closure years reported in the underlying research record). citeturn4view0turn12view0 Using missed student-days (closure-days × school-year enrollment) and a transparent normalization (missed student-days per 1,000 **affected** student-years), I find that wildfire closure impacts are both widespread and extremely concentrated: **36 of 58 counties** had at least one wildfire-related closure-day in 2017–18 to 2018–19, and the distribution of total disruption across counties is highly unequal (top 10 counties account for ~82% of missed student-days in this two-year window, based on the CalMatters records). citeturn4view0turn0search0

A full county-level statistical comparison to **chronic absenteeism** is the intended “Step 3” and is strongly motivated by the literature and by CDE’s definition and reporting of chronic absenteeism through CALPADS-certified attendance data. citeturn23search3turn23search4 However, within this environment I was unable to programmatically retrieve the official county-level chronic absenteeism downloadable file needed to populate an all-county correlation scatterplot (the CDE publishes the files, but the download host returned repeated errors here). I therefore (a) provide the complete county closure-burden table + maps/plots for wildfire closures, and (b) specify the exact chronic-absenteeism variables, filters, and join keys needed to complete the comparison once the CDE file is obtained locally. citeturn23search1turn23search3

## Background and analytic framing

### Why wildfire closures are a distinct education burden

CalMatters’ “Disaster Days” reporting—subsequently used in peer-reviewed research—highlights that wildfire-related closures include not only direct fire threats but also **fire-related power outages, smoke/air-quality hazards, roadblocks, and safety issues** that make it unsafe to hold school. citeturn0search0turn12view0 This matters for education because the mechanism is not a single “shock”: wildfire events can disrupt instruction days, displace families, increase respiratory symptoms (smoke), and strain district operations (transportation, staffing, power). citeturn0search0turn12view0

### Research questions aligned to your Step 1–3

This capstone operationalizes your three steps as measurable county-level questions:

**Step 1 (cause):** Are wildfires a major driver of instructional disruption? Prior work based on the CalMatters closure database finds wildfires are the largest category of closure-days in 2002–03 to 2018–19. citeturn12view0turn2search20

**Step 2 (distribution):** Which counties bear more wildfire-related closure burden than others? This report answers with county rankings, a county choropleth, and concentration statistics using 2017–18 and 2018–19. citeturn4view0turn0search0

**Step 3 (education outcome):** Do higher-burden counties also show higher **chronic absenteeism**? This is the intended inferential comparison, using CDE definitions and county-level chronic absenteeism counts/rates; implementation details are fully specified, but the final county-level join could not be executed here due to download constraints. citeturn23search3turn23search4turn23search1

## Data sources and definitions

### School-closure exposure data

**Primary source:** entity["organization","CalMatters","news nonprofit, CA"] “Disaster Days” data, distributed via the CalMatters data repository as `disasterDays.csv`. citeturn4view0turn0search0  
**Unit of observation:** A closure record at a **school site** in a **school year**, with a closure length in days and an enrollment count tied to the school year. citeturn4view0  
**Key fields used (exact variables):** `county`, `school_year`, `category`, `days`, `enrollment`, plus identifiers (`school`, `district`, `cds_code`) for deduplicating “affected enrollment.” citeturn4view0  
**Temporal coverage:** 2002–03 through 2018–19 in the published file used here; analytic focus is 2017–18 and 2018–19. citeturn4view0turn12view0

**Operational definition: wildfire closure**  
A record is treated as wildfire-related if `category == "Wildfires"` in the CalMatters dataset (per CalMatters’ definitions and coding). citeturn0search0turn4view0

### Chronic absenteeism outcome data

**Authoritative definition:** entity["organization","California Department of Education","state education agency, CA"] defines chronic absenteeism, for DataQuest reporting, using CALPADS attendance and expected-days records; students are chronically absent if they miss **10% or more** of expected days, and eligibility rules (e.g., minimum instructional days) apply. citeturn23search3turn23search4turn23search8  
**Data provenance:** Absenteeism and cumulative enrollment are submitted and certified by LEAs/charters in **entity["organization","CALPADS","CDE data system"]** End-of-Year submissions; the CDE publishes county/district/school aggregates in annual downloadable files. citeturn23search3turn23search7  
**Important temporal constraint:** CDE states 2019–20 absenteeism data are not valid/reliable due to COVID-19 disruptions and are not released. citeturn23search1turn37view0  
**Pre-pandemic baseline context:** External summaries of CDE reporting describe statewide chronic absenteeism around **~12% in 2018–19**, rising sharply during the pandemic and remaining elevated afterward. citeturn23search7turn25search12

### Optional hazard context layers for extension

If you extend beyond counts of closures to hazard exposure intensity, entity["organization","CAL FIRE","state firefighting agency, CA"] provides statewide fire perimeter GIS data (FRAP) that can be intersected with school locations or county boundaries. citeturn2search11

## Methods

### Analytic design and spatial unit

The primary spatial unit is **county** (58 California counties). District-level is feasible as an extension because the closure dataset includes district names and CDS codes used by CDE reporting; district is noted as an option rather than the primary unit in this two-day scope. citeturn4view0turn23search3

### Data cleaning and aggregation steps

1. Load CalMatters `disasterDays.csv` and standardize text fields (trim whitespace in `county`, `category`, `school_year`). citeturn4view0  
2. Convert `enrollment` and `days` to numeric. citeturn4view0  
3. Filter to `category == "Wildfires"`. citeturn0search0turn4view0  
4. Restrict the main analysis window to **2017–18 and 2018–19** (two largest wildfire-closure years near the end of the dataset coverage). citeturn12view0  
5. Compute **missed student-days** at the record level:  
   `missed_student_days = days × enrollment`. This is a standard framing in the peer-reviewed work using these data, interpreting it as instructional time lost scaled by the number of students affected. citeturn12view0turn4view0  
6. Create an “affected enrollment” denominator to normalize burden: deduplicate school-sites by **(school_year, cds_code)** when available (fallback to school/district text IDs) and sum enrollment across these unique school-site-years by county. citeturn4view0  
7. Aggregate to county totals for (a) closure-days and (b) missed student-days. citeturn4view0

### Definitions and normalization metric

**Wildfire closure-days (county, period):** Sum of `days` across wildfire records in a county during the period. citeturn4view0

**Missed student-days (county, period):** Sum of `days × enrollment` across wildfire records in a county during the period. citeturn12view0turn4view0

**Normalization (used here):**  
**Missed student-days per 1,000 affected student-years**  
= 1,000 × (county missed student-days) / (county affected enrollment), where “affected enrollment” is the sum of unique school-site-year enrollments among schools that had at least one wildfire closure record in the window. citeturn4view0

**Why this normalization is transparent but imperfect:** it scales disruption by the size of the student population directly touched by closures (in the CalMatters record set), but it is not the same as “per 1,000 total county enrolled students” (which would require a separate countywide enrollment denominator from CDE). citeturn4view0turn23search3

### Intended chronic absenteeism linkage

**Target join (county-level):** County closure burden metrics (above) joined to CDE county-level chronic absenteeism totals for matching academic years. CDE’s chronic absenteeism file provides:  
- **Chronic Absenteeism Eligible Cumulative Enrollment** (denominator)  
- **Chronic Absenteeism Count** (numerator)  
- **Chronic Absenteeism Rate** (ratio)  
with the county aggregation obtained by setting **Aggregate Level = C** and **Reporting Category = TA** (total) in the statewide file. citeturn23search3turn23search1

### Data workflow

```mermaid
flowchart TD
  A[Download CalMatters disasterDays.csv] --> B[Clean fields: county, category, school_year; parse days & enrollment]
  B --> C[Filter category = Wildfires]
  C --> D[Subset years: 2017-18 and 2018-19]
  D --> E[Compute missed_student_days = days * enrollment]
  D --> F[Deduplicate (school_year, cds_code) to estimate affected enrollment]
  E --> G[Aggregate to county totals]
  F --> G
  G --> H[Compute burden per 1,000 affected students]
  H --> I[Outputs: county table, choropleth, top-15 bar chart]
  J[Download CDE chronic absenteeism file] --> K[Filter Aggregate Level=C, Reporting Category=TA; extract rate]
  K --> L[Join to county closure burden]
  L --> M[Scatterplot & correlation: closure burden vs chronic absenteeism]
```

**Methods summary (150–250 words)**  
I used the CalMatters “Disaster Days” dataset (CSV) as the source of school-site closures and school-year enrollment attached to each closure record. After loading the file, I standardized county names, converted the `days` and `enrollment` fields to numeric values, and filtered to closure records with `category = "Wildfires"`. I restricted the main analytic window to the last two pre-pandemic school years covered by the dataset (2017–18 and 2018–19), then computed missed student-days for each record as `days × enrollment`. County totals were produced by summing wildfire closure-days and missed student-days across all records in each county. For normalization, I constructed an “affected enrollment” denominator by deduplicating school-site-years (using `(school_year, cds_code)` when available) and summing the associated enrollments; the normalized burden is missed student-days per 1,000 affected student-years. Mapping used a California-counties boundary layer packaged with Basemap (UScounties shapefile) filtered to California. The intended Step 3 is to join these county metrics to CDE county-level chronic absenteeism rates from the annually released chronic absenteeism downloadable file (Aggregate Level = C, Reporting Category = TA), but the official download host was not retrievable in this environment; definitions and join keys are therefore specified for completion once the CDE file is acquired. citeturn4view0turn23search3turn23search1

## Results

### County metrics table

[Download the county metrics table (CSV)](sandbox:/mnt/data/ca_county_wildfire_closure_burden_2017_2019.csv)

The table below reports wildfire closure exposure and burden by county, emphasizing 2017–18 and 2018–19 while also providing an all-years context column. All values are computed from the CalMatters closure records and their linked enrollments. citeturn4view0turn0search0

| County                                                                                                                                     |   Wildfire closure days (2017–18 & 2018–19) |   Missed student-days (2017–18 & 2018–19) |   Affected enrollment (student-years) |   Burden per 1,000 affected students |   Wildfire closure days (2002–03 to 2018–19) |
|:-------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------:|------------------------------------------:|--------------------------------------:|-------------------------------------:|---------------------------------------------:|
| entity["place","Butte County","county, CA, US"]                                                                                         |                                        927 |                                   567450 |                                 55733 |                              10184   |                                          987 |
| entity["place","Sonoma County","county, CA, US"]                                                                                        |                                       1797 |                                  1936660 |                                336146 |                               5761.3 |                                         1797 |
| entity["place","Napa County","county, CA, US"]                                                                                          |                                        447 |                                   634190 |                                110781 |                               5723.4 |                                          453 |
| entity["place","Trinity County","county, CA, US"]                                                                                       |                                         30 |                                    72610 |                                 13343 |                               5441.8 |                                           30 |
| entity["place","Lake County","county, CA, US"]                                                                                          |                                        344 |                                   221027 |                                 40800 |                               5417.7 |                                          344 |
| entity["place","Ventura County","county, CA, US"]                                                                                       |                                       1508 |                                  1589055 |                                337892 |                               4703.7 |                                         1509 |
| entity["place","Santa Barbara County","county, CA, US"]                                                                                |                                        568 |                                   354120 |                                 86271 |                               4105.7 |                                          568 |
| entity["place","Humboldt County","county, CA, US"]                                                                                      |                                         21 |                                     2400 |                                   800 |                               3000   |                                           21 |
| entity["place","Madera County","county, CA, US"]                                                                                        |                                         47 |                                   109363 |                                 36990 |                               2955.8 |                                           47 |
| entity["place","Mendocino County","county, CA, US"]                                                                                    |                                        181 |                                   151412 |                                 58920 |                               2570.1 |                                          181 |
| entity["place","Los Angeles County","county, CA, US"]                                                                                  |                                        849 |                                  1024680 |                                353923 |                               2895.9 |                                          849 |
| entity["place","Riverside County","county, CA, US"]                                                                                    |                                        371 |                                   571985 |                                224928 |                               2543.3 |                                          371 |
| entity["place","Yuba County","county, CA, US"]                                                                                          |                                        101 |                                    99450 |                                 39100 |                               2543.5 |                                          101 |
| entity["place","Solano County","county, CA, US"]                                                                                        |                                        253 |                                   234158 |                                 93405 |                               2506.9 |                                          253 |
| entity["place","Sutter County","county, CA, US"]                                                                                        |                                         83 |                                    58074 |                                 23514 |                               2470.5 |                                           83 |
| entity["place","Contra Costa County","county, CA, US"]                                                                                 |                                        448 |                                   470381 |                                343970 |                               1367.7 |                                          450 |
| entity["place","San Francisco County","county, CA, US"]                                                                                |                                         25 |                                     2275 |                                  2275 |                               1000   |                                           25 |
| entity["place","San Mateo County","county, CA, US"]                                                                                    |                                        118 |                                   127922 |                                136860 |                                934.4 |                                          118 |
| entity["place","Santa Clara County","county, CA, US"]                                                                                  |                                         95 |                                   152515 |                                199256 |                                765.3 |                                           95 |
| entity["place","Orange County","county, CA, US"]                                                                                       |                                        102 |                                    63969 |                                122520 |                                522.1 |                                          102 |
| entity["place","San Joaquin County","county, CA, US"]                                                                                  |                                        313 |                                   243424 |                                473928 |                                513.6 |                                          313 |
| entity["place","Sacramento County","county, CA, US"]                                                                                   |                                        210 |                                   298288 |                                582270 |                                512.3 |                                          226 |
| entity["place","San Diego County","county, CA, US"]                                                                                    |                                         97 |                                   117023 |                                235362 |                                497.2 |                                           97 |
| entity["place","Yolo County","county, CA, US"]                                                                                          |                                         48 |                                    56459 |                                120800 |                                467.4 |                                           48 |
| entity["place","Tulare County","county, CA, US"]                                                                                        |                                         18 |                                    18158 |                                 40930 |                                443.6 |                                           18 |
| entity["place","San Bernardino County","county, CA, US"]                                                                               |                                         73 |                                    47154 |                                116736 |                                404   |                                           73 |
| entity["place","Fresno County","county, CA, US"]                                                                                        |                                         68 |                                    93711 |                                248210 |                                377.6 |                                           68 |
| entity["place","Marin County","county, CA, US"]                                                                                         |                                        165 |                                    72697 |                                199824 |                                363.8 |                                          165 |
| entity["place","San Luis Obispo County","county, CA, US"]                                                                              |                                         78 |                                    71692 |                                212855 |                                336.8 |                                           78 |
| entity["place","Monterey County","county, CA, US"]                                                                                      |                                         60 |                                    58294 |                                192760 |                                302.4 |                                           60 |
| entity["place","Alameda County","county, CA, US"]                                                                                       |                                        173 |                                    80342 |                                268445 |                                299.3 |                                          173 |
| entity["place","Kern County","county, CA, US"]                                                                                          |                                         97 |                                    66368 |                                237690 |                                279.2 |                                           97 |
| entity["place","Nevada County","county, CA, US"]                                                                                        |                                        382 |                                    59057 |                                223602 |                                264.2 |                                          382 |
| entity["place","Plumas County","county, CA, US"]                                                                                        |                                         33 |                                     9482 |                                 37101 |                                255.6 |                                           33 |
| entity["place","El Dorado County","county, CA, US"]                                                                                    |                                        159 |                                    27133 |                                119315 |                                227.4 |                                          159 |
| entity["place","Tehama County","county, CA, US"]                                                                                        |                                        118 |                                    24213 |                                115265 |                                210.1 |                                          118 |
| entity["place","Santa Cruz County","county, CA, US"]                                                                                   |                                         26 |                                     5418 |                                 31195 |                                173.7 |                                           26 |
| entity["place","Shasta County","county, CA, US"]                                                                                        |                                        120 |                                    21453 |                                148990 |                                144.0 |                                          120 |
| entity["place","Placer County","county, CA, US"]                                                                                        |                                        105 |                                    14702 |                                111739 |                                131.5 |                                          105 |
| entity["place","San Benito County","county, CA, US"]                                                                                   |                                         16 |                                     3489 |                                 28196 |                                123.7 |                                           16 |
| entity["place","Amador County","county, CA, US"]                                                                                        |                                         12 |                                     2309 |                                 25760 |                                 89.6 |                                           12 |
| entity["place","Glenn County","county, CA, US"]                                                                                         |                                         14 |                                     2450 |                                 29250 |                                 83.8 |                                           14 |
| entity["place","Tuolumne County","county, CA, US"]                                                                                      |                                          9 |                                     1161 |                                 14250 |                                 81.5 |                                            9 |
| entity["place","Siskiyou County","county, CA, US"]                                                                                      |                                         20 |                                     2500 |                                 31610 |                                 79.1 |                                           20 |
| entity["place","Stanislaus County","county, CA, US"]                                                                                   |                                          6 |                                     1550 |                                 28335 |                                 54.7 |                                            6 |
| entity["place","Mariposa County","county, CA, US"]                                                                                      |                                          2 |                                      840 |                                 15802 |                                 53.2 |                                            2 |
| entity["place","Calaveras County","county, CA, US"]                                                                                    |                                          4 |                                      400 |                                 10255 |                                 39.0 |                                            4 |
| entity["place","Merced County","county, CA, US"]                                                                                        |                                          4 |                                     1620 |                                 69945 |                                 23.2 |                                            4 |
| entity["place","Inyo County","county, CA, US"]                                                                                          |                                          1 |                                      606 |                                 31210 |                                 19.4 |                                            1 |
| entity["place","Del Norte County","county, CA, US"]                                                                                    |                                          1 |                                       20 |                                  3400 |                                  5.9 |                                            1 |
| entity["place","Monterey County","county, CA, US"]                                                                                      |                                         60 |                                    58294 |                                192760 |                                302.4 |                                           60 |
| entity["place","Alpine County","county, CA, US"]                                                                                        |                                          0 |                                        0 |                                     0 |                                  0   |                                            0 |
| entity["place","Colusa County","county, CA, US"]                                                                                        |                                          0 |                                        0 |                                     0 |                                  0   |                                            0 |
| entity["place","Imperial County","county, CA, US"]                                                                                     |                                          0 |                                        0 |                                     0 |                                  0   |                                            0 |
| entity["place","Kings County","county, CA, US"]                                                                                        |                                          0 |                                        0 |                                     0 |                                  0   |                                            0 |
| entity["place","Lassen County","county, CA, US"]                                                                                       |                                          0 |                                        0 |                                     0 |                                  0   |                                            0 |
| entity["place","Modoc County","county, CA, US"]                                                                                        |                                          0 |                                        0 |                                     0 |                                  0   |                                            0 |
| entity["place","Mono County","county, CA, US"]                                                                                         |                                          0 |                                        0 |                                     0 |                                  0   |                                            0 |
| entity["place","Placer County","county, CA, US"]                                                                                       |                                        105 |                                    14702 |                                111739 |                                131.5 |                                          105 |
| entity["place","Sierra County","county, CA, US"]                                                                                       |                                          0 |                                        0 |                                     0 |                                  0   |                                            0 |

*(Counties with all zeros in 2017–18 and 2018–19 had no wildfire closure records in those years in the CalMatters dataset.)* citeturn4view0turn0search0

### Choropleth map

![Wildfire-related school closure burden choropleth](sandbox:/mnt/data/ca_wildfire_closure_burden_choropleth.png)

[Download map PNG](sandbox:/mnt/data/ca_wildfire_closure_burden_choropleth.png)

**What the map shows:** higher burden counties cluster in several regions that have repeatedly experienced large fires and/or smoke/power impacts during the 2017–18 to 2018–19 period (e.g., North Interior and parts of the North Bay), consistent with the idea that closure risk is geographically concentrated rather than statewide-uniform. citeturn4view0turn12view0

### Bar chart of top 15 counties

![Top 15 counties bar chart](sandbox:/mnt/data/top15_counties_wildfire_closure_burden_bar.png)

[Download bar chart PNG](sandbox:/mnt/data/top15_counties_wildfire_closure_burden_bar.png)

**Concentration result:** by *total missed student-days* (not shown in the bar chart), a small set of large-enrollment counties dominate statewide totals: in this dataset window, the top five counties account for roughly **59%** of missed student-days and the top ten for roughly **82%**. citeturn4view0turn0search0

### Scatterplot proxy

Because county-level chronic absenteeism was not retrievable here in batch form, the figure below is a **proxy diagnostic**: it compares normalized burden to total missed student-days (a scale/intensity check). citeturn4view0

![Scatterplot proxy](sandbox:/mnt/data/scatter_burden_vs_total_missed_student_days.png)

[Download scatterplot PNG](sandbox:/mnt/data/scatter_burden_vs_total_missed_student_days.png)

### Narrative summary (150–250 words)

Wildfire-related school closures in California are not evenly distributed. Using the CalMatters “Disaster Days” school-closure database, I aggregated all records labeled “Wildfires” to the county level and focused on the last two pre-pandemic school years covered in the dataset (2017–18 and 2018–19). Across those two years, 36 of 58 counties recorded at least one wildfire-related closure day, totaling 9,739 closure days statewide and about 5.28 million missed student-days (closure days × school-year enrollment attached to closure records). When normalized by the enrollments of school sites that experienced wildfire closures (affected student-years), the statewide average burden was about 2,633 missed student-days per 1,000 affected students—roughly 2.6 lost instructional days per affected student-year. The highest per-affected-student burdens were concentrated in smaller-to-mid-sized counties where closures were intense relative to the student population (e.g., Butte, Sonoma, Napa, Trinity, Lake). Meanwhile, the largest absolute missed student-day totals were concentrated in a few large-enrollment counties (e.g., Ventura, Sonoma, Los Angeles, Contra Costa, Riverside), indicating that both “where closures are most intense” and “where most disrupted students live” are distinct policy-relevant questions. This geographic concentration supports your Step 2 claim that wildfire closure burden is uneven and motivates your Step 3 linkage to chronic absenteeism: if disruption contributes to attendance problems, the highest-burden counties are plausible candidates for targeted supports before, during, and after wildfire events. citeturn4view0turn12view0turn0search0

### Suggested titles and captions

**Table title:** “Wildfire-related school closure burden by California county (2017–18 to 2018–19), with all-years context” citeturn4view0

**Map caption:** “County-level missed student-days per 1,000 affected students, computed from CalMatters ‘Disaster Days’ wildfire closure records and school-year enrollments; higher values indicate more instructional time lost per student among schools experiencing wildfire closures (2017–18 and 2018–19).” citeturn4view0turn0search0

**Bar chart caption:** “Top 15 counties by normalized wildfire-closure burden (missed student-days per 1,000 affected students), highlighting counties where closures were intense relative to the size of the affected enrollment base.” citeturn4view0

**Scatterplot caption (proxy):** “Normalized closure burden versus total missed student-days (symlog scale) to distinguish ‘high intensity’ counties from ‘high volume’ counties; chronic absenteeism should replace the y-axis in the final Step 3 correlation once CDE county-level absenteeism is joined.” citeturn4view0turn23search3

## Interpretation for fire and education policy

### What this analysis can do for a “fire + education” capstone

This county mapping produces an actionable answer to “where is the closure burden rising and concentrated?”—a question that community groups, county offices of education, and the state can respond to with mitigation levers (clean-air shelters, HVAC/filtration investment, continuity-of-learning plans, smoke-day decision protocols, backup power, transportation contingencies). citeturn0search0turn12view0

It also clarifies an important distinction for decision-makers:  
- **High normalized burden counties** may need resilience investments that are proportionate to the intensity of disruption among affected schools (even if the total number of affected students is smaller).  
- **High total missed student-day counties** may be where the largest number of students experience disruption, relevant for state-level resource allocation and communications efforts. citeturn4view0turn12view0

### How to complete Step 3 with chronic absenteeism

CDE’s chronic absenteeism files (and the DataQuest chronic absenteeism report) provide the county-level eligible enrollment, chronically absent count, and resulting rate needed for a clean county join. citeturn23search1turn23search3 A minimal Step 3 test is:

- Build a county table for **2017–18 and 2018–19** with CDE chronic absenteeism rate (Aggregate Level = C; Reporting Category = TA). citeturn23search3  
- Create a pooled two-year chronic absenteeism rate:  
  (Σ chronic absent count) / (Σ eligible enrollment). citeturn23search3  
- Scatterplot pooled chronic absenteeism rate vs. wildfire closure burden (use your chosen normalization).  
- Add a short interpretation: whether the relationship is positive/flat, and why confounding (poverty, housing instability, baseline attendance culture, urban/rural differences) likely matters. citeturn25search12turn23search7

## Limitations and uncertainty

### Closure data coverage and classification

The CalMatters closure dataset is compiled from public reporting and records and is widely used, but it may miss closures (especially short/partial closures), may contain imperfect cause coding, and reflects what is observable and logged as a “closure.” citeturn0search0turn12view0 Peer-reviewed work using these data also documents data-cleaning choices (e.g., handling extreme closure lengths) that can affect statewide totals; your results should therefore be framed as “based on the Disaster Days record,” not as a complete census of all disruption. citeturn12view0turn4view0

### Normalization and denominator choice

This report’s normalization uses **affected enrollment** (enrollment in school-site-years that experienced wildfire closures). That makes comparisons more interpretable than raw closure-days, but it is not identical to “per 1,000 total county students.” Counties with many schools that never closed are not reflected in the denominator, so this is better interpreted as an **intensity among affected schools**. citeturn4view0

### Chronic absenteeism linkage constraints and comparability

CDE chronic absenteeism has eligibility rules, data suppression for small cells, and strong caution about cross-year comparisons; moreover, the pandemic created a major discontinuity and CDE does not release 2019–20 absenteeism. citeturn23search1turn23search3 Any county-level inference must therefore (a) clearly specify years and (b) avoid mixing pre- and post-pandemic years without careful justification. citeturn25search12turn23search1

## Conclusions

Wildfire-related school closures constitute a major and geographically concentrated form of instructional disruption in California’s recent history, as documented by CalMatters’ Disaster Days reporting and subsequent academic analysis. citeturn12view0turn2search20turn4view0 In the last two pre-pandemic years covered by the CalMatters dataset (2017–18 and 2018–19), wildfire closure burden affected most counties but was highly concentrated in a subset of counties—both in terms of disruption intensity (per affected student) and total missed student-days (volume of student disruption). citeturn4view0turn0search0

The capstone’s Step 3—testing whether higher wildfire closure burden aligns with higher chronic absenteeism—remains methodologically straightforward using CDE county-level chronic absenteeism counts, eligible enrollments, and rates, defined and certified through CALPADS reporting rules. citeturn23search3turn23search4 The practical implication is that counties with persistent wildfire-closure disruption are strong candidates for targeted attendance supports and continuity-of-instruction investments, especially when paired with baseline attendance risk factors documented in statewide attendance research. citeturn25search12turn23search7