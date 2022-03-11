#' Standard Error
#'
#' @description Compute the standard error of a numerical or ordinal variable.
#'
#' @param x A numeric vector containing the values whose stadard error is to be computed.
#'
#'
#' @author D. Schmitz
#'
#' @examples
#' data("data_s")
#'
#' se(data = data_s$age)
#'
#' @export

se <- function(x){

  sd(x) / sqrt(length(x))

  }
