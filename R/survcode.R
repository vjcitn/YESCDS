#' utility for survival curve illustration
#' @import survival
#' @export
build_simple_survival_curve = function() {
set.seed(1234)
x = rexp(200, .3/12)
#library(survival)
sx = survival::Surv(x, rep(1,200))
plot(survival::survfit(sx~1), lwd=2, ylab="survival::Survival probability", xlab="Months from diagnosis",
   axes=FALSE, xlim=c(0,168), conf.int=FALSE)
axis(2)
axis(1, at = seq(0,max(x),12L))
}

#' utility for survival curve illustration: median estimate sketch
#' @export
show_median_estimate = function() {
set.seed(1234)
x = rexp(200, .3/12)
sx = survival::Surv(x, rep(1,200))
meddat = median(sx)
plot(survival::survfit(sx~1), lwd=2, ylab="survival::Survival probability", xlab="Months from diagnosis",
   axes=FALSE, xlim=c(0,168), conf.int=FALSE)
axis(2)
axis(1, at = seq(0,max(x),12L))
abline(h=.5, lwd=2, lty=3)
arrows(meddat$quantile, .5, meddat$quantile, 0, lwd=2, col="blue")
}

#' utility for survival curve illustration: 5y survprob estimate sketch
#' @export
show_5y_estimate = function() {
set.seed(1234)
x = rexp(200, .3/12)
sx = survival::Surv(x, rep(1,200))
plot(survival::survfit(sx~1), lwd=2, ylab="survival::Survival probability", xlab="Months from diagnosis",
   axes=FALSE, xlim=c(0,168), conf.int=FALSE)
axis(2)
axis(1, at = seq(0,max(x),12L))
arrows(60, .22, 0, .22, lwd=2, col="purple")
arrows(60, .0, 60, .22, lwd=2, col="purple")
}

#' utility for survival curve, alternate shape
#' @export
do_new_surv = function() {
set.seed(1234)
z = rgamma(200, 10, .15)
gg = survival::Surv(z, rep(1,200))
plot(survival::survfit(gg~1), conf.int=FALSE, axes=FALSE)
axis(2)
axis(1, at = seq(0,max(z),12L))
}
