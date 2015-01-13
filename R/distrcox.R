#' Function for simulating a Cox distirbution series
#' @description Function for simulating a Cox distribution series
#' @details Cox distribution series are based on the assumption of \emph{proportional hazards} of covariate
#' over a given underneath \emph{baseline hazards} function. The hypotesis of proportionality is essential 
#' for achieving good performance by models achieved by this kind of fitting. When the verification of 
#' proportionality is needed the function \code{\link[survival]{cox.zph}} should be used to perform the
#' verification.
#' @param n Number of cases to be simulated
#' @param coeff Coefficients achieved by a \code{\link[survival]{coxph}} object
#' @return A list containing a matrix with cases in lines ordered by coefficients as got by coeff param and corresponding coxph model
#' @export
coxSimulate<-function(n = 1000, coeff) {
  
}


#' Function for calculating Weibull based hazard rate H0
#' @description Weibull function describing the hazard rate as function of the time
#' @details Given a Cox fit object returned by a \code{\link[survival]{coxph}} function this function calulates the parameters to achieve the value of baseline hazard rate
#' as function of the time. The result returned by function is \deqn{\frac{1}{H_0 \left ( t \right )}=\left ( \lambda^{-1}t \right )^{\frac{1}{\nu}}}
#' @param t time
#' @param lambda \eqn{\lambda} parameter of Weibull function
#' @param ni \eqn{\nu} parameter of Weibull equation
#' @return The inverse of hazard rate function \eqn{H_{0}^{-1}\left ( t \right )}.
#' @export
HR.weibull<-function (t, lambda, ni) {
  invH0t<-(1/lambda*t)^(1/ni)
  return(invH0t)
}