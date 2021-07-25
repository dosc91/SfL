#' Tukey Contrasts
#'
#' @description Compute Tukey Contrasts for all levels of a categorical predictor. Takes simple linear regression
#' models and multiple linear regression models (\code{lm()}), as well as linear mixed effects models (\code{lmer()}) as input.
#'
#' @usage \code{tukey(model = , predictor = )}
#'
#' @param model The model object, created by \code{lm()} or \code{lmer()}.
#' @param predictor The categorical predictor for which Tukey Contrasts should be computed.
#'
#' @return A list object if assigned to a variable name.
#'
#' @author D. Schmitz
#'
#' @export

tukey <- function(model, predictor){
  linfct = multcomp::mcp(predictor = "Tukey")
  names(linfct) = deparse(substitute(predictor))
  summary(multcomp::glht(model, linfct))
}





