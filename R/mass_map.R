#' simple function to display HTML map of MA
#' @importFrom leaflet leaflet addTiles setView
#' @examples
#' if (interactive()) mass_map()
#' @export
mass_map = function()  {
  rr <- tags$div(
   HTML('<h4>Made by BiocYES::mass_map()</h4>')
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
