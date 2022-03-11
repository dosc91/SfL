#' Tukey Contrasts
#'
#' @description Compute Tukey Contrasts for all levels of a categorical predictor. Takes simple linear regression
#' models and multiple linear regression models, as well as linear mixed effects models as input.
#'
#'
#' @param model The model object, created by \code{lm()} or \code{lmer()}.
#' @param predictor The categorical predictor for which Tukey Contrasts should be computed.
#'
#' @return A list object if assigned to a variable name.
#'
#' @author D. Schmitz
#'
#' @references Hothorn, T., Bretz, F., & Westfall, P. (2008). Simultaneous Inference in General Parametric Models. Biometrical Journal 50(3), 346-363.
#'
#' @examples
#' data("data_s")
#'
#' mdl <- lm(sDur ~ pauseBin, data = data_s)
#'
#' tukey(model = mdl, predictor = pauseBin)
#'
#' @export

tukey <- function(model, predictor){
  linfct = multcomp::mcp(predictor = "Tukey")
  names(linfct) = deparse(substitute(predictor))
  summary(multcomp::glht(model, linfct))
}





