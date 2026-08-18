#' Standard error
#'
#' Computes the standard error of the mean.
#'
#' @param x A numeric vector.
#' @param na.rm Remove missing values before computing the standard error.
#'
#' @return A numeric scalar.
#' @examples
#' se(c(1, 2, 3, 4))
#' @export
se <- function(x, na.rm = FALSE) {
  if (!is.numeric(x)) stop("`x` must be numeric.", call. = FALSE)
  if (isTRUE(na.rm)) x <- x[!is.na(x)]
  n <- length(x)
  if (n < 2L) return(NA_real_)
  stats::sd(x) / sqrt(n)
}
