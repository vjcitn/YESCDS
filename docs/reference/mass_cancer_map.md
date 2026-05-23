<div id="main" class="col-md-9" role="main">

# map cancer rates for selected sites to MA counties

<div class="ref-description section level2">

map cancer rates for selected sites to MA counties

</div>

<div class="section level2">

## Usage

<div class="sourceCode">

``` r
mass_cancer_map(site = "breast")
```

</div>

</div>

<div class="section level2">

## Arguments

-   site:

    character(1) defaults to "breast", can also take value "prostate"

</div>

<div class="section level2">

## Examples

<div class="sourceCode">

``` r
mass_cancer_map()

{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["CartoDB.Positron",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addControl","args":["<div><h4>Made with YESCDS::mass_map()<\/h4><\/div>","topleft",null,"map-title"]},{"method":"addMarkers","args":[[42.584504,42.338551,42.371493,41.748588,42.136198,41.38097,42.311693,41.987196,42.642708,42.339459,42.481718,42.171739,41.799014,41.305878],[-72.591792,-71.018253,-73.217928,-71.088894,-72.635648,-70.701499,-71.940282,-70.74194199999999,-70.864909,-72.66369400000001,-71.39491599999999,-71.181111,-70.21187999999999,-70.14191],{"iconUrl":{"data":"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=","index":0},"iconWidth":1,"iconHeight":1},null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},null,null,null,null,["Female Breast<br/>Franklin County<br/>112.1","Female Breast<br/>Suffolk County<br/>115.5","Female Breast<br/>Berkshire County<br/>119.2","Female Breast<br/>Bristol County<br/>124.8","Female Breast<br/>Hampden County<br/>131.1","Female Breast<br/>Dukes County<br/>133.2","Female Breast<br/>Worcester County<br/>137.2","Female Breast<br/>Plymouth County<br/>137.4","Female Breast<br/>Essex County<br/>139.9","Female Breast<br/>Hampshire County<br/>139.9","Female Breast<br/>Middlesex County<br/>142","Female Breast<br/>Norfolk County<br/>149.9","Female Breast<br/>Barnstable County<br/>155.7","Female Breast<br/>Nantucket County<br/>206.7"],{"interactive":false,"permanent":true,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"setView":[[42.05,-71.78],8.5,[]],"limits":{"lat":[41.305878,42.642708],"lng":[-73.217928,-70.14191]}},"evals":[],"jsHooks":[]}
```

</div>

</div>

</div>
