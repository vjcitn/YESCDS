# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Package Overview

YESCDS is an R/Bioconductor package (biocViews: Cancer) that provides data, functions, and interactive Shiny apps for teaching cancer data science to secondary and undergraduate students as part of the DFCI/CZI YES for CURE program. It is distributed via Bioconductor and follows standard R package conventions.

## Common Commands

```r
# Regenerate documentation from roxygen2 comments
devtools::document()

# Build the package tarball
R CMD build .

# Run R CMD check
R CMD check YESCDS_*.tar.gz
# or interactively:
devtools::check()

# Install locally for development
devtools::install()

# Build pkgdown site
pkgdown::build_site()
```

There is no test infrastructure (`testthat` not set up). Run `usethis::use_testthat()` to add it.

## Architecture

### Package layout

- `R/` — all exported functions and data documentation
- `data/` — `.rda` files for all bundled datasets
- `inst/` — Shiny app directories, CSV data files, scripts, and Jupyter notebooks
- `vignettes/` — curriculum modules A0–E2 as `.Rmd` files

### Core function groups

**Dataset access** (`R/tabs.R`, `R/data.R`): Utilities to filter and summarize bundled datasets — `woncan_types()`, `filter_woncan()`, `table_woncan()`, `MA_cancer_rate_table()`. Most datasets are loaded via `data(name, package="YESCDS")`.

**Maps** (`R/map_app.R`, `R/cancer_map_world.R`, `R/mass_map.R`): Leaflet-based interactive maps for US MSA-level (`cancer_map_usa()`), US state/county (`map_app()`, `mass_map()`), and global (`cancer_map_world()`) cancer incidence. Circle radii are scaled by age-adjusted rate.

**Shiny apps** (`R/stapp.R`): Launcher functions (`variation_app()`, `cancer_map_app()`, `map_app()`) that `setwd()` into `inst/<appdir>` and call `shiny::runApp()`. The actual `ui.R`/`server.R` files live in `inst/stapp/`, `inst/cancer_map/`, `inst/map_app/`, and `inst/spatial_app/`.

**Survival analysis** (`R/survcode.R`, `R/build_surv.R`): Kaplan–Meier curve helpers (`build_simple_survival_curve()`, `show_median_estimate()`, `show_5y_estimate()`, `do_new_surv()`), and `build_surv_for_mut()` which pulls TCGA data via `curatedTCGAData` and returns a list with `surv`, `coldata`, and `mutdata` for mutation-stratified KM analysis.

**Spatial transcriptomics** (`inst/spatial_app/`, `R/cache_hcc.R`): Shiny app that displays H&E images and Visium spot assignments for two HCC samples ("1R" responder, "6NR" non-responder). Large `.rda` files are fetched from OSN (`mghp.osn.xsede.org`) and cached locally via `BiocFileCache` through `get_hcc_spatial_path()`.

**Visualization** (`R/viz.R`, `R/CIplots.R`): `make_hist()`, `plotwci()`, `make_comparison()`, `compare_tumors()`, `ordered_seg_cal()` (ordered CI segments for CA lung cancer data).

**Teaching utilities** (`R/poker.R`, `R/build_deck.R`): Card game helpers (`build_deck()`, `faces()`, `suits()`, `one_pair()`, `two_pairs()`, `full_house()`, `is_flush()`) used for probability exercises.

### Curriculum vignettes

Vignettes in `vignettes/` are labeled A–E:
- **A** — Foundations (rates, monitoring, graphics, standardization)
- **B** — Geography (global/US county maps)
- **C** — Biology (body sites, survival, molecular subtypes)
- **D** — Clinical trials (design, equipoise, randomization, treatment comparison)
- **E** — Advanced topics (inclusive genomics, LLMs in R)

### Key dependencies

- `shiny`, `leaflet`, `plotly`, `ggplot2` — interactive visualizations
- `sf` — geospatial data (county/world polygons in `us_county_geo`, `world_geo_sf`)
- `survival` — Kaplan–Meier survival analysis
- `SummarizedExperiment`, `curatedTCGAData`, `TCGAutils` — Bioconductor genomics
- `BiocFileCache` — caching remote HCC spatial data files
- `dplyr`, `forcats`, `data.table` — data manipulation

### Data flow for spatial app

`get_hcc_spatial_path("1R")` → checks `BiocFileCache` → downloads from OSN if missing → returns local `.rda` path → `load()` in `server.R` produces `hcc1rYES` (a `SingleCellExperiment`-derived object with `array_col`, `array_row`, `clustid` fields).
