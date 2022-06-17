
set.seed(1234)

shuffle = function(x) sample(x, size=length(x), replace=FALSE)

trt = rep(c("A", "B"), 10)
trt

shuffle(trt)
