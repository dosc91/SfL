#' Mode (Statistical)
#'
#' @description Compute the mode of a numerical or ordinal variable.
#'
#' @param x A numeric vector containing the values whose mode is to be computed.
#'
#'
#' @author D. Schmitz
#'
#' @examples
#' data("data_s")
#'
#' mode_stat(x = data_s$age)
#'
#' @export

mode_stat <- function(x) {

  uniqv <- unique(x)

  uniqv[which.max(tabulate(match(x, uniqv)))]

}
