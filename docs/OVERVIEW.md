# YESCDS: Cancer Data Science for YES for CURE

**YESCDS** is an R/Bioconductor package that provides code, data, and
interactive tools for teaching cancer data science to secondary and
undergraduate students. It was developed in support of the Dana-Farber
Cancer Institute (DFCI) and CZI **YES for CURE** collaboration — a
program designed to introduce young people to cancer research careers.

## Goals and Audience

The package is structured as a self-contained curriculum. Students
explore real public health datasets, build intuitions about cancer
epidemiology, practice reading interactive visualizations, and get a
first look at genomic data science — all within R. No prior programming
experience is assumed in the early modules.

## Curriculum Structure

The vignettes are organized into five thematic modules, labeled A
through E:

| Module | Topic | Key vignettes |
|----|----|----|
| **A — Foundations** | Cancer rates, public health data, basic graphics | A0 Intro, A1 Personal cancer data, A2 Rates, A3 Monitoring, A4–A6 Graphics & standardization |
| **B — Geography** | Global and US county-level incidence patterns | B1 Global cancer, B2 Tables + maps, B3 County-level data |
| **C — Biology** | Body sites, survival variation, molecular subtypes | C1 Body overview, C2 Survival curves, C3 Molecular origins |
| **D — Clinical trials** | Study design and causal inference | D1 Trial concepts, D2 Equipoise, D3 Randomization, D4 Comparing treatments |
| **E — Advanced topics** | Inclusive genomics education, LLMs in R | E1 Heidelberg 2022, E2 Language models and R |

## Bundled Datasets

YESCDS ships curated, ready-to-use datasets so students can start
exploring immediately:

- **`SEER_2018`** — age-adjusted US cancer incidence rates from NCI SEER
  (18 registry areas)
- **`woncan` / `woncan_meta`** — cancer rates by US Metropolitan
  Statistical Area (1999–2018) from CDC WONDER
- **`world_cancer_2020_all` + `world_geo_sf`** — global 2020 incidence
  data merged with country boundaries for mapping
- **`us_county_geo`** — US county spatial polygons (sf format)
- **`metabric`** — clinical features of the METABRIC breast cancer
  cohort (cBioPortal)
- **`prostate_met_adeno`** — metastatic prostate adenocarcinoma clinical
  data
- **`brcamutSE`** — BRCA mutation calls from TCGA in a
  `SummarizedExperiment` container
- **`canada_crude`** — crude Canadian cancer rates from Statistics
  Canada
- **`vjc_cancer_net`** — a small illustrative dataset of personal cancer
  contacts

## Interactive Applications

Several Shiny apps are bundled for hands-on exploration:

- **[`cancer_map_app()`](https://github.com/vjcitn/YESCDS/reference/cancer_map_app.md)**
  /
  **[`cancer_map_usa()`](https://github.com/vjcitn/YESCDS/reference/cancer_map_usa.md)**
  /
  **[`cancer_map_world()`](https://github.com/vjcitn/YESCDS/reference/cancer_map_world.md)**
  — leaflet-based maps of US and global cancer incidence; students can
  select cancer type and year interactively
- **[`map_app()`](https://github.com/vjcitn/YESCDS/reference/map_app.md)**
  /
  **[`mass_map()`](https://github.com/vjcitn/YESCDS/reference/mass_map.md)**
  — Massachusetts county cancer rate explorer
- **[`variation_app()`](https://github.com/vjcitn/YESCDS/reference/variation_app.md)**
  — interactive survival curve comparison across cancer subtypes
- **Spatial transcriptomics app** (`inst/spatial_app/`) — displays H&E
  images, Visium spot assignments, and gene expression for
  hepatocellular carcinoma (HCC) samples; introduces students to spatial
  genomics

## Key Functions

| Function | Purpose |
|----|----|
| [`plot_seer_trend()`](https://github.com/vjcitn/YESCDS/reference/plot_seer_trend.md) | Plot SEER incidence trends over time |
| [`build_simple_survival_curve()`](https://github.com/vjcitn/YESCDS/reference/build_simple_survival_curve.md) | Kaplan–Meier curve from clinical data |
| [`compare_tumors()`](https://github.com/vjcitn/YESCDS/reference/compare_tumors.md) / [`make_comparison()`](https://github.com/vjcitn/YESCDS/reference/make_comparison.md) | Side-by-side tumor subtype comparisons |
| [`show_5y_estimate()`](https://github.com/vjcitn/YESCDS/reference/show_5y_estimate.md) / [`show_median_estimate()`](https://github.com/vjcitn/YESCDS/reference/show_median_estimate.md) | Summarize survival statistics |
| [`woncan_types()`](https://github.com/vjcitn/YESCDS/reference/woncan_types.md) / [`table_woncan()`](https://github.com/vjcitn/YESCDS/reference/table_woncan.md) | Browse CDC WONDER cancer categories |
| [`ordered_seg_cal()`](https://github.com/vjcitn/YESCDS/reference/ordered_seg_cal.md) | Segmented genome copy-number visualization |
| [`make_hist()`](https://github.com/vjcitn/YESCDS/reference/make_hist.md) / [`plotwci()`](https://github.com/vjcitn/YESCDS/reference/plotwci.md) | Histogram and confidence interval plots for teaching |
| [`full_house()`](https://github.com/vjcitn/YESCDS/reference/full_house.md), [`suits()`](https://github.com/vjcitn/YESCDS/reference/suits.md), [`faces()`](https://github.com/vjcitn/YESCDS/reference/faces.md) | Card-game helpers for probability/statistics exercises |

## Technology Stack

- **R ≥ 4.0**, distributed via **Bioconductor** (biocViews: Cancer)
- Interactive visualizations: `shiny`, `leaflet`, `plotly`, `ggplot2`
- Geospatial: `sf` (simple features)
- Genomics: `SummarizedExperiment`, `curatedTCGAData`, `TCGAutils`
- Survival analysis: `survival`

## Funding and Contributors

Contributors include faculty and staff from the Channing Division of
Network Medicine (Mass General Brigham), Dana-Farber Cancer Institute,
and the Perelman School of Medicine (University of Pennsylvania). The
project is supported by NSF ACCESS, the Chan-Zuckerberg Initiative EOSS
Diversity program, NCI (5U24CA180996), and NHGRI (2U24HG004059).

Source and issue tracker: <https://github.com/vjcitn/YESCDS>
