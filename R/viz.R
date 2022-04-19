
#' make an interactive histogram for a given cancer site, based on a rate table 
#' @param site character(1) element of column 'Cancer Sites' that must be present in `rate_table`
#' @param binwidth numeric(1) passed to `ggplot2::geom_histogram`
#' @param rate_table data.frame like `woncan` in YESCDS or BiocYES
#' @examples
#' data(woncan)
#' make_hist(rate_table=woncan)
#' @export
make_hist = function(site="Prostate", binwidth=5, rate_table) {
 stopifnot( all(c("Cancer Sites", "Age.Adjusted.Rate", "MSA") %in% names(rate_table)) )
 tt = rate_table |> filter(`Cancer Sites` == site)
 suppressMessages({
  suppressWarnings({
   gg = ggplot(tt, aes(x=Age.Adjusted.Rate, text=MSA)) + geom_histogram(binwidth=binwidth) + ggtitle(paste("CDC WONDER incidence for ", site, sep=""))
   ggplotly(gg)
  })
 })
}

make_boxplot1 = function(site="Prostate", MSA.in="Baton Rouge, LA", rate_table) {
 stopifnot( all(c("Cancer Sites", "Age.Adjusted.Rate", "MSA") %in% names(rate_table)) )
 tt = rate_table |> filter(MSA == MSA.in) 
 suppressMessages({
  suppressWarnings({
   gg = ggplot(tt, aes(y=Age.Adjusted.Rate, text=`Cancer Sites`)) + geom_boxplot() + ggtitle(paste("CDC WONDER incidence for ", site, sep="")) + scale_y_log10()
  })
 })
 gg
}

#' make interactive beeswarm or box plots for all cancer incidence rates in two areas
#' @param MSA1 character(1) element of column 'MSA' that must be present in `rate_table`
#' @param MSA2 character(1) element of column 'MSA' that must be present in `rate_table`
#' @param type character(1) either "boxplot" or "beeswarm"
#' @param rate_table data.frame like `woncan` in YESCDS or BiocYES
#' @examples
#' data(woncan)
#' make_hist(rate_table=woncan)
#' @export
make_pair = function(MSA1="Baton Rouge, LA", MSA2="Tucson, AZ", type="boxplot", rate_table) {
 stopifnot( all(c("Cancer Sites", "Age.Adjusted.Rate", "MSA") %in% names(rate_table)) )
 tt = rate_table |> filter(MSA %in% c(MSA1, MSA2)) |> filter(`Cancer Sites` != "All Invasive Cancer Sites Combined")
 tt = tt |> filter(Age.Adjusted.Rate > 0)
 suppressMessages({
  suppressWarnings({
  if (type == "boxplot")
   gg = ggplot(tt, aes(y=Age.Adjusted.Rate, text=`Cancer Sites`, group=MSA)) + geom_boxplot(aes(x=MSA, group=MSA)) + ggtitle(paste("CDC WONDER incidence distribution for ", paste(MSA1, MSA2, sep=", "), sep="")) + scale_y_log10() 
   else if (type == "beeswarm") gg = ggplot(tt, aes(y=Age.Adjusted.Rate, text=`Cancer Sites`)) + geom_quasirandom(aes(x=MSA)) + ggtitle(paste("CDC WONDER incidence distribution for ", paste(MSA1, MSA2, sep=", "), sep="")) + scale_y_log10() 
   gg
  })
 })
}

#' make an interactive histogram of rate ratios, or a scatterplot for rate comparisons, between two areas
#' @param MSA1 character(1) element of column 'MSA' that must be present in `rate_table`
#' @param MSA2 character(1) element of column 'MSA' that must be present in `rate_table`
#' @param logscale logical(1) only for type "scatter"; if TRUE (default) log10 transformation is applied to rates
#' @param type character(1) one of "scatter" or "ratios"; if the latter, a histogram of ratios is produced with MSA1 rates in numerator
#' @param min.rate numeric(1) minimum number per 100000 for cancer type to be included
#' @param rate_table data.frame like `woncan` in YESCDS or BiocYES
#' @examples
#' data(woncan)
#' make_comparison(type="scatter", rate_table=woncan)
#' make_comparison(type="ratios", rate_table=woncan)
#' @export
make_comparison = function(MSA1="Baton Rouge, LA", MSA2="Tucson, AZ", logscale=TRUE, type="scatter", min.rate=10, rate_table) {
 stopifnot( all(c("Cancer Sites", "Age.Adjusted.Rate", "MSA") %in% names(rate_table)) )
 tt = rate_table |> filter(MSA %in% c(MSA1, MSA2)) |> 
     filter(`Cancer Sites` != "All Invasive Cancer Sites Combined") |>
     filter(Age.Adjusted.Rate > min.rate)
 tt = tt |> filter(Age.Adjusted.Rate > 0)
 tt1 = tt |> filter(MSA==MSA1)
 tt2 = tt |> filter(MSA==MSA2)
 si1 = tt1$`Cancer Sites`
 si2 = tt2$`Cancer Sites`
 oksi = intersect(si1,si2)
 tt1 = tt1 |> filter(`Cancer Sites` %in% oksi)
 tt2 = tt2 |> filter(`Cancer Sites` %in% oksi)
 rate.x = tt1$Age.Adjusted.Rate
 names(rate.x) = tt1$`Cancer Sites`
 rate.y = tt2$Age.Adjusted.Rate
 names(rate.y) = tt2$`Cancer Sites`
 rate.y = rate.y[names(rate.x)] # coordinate the two vectors
 newdf = data.frame(MSA1=MSA1, MSA2=MSA2, rate.x=rate.x, rate.y=rate.y, `Cancer Sites`=names(rate.x), check.names=FALSE)
 suppressMessages({
  suppressWarnings({
   if (type == "scatter") {
    gg = ggplot(newdf, aes(y=rate.y, x=rate.x, text=`Cancer Sites`)) + geom_point() + 
          ggtitle(paste("CDC WONDER incidence (all body sites): ", paste(MSA1, MSA2, sep=", "), sep="")) + 
          geom_abline(slope=1, intercept=0)
    if (logscale) gg = gg + scale_y_log10() + scale_x_log10() + xlab(MSA1) + ylab(MSA2)
    }
   else if (type == "ratios") {
    newdf$ratio = newdf$rate.x / newdf$rate.y
    gg = ggplot(newdf, aes(x=ratio, text=`Cancer Sites`)) + geom_histogram() +
          labs(title=paste("CDC incidence ratios: ", paste(MSA1, MSA2, sep="/"))) +
          geom_vline(xintercept=1) 
    }
   else stop("type must be one of 'scatter', 'ratios'")
   ggplotly(gg) 
  })
 })
}
