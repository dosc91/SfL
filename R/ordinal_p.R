#' Compute p-values for Ordinal Regression
#'
#' @description Computes p-values for an ordinal regression model fitted with MASS::polr.
#'
#'
#' @param mdl The fitted ordinal regression model.
#'
#' @return Usually used without variable assignment.
#'
#' @author D. Schmitz
#'
#' @references Venables, W. N. & Ripley, B. D. (2002) Modern Applied Statistics with S. Fourth Edition. Springer, New York.
#'
#' @examples
#' data("data_o")
#'
#' ord_mdl <- polr(size ~ vowel + C1 + C2 + age, data = data_o, Hess=TRUE)
#'
#' ordinal_p(mdl = ord_mdl)
#'
#' @export

ordinal_p <- function(mdl){

  ctable <- coef(summary(mdl))

  p <- pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2

  ctable <- cbind(ctable, "p value" = p)

  return(ctable)
}
