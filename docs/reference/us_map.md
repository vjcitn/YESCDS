# simple function to display HTML map of US

simple function to display HTML map of US

## Usage

``` r
us_map(provider = "CartoDB.Positron")
```

## Arguments

- provider:

  character(1) passed to \`leaflet::addProviderTiles\`, defaults to
  \`"CartoDB.Positron"\`

## Examples

``` r
if (interactive()) mass_map()

{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["CartoDB.Positron",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addControl","args":["<div><h4>Made with YESCDS::mass_map()<\/h4><\/div>","topleft",null,"map-title"]}],"setView":[[42.05,-71.78],8.5,[]]},"evals":[],"jsHooks":[]}
```
