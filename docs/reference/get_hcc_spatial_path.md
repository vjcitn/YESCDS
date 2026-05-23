<div id="main" class="col-md-9" role="main">

# retrieve or cache SingleCellExperiment data for spatial transcriptomics of HCC

<div class="ref-description section level2">

retrieve or cache SingleCellExperiment data for spatial transcriptomics
of HCC

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
get_hcc_spatial_path(sample = "1R", cache = BiocFileCache::BiocFileCache())
```

</div>

</div>

<div class="section level2">

## Arguments

-   sample:

    character(1) either "1R" or "6NR"

-   cache:

    cache instance likely inheriting from BiocFileCache::BiocFileCache

</div>

<div class="section level2">

## Value

character(1) path to rda file

</div>

<div class="section level2">

## Note

<https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM7661255> is the
basis for the "1R" example. <https://pubmed.ncbi.nlm.nih.gov/37723590/>
is the primary paper.

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
get_hcc_spatial_path()
#> [1] "/Users/vincentcarey/Library/Caches/org.R-project.R/R/BiocFileCache/525849d02c84_hcc1rYES.rda"
```

</div>

</div>

</div>
