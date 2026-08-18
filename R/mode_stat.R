#' Statistical mode
#'
#' Returns the first value with the greatest observed frequency.
#'
#' @param x A vector.
#' @param na.rm Remove missing values before computing the mode.
#'
#' @return A length-one vector of the same basic type as `x`.
#' @examples
#' mode_stat(c(1, 1, 2, 3))
#' @export
mode_stat <- function(x, na.rm = FALSE) {
  if (!length(x)) stop("`x` must not be empty.", call. = FALSE)
  if (isTRUE(na.rm)) x <- x[!is.na(x)]
  if (!length(x)) return(NA)
  values <- unique(x)
  values[which.max(tabulate(match(x, values)))]
}
