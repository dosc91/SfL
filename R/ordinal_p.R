#' Compute p-values for ordinal regression
#'
#' Adds two-sided Wald p-values to the coefficient table of a model fitted with
#' [MASS::polr()].
#'
#' @param mdl A fitted `polr` model.
#' @return A coefficient matrix with an additional `p value` column.
#' @examples
#' \dontrun{
#' model <- MASS::polr(Sat ~ Infl + Type + Cont, MASS::housing, Hess = TRUE)
#' ordinal_p(model)
#' }
#' @export
ordinal_p <- function(mdl) {
  if (!inherits(mdl, "polr")) {
    stop("`mdl` must be a model fitted with MASS::polr().", call. = FALSE)
  }
  coefficient_table <- stats::coef(summary(mdl))
  p_value <- 2 * stats::pnorm(abs(coefficient_table[, "t value"]),
                              lower.tail = FALSE)
  cbind(coefficient_table, "p value" = p_value)
}
