<div id="main" class="col-md-9" role="main">

# use curatedTCGAData to produce survival time structure and mutation matrix for a TCGA tumor type

<div class="ref-description section level2">

use curatedTCGAData to produce survival time structure and mutation
matrix for a TCGA tumor type

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
build_surv_for_mut(project = "BRCA", min.numevents = 10)
```

</div>

</div>

<div class="section level2">

## Arguments

-   project:

    character(1), defaults to "BRCA"

-   min.numevents:

    numeric(1), defaults to 10; fail if there are fewer than this number
    of events overall

</div>

<div class="section level2">

## Value

a list with components surv, coldata, and mutdata

</div>

<div class="section level2">

## Note

observations lacking positive follow up time are silently omitted

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
requireNamespace("survival")
br = build_surv_for_mut("BRCA")
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

</div>

</div>

</div>
