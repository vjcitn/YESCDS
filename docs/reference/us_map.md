<div id="main" class="col-md-9" role="main">

# simple function to display HTML map of US

<div class="ref-description section level2">

simple function to display HTML map of US

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
us_map(provider = "CartoDB.Positron")
```

</div>

</div>

<div class="section level2">

## Arguments

-   provider:

    character(1) passed to \`leaflet::addProviderTiles\`, defaults to
    \`"CartoDB.Positron"\`

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
if (interactive()) mass_map()
```

</div>

</div>

</div>
