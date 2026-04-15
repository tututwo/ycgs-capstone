Yes — if you switch to the **official chronic absenteeism files**, your EDA becomes cleaner.

The chronic absenteeism files already give you **eligible cumulative enrollment, chronic absenteeism counts, and chronic absenteeism rates**, and they exist at **state, county, district, and school** levels. The metadata also warns that you need to subset carefully: for **unduplicated totals**, choose one aggregate level and use **Reporting Category = TA**; the same files can also be broken out by race/ethnicity, gender, program subgroup, and grade span. Cells are suppressed when eligible enrollment is **10 or fewer**. ([California Department of Education][1])

One important design choice: the California School Dashboard’s **Chronic Absenteeism Indicator** is defined as the share of students absent **10% or more** of the instructional days they were enrolled to attend, and the Dashboard version applies to **TK–8** districts and schools. The downloadable files also include grade-span breakdowns such as **GRK8** and **GR912**, so you can either align the main story to TK–8 or deliberately analyze all grades and say so clearly. Also, the CDE says **2019–20 absenteeism data are unavailable** because they are not valid/reliable after COVID-era disruption. ([California Department of Education][2])

## The EDA questions I would raise

I would keep it to **five core questions**.

### 1. In the matched years, are wildfires a major driver of school disruption?

This stays as your opening EDA question.
You already know how to do it:

* statewide closure days by cause
* wildfire share of total closure days
* maybe percent of schools with any wildfire closure

This just sets up why 2017–18 and 2018–19 matter.

### 2. Where is wildfire disruption concentrated?

This is your geography question.

Use **wildfire missed student-days** as the main burden metric, because it combines closure duration with the number of students exposed. Then ask:

* Which **counties** had the most wildfire missed student-days?
* Which **districts** and **schools** were most affected?
* How concentrated is the burden?

This stays the backbone of the project.

### 3. Are places with more wildfire disruption also showing higher chronic absenteeism rates?

This is the new core Step 3.

At minimum, I would ask it at the **county level** first:

* Do counties with more wildfire missed student-days also have higher chronic absenteeism rates?

Then, if the join is clean enough, repeat at the **school** or **district** level:

* Do higher-burden school-years tend to have higher chronic absenteeism rates?

This is the closest match to your story question.

### 4. Is the overlap driven by a few places, or is it broader?

This is a very useful EDA question because it turns the scatterplot into a map story.

Ask:

* Are the counties with the highest wildfire burden also among the counties with the highest chronic absenteeism?
* How many of the top 10 wildfire-burden counties also rank high on chronic absenteeism?

This can become a simple overlap table or a labeled scatterplot.

### 5. Does the pattern hold under a second definition of “high burden”?

Keep one sensitivity check, not many.

Ask:

* If I define “high wildfire burden” as top 25% of affected units, do I see the same chronic absenteeism pattern as when I use top 10%?
* Does the relationship look similar when I compare **rate** and **count** versions?

That keeps your results from looking arbitrary.

---

## The one optional extension I’d actually consider

Because the official chronic absenteeism indicator is TK–8 on the Dashboard, but the downloadable files also include **GRK8** and **GR912**, the cleanest extension is:

### Optional extension: Does the wildfire–chronic absenteeism pattern differ between K–8 and grades 9–12?

That is a genuinely strong EDA question because it is:

* supported by the metadata,
* easy to justify,
* and still closely tied to your main story. ([California Department of Education][2])

If you do this, I would not also do race, EL, SWD, foster, homeless, charter, and DASS all at once.

---

## Questions I would **not** add unless you have extra time

The metadata allows subgroup analysis for:

* English learners,
* students with disabilities,
* socioeconomically disadvantaged,
* migrant,
* foster,
* homeless,
* plus race/ethnicity and gender. ([California Department of Education][3])

Those are good future directions, but for this capstone they can easily explode your scope.

So I would **not** make these core EDA questions:

* Which subgroup has the highest chronic absenteeism everywhere?
* Are charter schools different?
* Are DASS schools different?
* How do all race/gender/subgroup patterns compare?

Pick **one** extension only, if any.

---

## The final EDA structure I’d recommend

### Core EDA

1. **Are wildfires a major closure cause in 2017–18 and 2018–19?**
2. **Where is wildfire missed student-day burden highest?**
3. **Do higher-burden counties/districts/schools also have higher chronic absenteeism rates?**
4. **Which places rank high on both?**
5. **Is that pattern robust to a second high-burden cutoff?**

### Optional extension

6. **Does the relationship differ for GRK8 vs GR912?**

---

## One very important data-handling note

For your first pass, use the chronic absenteeism files in the simplest possible way:

* **Aggregate Level = C or S**
* **Reporting Category = TA**
* one row per county or school total
* chronic absenteeism **rate** as your main outcome
* eligible cumulative enrollment as the size/weight variable

That follows the CDE’s own guidance for getting unduplicated totals. ([California Department of Education][3])

---

## My strongest recommendation

If you want the cleanest capstone, I would make the main EDA question set:

**Where is wildfire disrupting schooling the most in 2017–18 and 2018–19, and do those same counties show higher chronic absenteeism rates?**

Then only add **K–8 vs 9–12** if you want one extra layer.

If you want, next I’ll turn these into a concrete **chart list**: exactly which 6–8 figures to make for the final notebook.

[1]: https://www.cde.ca.gov/ds/ad/filesabd.asp "Chronic Absenteeism Data - Accessing Educational Data (CA Dept of Education)"
[2]: https://www.cde.ca.gov/ta/ac/cm/dashboardchronic.asp "Chronic Absenteeism Indicator  - California School Dashboard and System of Support (CA Dept of Education)"
[3]: https://www.cde.ca.gov/ds/ad/fsabd.asp "File Structure: Chronic Absenteeism Data - Accessing Educational Data (CA Dept of Education)"
