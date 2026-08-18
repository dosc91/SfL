#' Compute p-values for multinomial regression
#'
#' Computes two-sided Wald z-tests for a model fitted with [nnet::multinom()].
#'
#' @param mdl A fitted `multinom` model.
#'
#' @return A data frame with response class, term, coefficient, standard error,
#'   z statistic, and p-value.
#' @examples
#' \dontrun{
#' model <- nnet::multinom(Species ~ Sepal.Length + Sepal.Width, iris)
#' multinomial_p(model)
#' }
#' @export
multinomial_p <- function(mdl) {
  if (!inherits(mdl, "multinom")) {
    stop("`mdl` must be a model fitted with nnet::multinom().", call. = FALSE)
  }
  output <- summary(mdl)
  coefficients <- output$coefficients
  standard_errors <- output$standard.errors
  if (is.null(dim(coefficients))) {
    coefficients <- matrix(coefficients, nrow = 1L,
                           dimnames = list(mdl$lev[[2L]], names(coefficients)))
    standard_errors <- matrix(standard_errors, nrow = 1L,
                              dimnames = dimnames(coefficients))
  }
  z_value <- coefficients / standard_errors
  p_value <- 2 * stats::pnorm(abs(z_value), lower.tail = FALSE)

  indices <- data.frame(
    response = rep(rownames(coefficients), each = ncol(coefficients)),
    term = rep(colnames(coefficients), times = nrow(coefficients)),
    stringsAsFactors = FALSE
  )
  indices$coefficient <- as.vector(t(coefficients))
  indices$std.error <- as.vector(t(standard_errors))
  indices$z.value <- as.vector(t(z_value))
  indices$p.value <- as.vector(t(p_value))
  indices
}
