#' use shiny to explore aspects of geographic mapping
#' @import shiny
#' @import leaflet
#' @export
map_app = function() {
 cwd = getwd()
 on.exit(setwd(cwd))
 setwd(system.file("map_app", package="YESCDS"))
 shiny::runApp()
}


#' simple function for site-specific map
#' @param site character(1) defaults to "Stomach", must lie in value of woncan_types()
#' @param scaling numeric(1) scales the radius of circles, defaults to 1
#' @param table.only logical(1) defaults to FALSE; if TRUE just produces CDC WONDER data filtered to selected site
#' @export
cancer_map_usa = function( site = "Stomach", scaling = 1, table.only=FALSE ) {
    dat = filter_woncan(site=site)
    if (table.only) return(dat)
    suppressWarnings({
      m = us_map() |> addCircleMarkers(lat=dat$lat, lng=dat$lng, radius=scaling * dat$aarate,
          # popup=htmltools::htmlEscape(paste( site, ": ", dat$aarate, sep="")))
          popup=(paste( dat$msa, "<br>", site, ": ", dat$aarate, sep=""))) |> 
          addControl(paste("CDC WONDER age-adjusted rate per 100K,", site, "cancer"), position = "topleft", className="map-title")
      })
    m
    }

#' use shiny for a simple cancer map, by type, for US
#' @import shiny
#' @import leaflet
#' @export
cancer_map_app = function() {
 cwd = getwd()
 on.exit(setwd(cwd))
 setwd(system.file("cancer_map", package="YESCDS"))
 shiny::runApp()
}

