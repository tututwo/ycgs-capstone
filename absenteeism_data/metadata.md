Files include state, county, district, and school-level data. Please refer to the file structure for details on what data are contained in the file. Data are not included for districts and independently reporting charter schools (IRCs) that did not certify their California Longitudinal Pupil Achievement Data System (CALPADS) End-of-Year 3 submission.

This file contains aggregate data with disaggregated data subsets at multiple different levels and reporting categories to provide enhanced analytical flexibility. For more detailed examples about how to properly use these data, please refer to the Using the Absenteeism Data File examples below.

Note: To protect student privacy, data are suppressed (*) on the Absenteeism by Reason downloadable files if the cell size within a selected student population (eligible cumulative enrollment) is 10 or less. Additionally, for Race/Ethnicity, "Not Reported" is suppressed, regardless of actual cell size, if the student population for one or more other race/ethnicity groups is suppressed.

General Description of the Data File

Field Name	Description
Academic Year	
The academic year (July 1 – June 30) corresponding to the time period during which the data were collected.

Aggregate Level	
An indicator of the aggregation level.

T = State
C = County
D = District
S = School
Note: One of these values must be chosen to obtain an unduplicated count at the selected level.
County Code	A unique two-digit code corresponding to the county.
District Code	
A unique five-digit code corresponding to the district.

School Code	
A unique seven-digit code corresponding to the school.

County Name	County Name
District Name	District or Administrative Authority Name
School Name	School Name
Charter (ALL/Y/N)	
An indicator of whether data for all schools, only charter schools, or only non-charter schools are included.

All = Includes data for all schools regardless of charter status. For Aggregate Levels T, C, and D, data for all schools are included in the aggregate. Charter = All is not applicable for Aggregate Level = S.
Y = Includes only data for charter schools in the selected aggregate for Aggregate Levels T, C, and D. For Aggregate Level = S, a value of Charter = Y indicates that the school is a charter school.
N = Includes only data for non-charter schools in the selected aggregate for Aggregate Levels T, C, and D. For Aggregate Level = S, a value of Charter = N indicates that the school is not a charter school.
Note: One of these values must be chosen to obtain an unduplicated count at the selected level.
DASS (All/Y/N)	
An indicator of the aggregation level.

All = Includes data for all schools regardless of DASS status. For Aggregate Levels T, C, and D, data for all schools are included in the aggregate. DASS = All is not applicable for Aggregate Level = S (school-level).
Y = Includes only data for DASS schools in the selected aggregate for Aggregate Levels T, C, and D. For Aggregate Level = S, a value of DASS = Y indicates that the school is a DASS school.
N = Includes only data for non-DASS schools in the selected aggregate for Aggregate Levels T, C, and D. For Aggregate Level = S, a value of DASS = N indicates that the school is not a DASS school.
Note: One of these values must be chosen to obtain an unduplicated count at the selected level.
Reporting Category	
An indicator of the student group reporting category (race/ethnicity, gender, or program subgroup) disaggregation or subset.

RB = African American
RI = American Indian or Alaska Native
RA = Asian
RF = Filipino
RH = Hispanic or Latino
RD = Did not Report
RP = Pacific Islander
RT = Two or More Races
RW = White
GM = Male
GF = Female
GX = Non-Binary Gender (Beginning 2019–20)
GZ = Missing Gender
SE = English Learners
SD = Students with Disabilities
SS = Socioeconomically Disadvantaged
SM = Migrant
SF = Foster
SH = Homeless
GRK (2017–18 through 2019–20)
GRKN = Kindergarten (2020–21 through 2022–23)
GRTKKN = Grades TK–KN (Beginning 2023–24)
GR13 = Grades 1–3
GR46 = Grades 4–6
GR78 = Grades 7–8
GRK8 = Grades K–8 (2017–18 through 2022–23)
GRTK8 = Grades TK–8 (Beginning 2023–24)
GR912 = Grades 9–12
CAY = Chronically Absent
CAN = Not Chronically Absent
TA = Total
Note: Select Reporting Category = TA for aggregate totals without consideration of a Reporting Category student group.

