# n <- 1000
# age <- 50 + 12*rnorm(n)
# # insert HERE the function of differential baseline hazard h0, it can be a spline
# h0<-abs(sin(seq(from = 1/250*pi, to = 4*pi, by = 1/250*pi)))
# sex <- factor(sample(c('Male','Female'), n, rep=TRUE, prob=c(.6, .4)))
# # calculate the censoring time
# cens <- 15*runif(n)
# # calculate the total hazard h
# h <- h0*exp(.04*(age-50)+.8*(sex=='Female'))
# # calculate death time 
# dt <- -log(runif(n))/h
# e <- ifelse(dt <= cens,1,0)
# dt <- pmin(dt, cens)
# S <- Surv(dt,e)
# f<-coxph(S ~ age + sex)
# #plot(survfit(f), mark.time=F)
# BH<-basehaz(f)
# plot(BH$time, BH$hazard, col="grey", pch=".")
# for (m in 1:100) {
#   age <- 50 + 12*rnorm(n)
#   sex <- factor(sample(c('Male','Female'), n, rep=TRUE, prob=c(.6, .4)))
#   cens <- 15*runif(n)
#   h <- h0*exp(.04*(age-50)+.8*(sex=='Female'))
#   dt <- -log(runif(n))/h
#   e <- ifelse(dt <= cens,1,0)
#   dt <- pmin(dt, cens)
#   S <- Surv(dt,e)
#   f<-coxph(S ~ age + sex)
#   #plot(survfit(f), mark.time=F)
#   BH<-basehaz(f)
#   points(BH$time, BH$hazard, col="grey", pch=".")
# }
# 
# #abline(v=5, h=h0*5)
# 
# AF<-approxfun(x = BHR$time, y = BHR$diff)