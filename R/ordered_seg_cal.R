#' big display of ordered CIs for California Lung and Bronchus incidence 2014-2018
#' @import ggplot2
#' @importFrom dplyr mutate
#' @importFrom forcats fct_reorder
#' @export
ordered_seg_cal = function() {
 x = read.csv(system.file("csv/california_lung_statecancerprof.csv", package="YESCDS"))
 names(x) = c(names(x)[1:2], "methlthppl", "aaincid", "lci", "uci", 
  "cirankn", "lcirank", "ucirank", "avgAnnualCount", "RecentTrend", "trend.note", "lci.tr", "uci.tr")
 xo = x[order(x$aaincid),]
 xo$oai  = 1:56
 xo |> mutate(County = fct_reorder(County, oai)) -> z
 ggplot(z, aes(x=lci, y=County))+geom_segment(aes(xend=uci, yend=County)) + 
  geom_point( aes(x=aaincid, y=County), size=.5 ) +
  xlab("Incidence per 100000 of cancer of lung and bronchus in California")
}
