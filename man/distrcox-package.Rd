\name{distrcox-package}
\alias{distrcox-package}
\alias{distrcox}
\docType{package}
\title{
Package for simulating Cox proportional hazards distributions
}
\description{
This package allows to simulate Cox proportional hazards
    distributions by creating de-novo case series or by using baseline hazards
    achieved by other Cox models fitted by using coxph function
}
\details{
\tabular{ll}{
Package: \tab distrcox\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-01-12\cr
License: \tab GPL-2\cr
}
Cox proportional hazards model is one of the most used models in describing survival observations over patients in clinical trials.
The Cox model fitting is a procedure that can be applied over a dataset by using functions as coxph in the package survival.
The fit is a procedure that has to be applied on a single dataset, but in real clinical assets the data 
collections can be owned by different institutions, where privacy policies can prevent the exchange of patients data and definitely
hinder the elaboration of larger predictive models based on multi-institutional experiences. The main objective of this package
is to provide the possibility to create Cox models shared by different institutions, by using some techinques for getting model
fitting over separate dataset without sharing the single data features or dataset.
}
\author{
Nicola Dinapoli

Maintainer: Nicola Dinapoli <nicola.dinapoli@rm.unicatt.it>

}
\references{
Cox DR, \emph{Regression Models and Life-Tables}, Journal of the Royal Statistical Society. Series B (Methodological), 1972, Vol. 34-2, 287-220.
}
\keyword{ package, survival, Cox, coxph, cox.zph }
\seealso{
 \code{\link[survival]{coxph}}
}