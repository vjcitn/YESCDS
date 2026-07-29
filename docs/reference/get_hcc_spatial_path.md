# retrieve or cache SingleCellExperiment data for spatial transcriptomics of HCC

retrieve or cache SingleCellExperiment data for spatial transcriptomics
of HCC

## Usage

``` r
get_hcc_spatial_path(sample = "1R", cache = BiocFileCache::BiocFileCache())
```

## Arguments

- sample:

  character(1) either "1R" or "6NR"

- cache:

  cache instance likely inheriting from BiocFileCache::BiocFileCache

## Value

character(1) path to rda file

## Note

<https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM7661255> is the
basis for the "1R" example. <https://pubmed.ncbi.nlm.nih.gov/37723590/>
is the primary paper.

## Examples

``` r
get_hcc_spatial_path()
#> [1] "C:\\Users\\Nancy Laranjo\\AppData\\Local/R/cache/R/BiocFileCache/41a85e08635d_hcc1rYES.rda"
```
