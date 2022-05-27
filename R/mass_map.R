#' simple function to display HTML map of MA
#' @importFrom leaflet leaflet addTiles setView
#' @examples
#' if (interactive()) mass_map()
#' @export
mass_map = function()  {
  rr <- tags$div(
   HTML('<h4>Made with YESCDS::mass_map()</h4>')
  )  
  leaflet() |> addProviderTiles("CartoDB.Positron") |> 
       setView(-71.78, 42.05, zoom = 8.5) |> addControl(rr, position = "topleft", className="map-title")
  }


#' simple function to display HTML map of US
#' @param provider character(1) passed to `leaflet::addProviderTiles`, defaults to
#' `"CartoDB.Positron"`
#' @examples
#' if (interactive()) mass_map()
#' @export
us_map = function(provider="CartoDB.Positron") 
  leaflet() |> addTiles() |>
    addProviderTiles ( provider=provider ) |> setView(-93.9, 39.0, zoom = 4)


#' map cancer rates for selected sites to MA counties
#' @importFrom htmltools HTML
#' @param body_site character(1) defaults to "breast", can also take value "prostate"
#' @examples
#' mass_cancer_map()
#' @export
mass_cancer_map = function(site = "breast") {
 data("us_county_geo", package="YESCDS")
 rate.tab = MA_cancer_rate_table(site=site)
 lj = left_join(mutate(rate.tab, county=County),   # mutate: obtain new variable name
                filter(us_county_geo, state=="MA"), by="county") # merge rates and geography
 lj$lng = sapply(lj$geometry, "[", 1) # "geometry" is a special structure
 lj$lat = sapply(lj$geometry, "[", 2) # need to peel apart latitude and longitude
 lj$aarat = lj$Age.Adjusted.Rate   # shorter name
 content = paste(lj$Cancer.Type[1], lj$county, lj$aarat, sep="<br/>") # multiline labels take some work
 content = lapply( content, htmltools::HTML )
 mass_map() |>                     
    leaflet::addLabelOnlyMarkers(lat=lj$lat, lng=lj$lng, 
          label = content, labelOptions=labelOptions(noHide=TRUE))
}
