#' simple tables of confidence intervals for cancer incidence
#' @return a CSV file with columns as provided via \url{https://gis.cdc.gov/CANCER/USCS/#/StateCounty/}
#' @param site character(1) name of anatomic site, either "breast" or "prostate"
#' @param simple logical(1) defaults to TRUE, omits state and sex for demonstrative tables
#' @examples
#' btab = MA_cancer_rate_table("breast")
#' dim(btab)
#' names(btab)
#' @export
MA_cancer_rate_table = function(site="breast", simple=TRUE) {
 stopifnot(site %in% c("breast", "prostate"))
 if (site == "prostate") ans = read.csv(system.file("csv/MASSProstateWCI.csv", package="YESCDS"))
 ans = read.csv(system.file("csv/MABreastWCI.csv", package="YESCDS"))
 if (simple) ans = ans[, -c(1,5)]
 ans
}

#' generate vector of cancer sites in CDC Wonder table
#' @export
woncan_types = function() {
  data("woncan", package="YESCDS")
  sort(unique( woncan$`Cancer Sites`))
}

#' generate site-specific rate table
#' @importFrom dplyr filter mutate
#' @param site character(1) name of anatomic site, must reside in value of `woncan_types()`
#' @export
filter_woncan = function(site) {
  stopifnot(site %in% woncan_types())
  woncan |> dplyr::filter(`Cancer Sites` == site) |> dplyr::mutate(aarate=Age.Adjusted.Rate)
}


#' simplify table view of WONDER CDC statistsics
#' @param site character(1) name of anatomic site, must reside in value of `woncan_types()`
#' @export
table_woncan = function(site) {
  data("woncan", package="YESCDS")
  DT::datatable(filter_woncan(site))
}
