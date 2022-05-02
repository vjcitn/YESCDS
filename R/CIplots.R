#' simple display of confidence intervals for cancer incidence
#' @param tab a CSV file with columns as provided via \url{https://gis.cdc.gov/CANCER/USCS/#/StateCounty/}
#' @param metric character(1) detailed description of statistic
#' @param site character(1) name of anatomic site
#' @param xlab character(1) label for x axis
#' @param ylim numeric(2) extent of y axis in units of incidence per 100000 
#' @examples
#' oldpar = par(no.readonly=TRUE)
#' prost = read.csv(system.file("csv/MASSProstateWCI.csv", package="YESCDS"))
#' bre = read.csv(system.file("csv/MABreastWCI.csv", package="YESCDS"))
#' par(mfrow=c(1,2))
#' plotwci(prost, site="Prostate", ylim=c(60,270))
#' plotwci(bre, site="Breast", ylim=c(60,280))
#' par(oldpar)
#' @export
plotwci = function(tab, metric="incidence per 100000 2014-2018", site="Overall",
    xlab="Massachusetts counties", ylim=c(350,620)) {
  ncounty = nrow(tab)
  xseq = seq_len(ncounty)
  cnames=with(tab, sapply(strsplit(County, " "), "[", 1))
  ocounty = order(cnames)
  tab = tab[ocounty,]
  main = paste(site, metric)
  with(tab, plot(xseq, Age.Adjusted.Rate, ylim=ylim, axes=FALSE, xlab=xlab, pch=19,
       main=main, cex.axis=1.5, cex.main=1.5, xlim=c(-1,ncounty+1)))
  with(tab, segments(xseq, lci, xseq, uci, lwd=2))
  with(tab, text(xseq, uci+5, labels=cnames[ocounty]))
  axis(2)
}

