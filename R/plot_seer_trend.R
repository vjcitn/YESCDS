#' plot the rate statistics over time for selected cancer sites and subgroups
#' @param tab a data.frame like that obtained with `data(SEER_2018)`
#' @param site.name character(1) cancer site name as used by SEER, possible choices are
#'  `"Lung and Bronchus", "Pancreas", "Leukemia", "Kidney and Renal Pelvis"`
#' @param gender character(1) either "Male" or "Female"
#' @param race character(1) can be "All Races", or "White", or "Black"
#' @examples
#' data(SEER_2018)
#' plot_seer_trend(SEER_2018, site.name = "Kidney and Renal Pelvis")
#' @export
plot_seer_trend = function(tab, site.name = "Lung and Bronchus", gender = "Male",
     race="All Races") {
  available_sites = c("Lung and Bronchus", "Pancreas", "Leukemia", "Kidney and Renal Pelvis")
  available_races = c("White", "Black", "All Races")
  available_gender = c("Male", "Female")
  stopifnot(site.name %in% available_sites)
  stopifnot(race %in% available_races)
  stopifnot(gender %in% available_gender)
  dat = tab |> filter(Race == race & Sex == gender & CancerSite == site.name)
  with(dat, plot(Year, rate.2.2018, xlab="Year", ylab=paste("Age adjusted incidence/100000, ", gender), main=site.name))
}
