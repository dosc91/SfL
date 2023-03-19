#' Compute p-values for Multinomial Regression
#'
#' @description Computes p-values for an multinomial regression model fitted with nnet::multinom.
#'
#'
#' @param mdl The fitted multinomial regression model.
#'
#' @return Usually used without variable assignment.
#'
#' @author D. Schmitz
#'
#' @references Venables, W. N. & Ripley, B. D. (2002) Modern Applied Statistics with S. Fourth Edition. Springer, New York.
#'
#' @examples
#' data("data_g")
#'
#' multinom_model <- multinom(type ~ stereotypicality + cor_target + density + l2norm, data = data_gender)
#'
#' multinomial_p(mdl = multinom_model)
#'
#' @export

multinomial_p <- function(mdl){

  output <- summary(multinom_model)

  z <- output$coefficients/output$standard.errors

  p <- (1 - pnorm(abs(z), 0, 1))*2 # we are using two-tailed z test

  Pclass2 <- rbind(output$coefficients[1,],output$standard.errors[1,],z[1,],p[1,])

  rownames(Pclass2) <- c("Coefficient","Std. Errors","z stat","p value")

  ret <- t(Pclass2)

  return(ret)

}
