# use curatedTCGAData to produce survival time structure and mutation matrix for a TCGA tumor type

use curatedTCGAData to produce survival time structure and mutation
matrix for a TCGA tumor type

## Usage

``` r
build_surv_for_mut(project = "BRCA", min.numevents = 10)
```

## Arguments

- project:

  character(1), defaults to "BRCA"

- min.numevents:

  numeric(1), defaults to 10; fail if there are fewer than this number
  of events overall

## Value

a list with components surv, coldata, and mutdata

## Note

observations lacking positive follow up time are silently omitted

## Examples

``` r
requireNamespace("survival")
br = build_surv_for_mut("BRCA")
#> snapshotDate(): 2026-04-21
#> Querying and downloading: BRCA_Mutation-20160128
#> see ?curatedTCGAData and browseVignettes('curatedTCGAData') for documentation
#> loading from cache
#> require(“RaggedExperiment”)
#> Querying and downloading: BRCA_colData-20160128
#> see ?curatedTCGAData and browseVignettes('curatedTCGAData') for documentation
#> loading from cache
#> Querying and downloading: BRCA_metadata-20160128
#> see ?curatedTCGAData and browseVignettes('curatedTCGAData') for documentation
#> loading from cache
#> Querying and downloading: BRCA_sampleMap-20160128
#> see ?curatedTCGAData and browseVignettes('curatedTCGAData') for documentation
#> loading from cache
#> harmonizing input:
#>   removing 14592 sampleMap rows not in names(experiments)
#>   removing 121 colData rownames not in sampleMap 'primary'
has_TTN = apply(br$mutdata, 2, function(x) any(x == "TTN", na.rm=TRUE))
fi = survival::survfit(br$surv ~ has_TTN)
plot(fi, lwd=2, col=c("blue", "orange"), xlab = "t = Years from diagnosis", ylab="S(t) = Prob(survive beyond t)")  # KM-plot
legend(.1, .3, lwd=2, col=c("blue", "orange"), lty=1, legend=c("TTN wild-type", "TTN-mutant"), bty="n")
title("TCGA BRCA survival")
```