Eligible Cumulative Enrollment	This count uses the Cumulative Enrollment of the selected entity as the baseline and removes students that were not eligible to be considered chronically absent at that entity. Students that are expected to attend less than 31 instructional days at the selected entity or who were enrolled but did not attend the selected entity are not eligible to be considered chronically absent at that entity. This is calculated by looking at the number of expected days to attend and actual days attended that LEAs submit for each student in CALPADS. Students with exempt status are also removed from Chronic Absenteeism eligibility. Students are considered to be exempt if they are enrolled in a Non-Public School (NPS), receive instruction through a home or hospital instructional setting or are attending community college full-time.
Count of Students with One or More Absences	This count includes the total number of students in the Eligible Cumulative Enrollment who missed one or more days of school at the selected level.
Average Days Absent	The average days absent is calculated by taking the total number of days students are absent divided by the total count of students with one or more absences at the selected level.
Total Days Absent	The total days absent includes the total number of days missed (for any reason) at the selected level.
Excused Absences (percent)	The percent of excused absences is calculated by taking the count of excused absences divided by the total of all absences for students at the selected level.
Unexcused Absences (percent)	The percent of unexcused absences is calculated by taking the count of unexcused absences divided by the total of all absences for students at the selected level.
Out-of-School Suspension Absences (percent)	The percent of out-of-school suspension absences is calculated by taking the count of out-of-school suspension absences divided by the total of all absences for students at the selected level.
Incomplete Independent Study Absences (percent)	The percent of incomplete independent study absences is calculated by taking the count of incomplete independent study absences divided by the total of all absences for students at the selected level.
Excused Absences (count)	This count includes the total number of excused days absent for students at the selected level.
Unexcused Absences (count)	This count includes the total number of unexcused days absent for students at the selected level.
Out-of-School Suspension Absences (count)	This count includes the total number of days absent due to out-of-school suspension for students at the selected level.
Incomplete Independent Study Absences (count)	This count includes the total number of days absent due to incomplete independent study for students at the selected level.
General Description of the Data File
Absenteeism data are submitted by local educational agencies (LEAs) and charter schools to the California Department of Education (CDE) as part of the annual End of Year 3 (EOY 3) data submission in the California Longitudinal Pupil Achievement Data System (CALPADS). Absenteeism data and Cumulative Enrollment are reviewed and certified in CALPADS as being accurate by authorized district or school personnel. In order to certify data in CALPADS, authorized district or charter school personnel are required to review the accuracy of all data associated with the applicable CALPADS submission. CALPADS data certification must be performed by district superintendents, charter school administrators, or their designees. Please contact the district or school if you have any questions about their certified CALPADS data.

Source: Absenteeism and Cumulative Enrollment data are submitted and certified by LEAs and/or charter schools as part of the annual CALPADS End of Year 3 submission.

Note: An asterisk (*) appearing in a data field is used to protect student privacy.

Using the Absenteeism Data File
This file contains different subsets of data based on the values of different variables. If these sub-setting variables are not used properly, it is easy to end up with incorrect or duplicative data. Please refer to the following examples below as a guide for properly using these data:

Get school-level data totals with one record per school with school totals (without student group totals)
Aggregate Level = S (School)
Charter School (Y/N) = Y and N
DASS (Y/N) = Y and N
Reporting Category = TA

Get school-level data totals by student group (Reporting Category) for all non-charter schools
Aggregate Level = S (School)
Charter School (Y/N) = N
DASS (Y/N) = Y and N
Reporting Category Not equal to TA

Get school-level data totals by student group (Reporting Category) for all DASS schools
Aggregate Level = S (School)
Charter School (Y/N) = Y and N
DASS (Y/N) = Y
Reporting Category Not equal to TA

Get district-level data totals by student group (Reporting Category) for non-charter schools
Aggregate Level = D (District)
Charter School (Y/N) = N
DASS (Y/N) = All
Reporting Category Not equal to TA

Get statewide-level data totals for charter schools that are DASS schools
Aggregate Level = T (State)
Charter School (Y/N) = Y
DASS (Y/N) = Y
Reporting Category = TA
