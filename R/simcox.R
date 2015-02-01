total <- 20
library(doMC)
registerDoMC(cores=8)
library(foreach)
h0<-.055

simulationTest <- function() {

  n <- sample(x = c(200:2000), size = 1)
  
  age <- 50 + 12*rnorm(n)
  #sex <- factor(sample(c('Male','Female','Trans'), n, rep=TRUE, prob=c(.6, .3, .1)))
  #bf <- factor(sample(c('a','b','c'), n, rep=TRUE, prob=c(.3, .3, .3)))
  cens <- 15*runif(n)
  
#  h <- h0*exp(.02*age-0.12*(sex=='Female')+.05*(sex=='Trans')+0.08*(bf=='b')-.04*(bf=='c'))      # hazard
  #h <- h0*exp(.02*age-0.12*(sex=='Female')+.18*(sex=='Trans'))      # hazard
  h <- h0*exp(.025*age)                          # hazard
  dt <- -log(runif(n))/h                        # calculated survival time
  e <- ifelse(dt <= cens,1,0)                   # if time is lower than censoring time event = 1 else event = 0
  dt <- pmin(dt, cens)                          # the effective observation time is the minimum between dt and cens
  S <- Surv(dt, e)                              # create the Survival function
  
  # f<-coxph(S ~ age + sex + bf)                  # define Cox model
  # f<-coxph(S ~ age + sex)                       # define Cox model
  f<-coxph(S ~ age)                       # define Cox model
  #  f2<-coxph(S ~ age)                         # define Cox model
  #  cf<-f$coefficients                            # value of coefficients
  #  pval<-summary(f)$coefficients[,5]             # value of p-values
  
  # dataset<-data.frame(cbind(age, sex, bf, "time" = dt, "status" = e))     # compute da data.frame
  # dataset<-data.frame(cbind(age, sex, "time" = dt, "status" = e))     # compute da data.frame
  dataset<-data.frame(cbind(age, "time" = dt, "status" = e))     # compute da data.frame
  #dataset$sex<-factor(x = dataset$sex, labels = c("Male", "Female", "Trans"))
  #dataset$bf<-factor(x = dataset$sex, labels = c("a", "b", "c"))
  #  plot(muhaz::muhaz(times = dataset$time, delta = dataset$status, n.min.grid = 100, n.est.grid = 200), lwd=2)
  #  abline(h = h0, col = "red", lty = 2)
  h0.calc<-extracth0(dataset = dataset, model = f, times = dataset$time, events = dataset$status, smoothed = TRUE, spar = .5, grid = 100)
  #  lines(x = h0.calc$time, y = h0.calc$h0, lwd = 2, col = "blue")
  #   spl<-smooth.spline(x = h0.calc$time, y = h0.calc$h0, spar = .75)
  #   lines(spl, col="darkgreen", lwd=2)
  # Mh0 <- mean(h0.calc$h0)
  s<-summary(f)
  return(list(coefficients = s$coefficients, c.index = s$concordance, Mean.h0 = mean(h0.calc$h0)))
}

result<-foreach(i = 1:total) %dopar% simulationTest()
pval<-cbind(sapply(X = result, FUN = function(x) x$coefficients[,5]))
coef<-cbind(sapply(X = result, FUN = function(x) x$coefficients[,1]))

cat("\nMean h0 ratio:    ", mean(sapply(X = result, FUN = function(x) x$Mean.h0, simplify = TRUE))/h0)
cat("\nMean coefficient: ", mean(sapply(X = result, FUN = function(x) x$coefficients[,1], simplify = TRUE)))
cat("\nMean P-value:     ", mean(sapply(X = result, FUN = function(x) x$coefficients[,5], simplify = TRUE)))
library(beepr)
beep()
