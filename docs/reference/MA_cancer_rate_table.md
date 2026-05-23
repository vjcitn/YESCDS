<div id="main" class="col-md-9" role="main">

# simple tables of confidence intervals for cancer incidence

<div class="ref-description section level2">

simple tables of confidence intervals for cancer incidence

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
MA_cancer_rate_table(site = "breast", simple = TRUE)
```

</div>

</div>

<div class="section level2">

## Arguments

-   site:

    character(1) name of anatomic site, either "breast" or "prostate"

-   simple:

    logical(1) defaults to TRUE, omits state and sex for demonstrative
    tables

</div>

<div class="section level2">

## Value

a CSV file with columns as provided via
<https://gis.cdc.gov/CANCER/USCS/#/StateCounty/>

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
btab = MA_cancer_rate_table("breast")
dim(btab)
#> [1] 14  8
names(btab)
#> [1] "County"            "Cancer.Type"       "Year"             
#> [4] "Age.Adjusted.Rate" "lci"               "uci"              
#> [7] "Case.Count"        "Population"       
```

</div>

</div>

</div>
