# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working
with code in this repository.

## Package Overview

YESCDS is an R/Bioconductor package (biocViews: Cancer) that provides
data, functions, and interactive Shiny apps for teaching cancer data
science to secondary and undergraduate students as part of the DFCI/CZI
YES for CURE program. It is distributed via Bioconductor and follows
standard R package conventions.

## Common Commands

``` r
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

There is no test infrastructure (`testthat` not set up). Run
[`usethis::use_testthat()`](https://usethis.r-lib.org/reference/use_testthat.html)
to add it.

## Architecture

### Package layout

- `R/` — all exported functions and data documentation
- `data/` — `.rda` files for all bundled datasets
- `inst/` — Shiny app directories, CSV data files, scripts, and Jupyter
  notebooks
- `vignettes/` — curriculum modules A0–E2 as `.Rmd` files

### Core function groups

**Dataset access** (`R/tabs.R`, `R/data.R`): Utilities to filter and
summarize bundled datasets —
[`woncan_types()`](https://github.com/vjcitn/YESCDS/reference/woncan_types.md),
[`filter_woncan()`](https://github.com/vjcitn/YESCDS/reference/filter_woncan.md),
[`table_woncan()`](https://github.com/vjcitn/YESCDS/reference/table_woncan.md),
[`MA_cancer_rate_table()`](https://github.com/vjcitn/YESCDS/reference/MA_cancer_rate_table.md).
Most datasets are loaded via `data(name, package="YESCDS")`.

**Maps** (`R/map_app.R`, `R/cancer_map_world.R`, `R/mass_map.R`):
Leaflet-based interactive maps for US MSA-level
([`cancer_map_usa()`](https://github.com/vjcitn/YESCDS/reference/cancer_map_usa.md)),
US state/county
([`map_app()`](https://github.com/vjcitn/YESCDS/reference/map_app.md),
[`mass_map()`](https://github.com/vjcitn/YESCDS/reference/mass_map.md)),
and global
([`cancer_map_world()`](https://github.com/vjcitn/YESCDS/reference/cancer_map_world.md))
cancer incidence. Circle radii are scaled by age-adjusted rate.

**Shiny apps** (`R/stapp.R`): Launcher functions
([`variation_app()`](https://github.com/vjcitn/YESCDS/reference/variation_app.md),
[`cancer_map_app()`](https://github.com/vjcitn/YESCDS/reference/cancer_map_app.md),
[`map_app()`](https://github.com/vjcitn/YESCDS/reference/map_app.md))
that [`setwd()`](https://rdrr.io/r/base/getwd.html) into `inst/<appdir>`
and call [`shiny::runApp()`](https://rdrr.io/pkg/shiny/man/runApp.html).
The actual `ui.R`/`server.R` files live in `inst/stapp/`,
`inst/cancer_map/`, `inst/map_app/`, and `inst/spatial_app/`.

**Survival analysis** (`R/survcode.R`, `R/build_surv.R`): Kaplan–Meier
curve helpers
([`build_simple_survival_curve()`](https://github.com/vjcitn/YESCDS/reference/build_simple_survival_curve.md),
[`show_median_estimate()`](https://github.com/vjcitn/YESCDS/reference/show_median_estimate.md),
[`show_5y_estimate()`](https://github.com/vjcitn/YESCDS/reference/show_5y_estimate.md),
[`do_new_surv()`](https://github.com/vjcitn/YESCDS/reference/do_new_surv.md)),
and
[`build_surv_for_mut()`](https://github.com/vjcitn/YESCDS/reference/build_surv_for_mut.md)
which pulls TCGA data via `curatedTCGAData` and returns a list with
`surv`, `coldata`, and `mutdata` for mutation-stratified KM analysis.

**Spatial transcriptomics** (`inst/spatial_app/`, `R/cache_hcc.R`):
Shiny app that displays H&E images and Visium spot assignments for two
HCC samples (“1R” responder, “6NR” non-responder). Large `.rda` files
are fetched from OSN (`mghp.osn.xsede.org`) and cached locally via
`BiocFileCache` through
[`get_hcc_spatial_path()`](https://github.com/vjcitn/YESCDS/reference/get_hcc_spatial_path.md).

**Visualization** (`R/viz.R`, `R/CIplots.R`):
[`make_hist()`](https://github.com/vjcitn/YESCDS/reference/make_hist.md),
[`plotwci()`](https://github.com/vjcitn/YESCDS/reference/plotwci.md),
[`make_comparison()`](https://github.com/vjcitn/YESCDS/reference/make_comparison.md),
[`compare_tumors()`](https://github.com/vjcitn/YESCDS/reference/compare_tumors.md),
[`ordered_seg_cal()`](https://github.com/vjcitn/YESCDS/reference/ordered_seg_cal.md)
(ordered CI segments for CA lung cancer data).

**Teaching utilities** (`R/poker.R`, `R/build_deck.R`): Card game
helpers
([`build_deck()`](https://github.com/vjcitn/YESCDS/reference/build_deck.md),
[`faces()`](https://github.com/vjcitn/YESCDS/reference/faces.md),
[`suits()`](https://github.com/vjcitn/YESCDS/reference/suits.md),
[`one_pair()`](https://github.com/vjcitn/YESCDS/reference/one_pair.md),
[`two_pairs()`](https://github.com/vjcitn/YESCDS/reference/two_pairs.md),
[`full_house()`](https://github.com/vjcitn/YESCDS/reference/full_house.md),
[`is_flush()`](https://github.com/vjcitn/YESCDS/reference/is_flush.md))
used for probability exercises.

### Curriculum vignettes

Vignettes in `vignettes/` are labeled A–E: - **A** — Foundations (rates,
monitoring, graphics, standardization) - **B** — Geography (global/US
county maps) - **C** — Biology (body sites, survival, molecular
subtypes) - **D** — Clinical trials (design, equipoise, randomization,
treatment comparison) - **E** — Advanced topics (inclusive genomics,
LLMs in R)

### Key dependencies

- `shiny`, `leaflet`, `plotly`, `ggplot2` — interactive visualizations
- `sf` — geospatial data (county/world polygons in `us_county_geo`,
  `world_geo_sf`)
- `survival` — Kaplan–Meier survival analysis
- `SummarizedExperiment`, `curatedTCGAData`, `TCGAutils` — Bioconductor
  genomics
- `BiocFileCache` — caching remote HCC spatial data files
- `dplyr`, `forcats`, `data.table` — data manipulation

### Data flow for spatial app

`get_hcc_spatial_path("1R")` → checks `BiocFileCache` → downloads from
OSN if missing → returns local `.rda` path →
[`load()`](https://rdrr.io/r/base/load.html) in `server.R` produces
`hcc1rYES` (a `SingleCellExperiment`-derived object with `array_col`,
`array_row`, `clustid` fields).
