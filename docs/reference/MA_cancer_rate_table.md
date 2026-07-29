# simple tables of confidence intervals for cancer incidence

simple tables of confidence intervals for cancer incidence

## Usage

``` r
MA_cancer_rate_table(site = "breast", simple = TRUE)
```

## Arguments

- site:

  character(1) name of anatomic site, either "breast" or "prostate"

- simple:

  logical(1) defaults to TRUE, omits state and sex for demonstrative
  tables

## Value

a CSV file with columns as provided via
<https://gis.cdc.gov/CANCER/USCS/#/StateCounty/>

## Examples

``` r
btab = MA_cancer_rate_table("breast")
dim(btab)
#> [1] 14  8
names(btab)
#> [1] "County"            "Cancer.Type"      
#> [3] "Year"              "Age.Adjusted.Rate"
#> [5] "lci"               "uci"              
#> [7] "Case.Count"        "Population"       
```
