<div id="main" class="col-md-9" role="main">

# B2 Enhancing tables with geography

    ## Warning: multiple methods tables found for 'scale'

    ## Warning: replacing previous import 'BiocGenerics::scale' by
    ## 'DelayedArray::scale' when loading 'SummarizedExperiment'

<div class="section level2">

## Basic geographic data about US counties

The coordinates of central locations in US counties are provided in
`us_county_geo`.

<div id="cb3" class="sourceCode">

``` r
data(us_county_geo)
us_county_geo |> select(state, county, geometry) |> head()
```

</div>

    ## Simple feature collection with 6 features and 2 fields
    ## Geometry type: POINT
    ## Dimension:     XY
    ## Bounding box:  xmin: -87.74607 ymin: 30.65922 xmax: -85.4051 ymax: 33.97736
    ## CRS:           NA
    ## # A tibble: 6 × 3
    ##   state county                     geometry
    ##   <chr> <chr>                       <POINT>
    ## 1 AL    Autauga County (-86.64644 32.53224)
    ## 2 AL    Baldwin County (-87.74607 30.65922)
    ## 3 AL    Barbour County  (-85.4051 31.87025)
    ## 4 AL    Bibb County    (-87.12715 33.01589)
    ## 5 AL    Blount County  (-86.56644 33.97736)
    ## 6 AL    Bullock County (-85.71726 32.10176)

Coordinates for metropolitan statistical areas are provided by
“statcrunch”:

<div id="cb5" class="sourceCode">

``` r
data(statcrunch_msa)
head(statcrunch_msa)
```

</div>

    ##   rank                                         msa  pop2013  pop2020 changepct
    ## 1    1       New York-Newark-Jersey City, NY-NJ-PA 19949502 19567410      1.95
    ## 2    2          Los Angeles-Long Beach-Anaheim, CA 13131431 12828837      2.36
    ## 3    3          Chicago-Naperville-Elgin, IL-IN-WI  9537289  9461105      0.81
    ## 4    4             Dallas-Fort Worth-Arlington, TX  6810913  6426214      5.99
    ## 5    5        Houston-The Woodlands-Sugar Land, TX  6313158  5920416      6.63
    ## 6    6 Philadelphia-Camden-Wilmington, PA-NJ-DE-MD  6034678  5965343      1.16
    ##   changecat      lat        lng
    ## 1    0 to 5 40.71278  -74.00594
    ## 2    0 to 5 34.05223 -118.24368
    ## 3    0 to 5 41.87811  -87.62980
    ## 4   5 to 10 32.78014  -96.80045
    ## 5   5 to 10 29.76019  -95.36939
    ## 6    0 to 5 39.95233  -75.16379

This geographic data has already been used to enhance the CDC incidence
data in `woncan`:

<div id="cb7" class="sourceCode">

``` r
data(woncan)
woncan |> group_by(MSA) |> 
    summarize(lat=head(lat)[1], lng=head(lng)[1]) |> head()
```

</div>

    ## # A tibble: 6 × 3
    ##   MSA                                 lat    lng
    ##   <chr>                             <dbl>  <dbl>
    ## 1 Akron, OH                          41.1  -81.5
    ## 2 Albany-Schenectady-Troy, NY        42.7  -73.8
    ## 3 Albuquerque, NM                    35.1 -107. 
    ## 4 Allentown-Bethlehem-Easton, PA-NJ  40.6  -75.5
    ## 5 Atlanta-Sandy Springs-Roswell, GA  33.7  -84.4
    ## 6 Augusta-Richmond County, GA-SC     33.5  -82.0

<div class="section level3">

### Exercise

B.2.1 Create a new notebook cell and run
`YESCDS::table_woncan("Prostate")`

B.2.2 Use this table to find the latitude and longitude of Boston.

</div>

<div class="section level3">

### Answers

    B.2.1

    B.2.2

</div>

</div>

<div class="section level2">

## An interactive map of the US with cancer rates

After combining cancer rate data for a collection of cancer types and
metropolitan statistical areas, we can produce a map showing variation
in cancer incidence over the United States. Here is the example for
stomach cancer:

<div id="cb10" class="sourceCode">

``` r
cancer_map_usa(site="Stomach")
```

</div>

<div id="htmlwidget-ac96cb3ee4656e2e9ec3"
class="leaflet html-widget html-fill-item"
style="width:700px;height:432.632880098888px;">

</div>

<div class="section level3">

### Exercise

B.2.3 Create a new notebook cell and run
`cancer_map_usa(site="Prostate", scaling=0.05)`

B.2.4 Can you identify the area with the highest incidence of prostate
cancer?

</div>

<div class="section level3">

### Answers

    B.2.3

    B.2.4

</div>

</div>

<div class="section level2">

## A data graphic

Finally, to get a different view of variation in cancer rates across the
United States, run a cell with the following command. Geographic
location is lost, but the range of variation, and details of variation
can be seen very clearly in these displays.

    browseURL("https://vjcitn.shinyapps.io/ratevariation")

<div class="section level3">

### Exercise

B.2.5 Change the body site to “Pancreas” (remove “Brain”) and find,
using the histogram tab, the areas with highest and lowest age-adjusted
rates of pancreatic cancer.

</div>

<div class="section level3">

### Answer

    B.2.5

</div>

</div>

</div>
