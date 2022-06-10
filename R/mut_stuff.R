#' check all columns for presence of symbol in a SE with ragged mutation matrix as assay
#' @param sym character(1) HUGO symbol
#' @param se a SummarizedExperiment instance with ragged mutation matrix as assay
#' @return a vector of logicals, one for each column; uses `%in%`
#' @examples
#' data(brcamutSE)
#' table(has_mut_in("TTN", brcamutSE))
#' @export
has_mut_in = function (sym, se) 
  apply(SummarizedExperiment::assay(se), 2, function(x) sym %in% x)

#' two-sample survival comparison dependent on mutation present in gene
#' @param sym character(1) HUGO symbol
#' @param se a SummarizedExperiment instance with ragged mutation matrix as assay
#' @param timevar character(1) variable found in colData(se) recording time to event
#' @param eventvar character(1) variable found in colData(se) recording death or censoring
#' @importFrom SummarizedExperiment colData assay
#' @examples
#' data(brcamutSE)
#' ss = two_sample_surv_setup("TTN", brcamutSE)
#' summary(ss)
#' plot(ss, lty=1:2, lwd=2)
#' legend(500,.4,  lty=1:2, lwd=2, legend=c("TTN WT", "TTN Mut"))
#' @export
two_sample_surv_setup = function(sym, se, timevar="OS.Time", eventvar ="OS.event") {
  ss = Surv(colData(se)[[timevar]], colData(se)[[eventvar]])
  grp = has_mut_in(sym, se)
  ans = list(surv=ss, grp=grp, sym=sym)
  class(ans) = "two_sample_mut_surv"
  ans
}

#' print method
#' @export
print.two_sample_mut_surv = function(x, ...)
 cat("two_sample_mut_surv instance.\n  use summary(), plot(), ...\n")

#' summary method
#' @export
summary.two_sample_mut_surv = function(object, ...) {
 sobj = object$surv
 grp = object$grp
 f = as.formula(paste("sobj", "~", "grp"))
 survival::survdiff(f)
}
  
#' plot method
#' @export
plot.two_sample_mut_surv = function(x, y, ...) {
 sobj = x$surv
 grp = x$grp
 f = as.formula(paste("sobj", "~", "grp"))
 survival:::plot.survfit(survfit(f), ...)
}
