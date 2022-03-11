#' Create Correlation Matrix
#'
#' @description This is a wrapper for \code{languageR::pairscor.fnc}. A matrix of scatter plots is produced with
#' Pearson and Spearman correlations in the lower triangle. Fall back to the original function to specify additional arguments.
#'
#'
#' @param data The data set containing the variables to be plotted.
#' @param variables The variables used in the plot. Note: Variables cannot be of type 'character'.
#' @param hist A logical indicating whether panels on the diagonal should contain a histogram.
#' @param smooth A logical indicating whether panels in the upper triangle should have a smoother added.
#' @param size A number indicating the size of the points in the panels in the upper triangle, available only when smoothers are added.
#' @param color A number or string indicating the color of the points in the panels in the upper triangle, available only when smoothers are added.
#'
#' @return Nothing. Creates a plot.
#'
#' @author D. Schmitz
#'
#' @references Baayen, R. H, & Shafaei-Bajestan, E. (2019). languageR: Analyzing Linguistic Data: A Practical Introduction to Statistics. R package version 1.5.0. https://CRAN.R-project.org/package=languageR
#'
#' @examples
#' data("data_s")
#'
#' correlation_matrix(data_s, variables = c("typeOfS", "sDur"))
#'
#' @export

correlation_matrix <- function(data, variables, hist = TRUE, smooth = TRUE, size = 1, color = "darkgrey") {

  languageR::pairscor.fnc(data[,variables], hist = hist, smooth = smooth, cex.points = size, col.points = color)

}
