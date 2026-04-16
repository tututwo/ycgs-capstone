# Data

## Raw Data

`data/raw/school_fire/` contains the school closure dataset and its codebook. This dataset is included because it is the core project input and is used directly by the Quarto report.

`data/raw/DistrictAreas2425/` contains California Department of Education district boundary files used for reference district maps.

`data/raw/cde_attendance/` is the expected location for local CDE attendance files. The full CDE files are public and can be downloaded with:

```bash
Rscript scripts/download_cde_data.R
```

The analysis also works without local CDE files by reading the official CDE URLs directly.

## Metadata

`data/metadata/` contains CDE file structure notes, variable definitions, privacy/suppression notes, and filtering guidance. These files are important because CDE attendance files contain overlapping aggregation levels and reporting categories; using the wrong filters can duplicate totals.

## Privacy

CDE suppresses small attendance cells with `*`. The analysis treats suppressed values as missing, not zero.
