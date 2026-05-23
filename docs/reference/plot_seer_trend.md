<div id="main" class="col-md-9" role="main">

# plot the rate statistics over time for selected cancer sites and subgroups

<div class="ref-description section level2">

plot the rate statistics over time for selected cancer sites and
subgroups

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
plot_seer_trend(
  tab,
  site.name = "Lung and Bronchus",
  gender = "Male",
  race = "All Races"
)
```

</div>

</div>

<div class="section level2">

## Arguments

-   tab:

    a data.frame like that obtained with \`data(SEER\_2018)\`

-   site.name:

    character(1) cancer site name as used by SEER, possible choices are
    \`"Lung and Bronchus", "Pancreas", "Leukemia", "Kidney and Renal
    Pelvis"\`

-   gender:

    character(1) either "Male" or "Female"

-   race:

    character(1) can be "All Races", or "White", or "Black"

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
data(SEER_2018)
plot_seer_trend(SEER_2018, site.name = "Kidney and Renal Pelvis")
```

</div>

</div>

</div>
