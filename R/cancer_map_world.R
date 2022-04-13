#' simple map of cancer rates world wide
#' @note used https://gco.iarc.fr/today/online-analysis-map table CSV exports, some
#' cleanup of special characters
#' @param world_tab a data.frame as produced by gco.iarc.fr
#' @examples
#' data(world_cancer_2020_all)
#' cancer_map_world()
#' @export
cancer_map_world = function( world_tab = world_cancer_2020_all ) {
  data(world_geo_sf)
  wgeo = world_geo_sf[, c("iso_a3", "name_long", "lat", "lng")]
  lj = dplyr::left_join( dplyr::mutate(world_tab, iso_a3 = ISO.code), wgeo, by="iso_a3")
  provider = "CartoDB.Positron"
  xx = setView(addProviderTiles(addTiles(leaflet()), provider = provider),
    -93.9, 39, zoom = 3)
  xx |> addCircleMarkers(lat=lj$lat, lng=lj$lng, radius=.05*lj$Value, 
          popup=paste(lj$Population, "<br>", lj$Value, sep=""))
}
