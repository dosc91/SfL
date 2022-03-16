#' data_r - Response Data
#'
#' This data set contains simulated data on responses given in a fictional same-different task.
#' A possible question to investigate with this data set is whether error rates are different for different durational differences.
#'
#'
#' @format A data frame with 600 rows and 6 variables:
#' \describe{
#'   \item{correct}{\code{1} = correct response; \code{0} = incorrect response}
#'   \item{difference}{durational difference in miliseconds}
#'   \item{wordclass}{word class of the item}
#'   \item{complexity}{complexity of the item; either \code{simplex} or \code{complex}}
#'   \item{wordlength}{word length of the item}
#'   \item{subject}{subject ID}
#' }
#' @source Schmitz, D., & Esser, J. (2022). SfL: Statistics for Linguistics. R package version 0.3. URL: https://github.com/dosc91/SfL
#'
"data_r"
