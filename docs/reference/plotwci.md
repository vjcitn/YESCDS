# simple display of confidence intervals for cancer incidence

simple display of confidence intervals for cancer incidence

## Usage

``` r
plotwci(
  tab,
  metric = "incidence per 100000 2014-2018",
  site = "Overall",
  xlab = "Massachusetts counties",
  ylim = c(350, 620)
)
```

## Arguments

- tab:

  a CSV file with columns as provided via
  <https://gis.cdc.gov/CANCER/USCS/#/StateCounty/>

- metric:

  character(1) detailed description of statistic

- site:

  character(1) name of anatomic site

- xlab:

  character(1) label for x axis

- ylim:

  numeric(2) extent of y axis in units of incidence per 100000

## Examples

``` r
oldpar = par(no.readonly=TRUE)
prost = read.csv(system.file("csv/MASSProstateWCI.csv", package="YESCDS"))
bre = read.csv(system.file("csv/MABreastWCI.csv", package="YESCDS"))
par(mfrow=c(1,2))
plotwci(prost, site="Prostate", ylim=c(60,270))
plotwci(bre, site="Breast", ylim=c(60,280))

par(oldpar)
```
