#' Create Correlation Matrix
#'
#' @description This is a wrapper for \code{languageR::pairscor.fnc}. A matrix of scatter plots is produced with
#' Pearson and Spearman correlations in the lower triangle. Fall back to the original function to specify additional arguments.
#'
#' @usage \code{correlation_matrix(data = , variables = c(""))}
#'
#' @param data The data set containing the variables to be plotted.
#' @param variables The variables used in the plot. Note: Variables cannot be of type 'character'.
#'
#' @return Nothing. Creates a plot.
#'
#' @author D. Schmitz
#'
#' @references R. Harald Baayen and Elnaz Shafaei-Bajestan (2019). languageR: Analyzing Linguistic Data: A Practical Introduction to Statistics.
#' R package version 1.5.0. https://CRAN.R-project.org/package=languageR
#'
#' @examples
#' data("data_s")
#'
#' correlation_matrix(data_s, variables = c("typeOfS", "sDur"))
#'
#' @export

correlation_matrix <- function(data, variables) {
  languageR::pairscor.fnc(data[,variables])
}
