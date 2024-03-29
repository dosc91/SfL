% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multinomial_p.R
\name{multinomial_p}
\alias{multinomial_p}
\title{Compute p-values for Multinomial Regression}
\usage{
multinomial_p(mdl)
}
\arguments{
\item{mdl}{The fitted multinomial regression model.}
}
\value{
Usually used without variable assignment.
}
\description{
Computes p-values for an multinomial regression model fitted with nnet::multinom.
}
\examples{
data("data_g")

multinom_model <- multinom(type ~ stereotypicality + cor_target + density + l2norm, data = data_gender)

multinomial_p(mdl = multinom_model)

}
\references{
Venables, W. N. & Ripley, B. D. (2002) Modern Applied Statistics with S. Fourth Edition. Springer, New York.
}
\author{
D. Schmitz
}
