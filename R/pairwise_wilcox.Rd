% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pairwise_wilcox.R
\name{pairwise_wilcox}
\alias{pairwise_wilcox}
\title{Compute Pairwise Wilcoxon Tests}
\usage{
pairwise_wilcox(predictor, data, method = "holm", x = 6)
}
\arguments{
\item{predictor}{The categorical predictor of interest.}

\item{data}{The data set containing the variables including the predictions.}

\item{method}{Any of the typical methods, e.g. \code{holm} (the default) or \code{bonferroni}.}

\item{x}{Numerical value passed on to \code{round} the output's p-values.}
}
\description{
\code{pairwise_wilcox} computes pairwise Wilcoxon tests as a wrapper of \code{stats::pairwise.wilcox.test}.
}
\author{
J. Esser
}
