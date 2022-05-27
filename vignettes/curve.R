set.seed(1234)
x = rexp(200, .3/12)
library(survival)
sx = Surv(x, rep(1,200))
meddat = median(sx)
plot(survfit(sx~1), lwd=2, ylab="Survival probability", xlab="Months from diagnosis",
   axes=FALSE, xlim=c(0,168), conf.int=FALSE)
axis(2)
axis(1, at = seq(0,max(x),12L))
abline(h=.5, lwd=2)
arrows(meddat$quantile, .5, meddat$quantile, 0, lwd=2, col="blue")


plot(survfit(sx~1), lwd=2, ylab="Survival probability", xlab="Months from diagnosis",
   axes=FALSE, xlim=c(0,168), conf.int=FALSE)
axis(2)
axis(1, at = seq(0,max(x),12L))
arrows(60, .22, 0, .22, lwd=2, col="purple")
arrows(60, .0, 60, .22, lwd=2, col="purple")
