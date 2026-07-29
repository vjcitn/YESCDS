# B3 Cancer in our counties

## Cancer rates in Massachusetts counties, tabulated

``` r

datatable(MA_cancer_rate_table())
```

## Mapping the rates

``` r

mass_cancer_map()
```

## Addressing uncertainty in the rates

The reported rates are statistics collected over time and are adjusted
using a model for age distribution in the US. The counts on which the
reported rates are imprecise. Therefore “confidence limits” are produced
with the rate estimates.

Here are the prostate cancer rates in Massachusetts counties, plotted
with confidence limits.

``` r

plotwci(MA_cancer_rate_table("prostate"), ylim=c(90,270))
```

![](B3_counties_files/figure-html/lkd5-1.png)

One message from this display is that prostate cancer in Nantucket
county has an estimated age-adjusted incidence in 2014-2018 of about 200
cases per 100000 men, but the actual rate may be lower or higher. The
uncertainty of the estimate arises from the relatively small population
of Nantucket county.

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

## Answers

    B.3.1

    B.3.2

    B.3.3

    B.3.4
