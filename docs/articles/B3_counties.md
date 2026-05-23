<div id="main" class="col-md-9" role="main">

# B3 Cancer in our counties

    ## Warning: multiple methods tables found for 'scale'

    ## Warning: replacing previous import 'BiocGenerics::scale' by
    ## 'DelayedArray::scale' when loading 'SummarizedExperiment'

<div class="section level2">

## Cancer rates in Massachusetts counties, tabulated

<div id="cb3" class="sourceCode">

``` r
datatable(MA_cancer_rate_table())
```

</div>

<div id="htmlwidget-ac96cb3ee4656e2e9ec3"
class="datatables html-widget html-fill-item"
style="width:100%;height:auto;">

</div>

</div>

<div class="section level2">

## Mapping the rates

<div id="cb4" class="sourceCode">

``` r
mass_cancer_map()
```

</div>

<div id="htmlwidget-e5c8c404fe174e4c81bd"
class="leaflet html-widget html-fill-item"
style="width:700px;height:432.632880098888px;">

</div>

</div>

<div class="section level2">

## Addressing uncertainty in the rates

The reported rates are statistics collected over time and are adjusted
using a model for age distribution in the US. The counts on which the
reported rates are imprecise. Therefore “confidence limits” are produced
with the rate estimates.

Here are the prostate cancer rates in Massachusetts counties, plotted
with confidence limits.

<div id="cb5" class="sourceCode">

``` r
plotwci(MA_cancer_rate_table("prostate"), ylim=c(90,270))
```

</div>

![](B3_counties_files/figure-html/lkd5-1.png)

One message from this display is that prostate cancer in Nantucket
county has an estimated age-adjusted incidence in 2014-2018 of about 200
cases per 100000 men, but the actual rate may be lower or higher. The
uncertainty of the estimate arises from the relatively small population
of Nantucket county.

</div>

<div class="section level2">

## Exercises

B.3.1 What are the reported population sizes for Middlesex and Nantucket
counties?

B.3.2 Run the following chunk to produce a different representation of
incidence rates for cancers of lung and bronchus in California counties:

    ordered_seg_cal()

Two statistics are presented for the US as a whole and for the entire
state of California.

B.3.3 True or False: We are fairly confident that the incidence of
cancers of lung and bronchus in San Joaquin county is lower than that of
the US as a whole.

The midpoint of the plotted interval is the estimated incidence rate.

B.3.4 Which California counties have incidence rates that are around
half that of the US as a whole?

</div>

<div class="section level2">

## Answers

    B.3.1

    B.3.2

    B.3.3

    B.3.4

</div>

</div>
