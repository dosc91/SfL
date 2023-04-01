#' Compare Variables for Predictor Strength 2
#'
#' @description Compare the predictive strength of two independent variables in a minimal linear (mixed effects) regression model. The function creates two identical
#' \code{lm} or \code{lmer} objects, only differing in fixed effects structure. Then, using the Akaike Information Criterion, the better predictor is determined. A model
#' is assumed to have a better fit, if its AIC is 2 points lower than the other's.
#'
#'
#' @param data The original data set for both models.
#' @param dependent The dependent variable for both models.
#' @param independent1 The independent variable(s), i.e. the fixed effects, of the 1st model.
#' @param independent2 The independent variable(s), i.e. the fixed effects, of the 2nd model.
#' @param random.intercept The random intercept for both models. If not random intercept is specified, regular linear models are fitted.
#' @param random.slope The random slope for both models. The default assumes no random slope.
#'
#' @return A dataframe containing df and AIC. Usually used without variable assignment.
#'
#' @author D. Schmitz & J. Esser
#'
#' @references Bates, D., Maechler, M., Bolker, B., & Walker, S. (2015). Fitting Linear Mixed-Effects Models Using lme4. Journal of Statistical Software, 67(1), 1-48. doi:10.18637/jss.v067.i01.
#'
#' @examples
#' data("data_s")
#'
#' predictor_competition2(data = data_s, dependent = "sDur", independent1 = "pauseBin", independent2 = "typeOfS")
#'
#' @export

predictor_competition2 <- function(data, dependent, independent1, independent2, random.intercept = NULL, random.slope = 1){

  if (is.null(random.intercept)) {
    formula1 <- as.formula(paste(dependent, paste("~"),
                                 paste(independent1, collapse = "+")))
    formula2 <- as.formula(paste(dependent, paste("~"),
                                 paste(independent2, collapse = "+")))

    mdl1 <- lm(formula1, data)
    mdl2 <- lm(formula2, data)

    AIC <- AIC(mdl1, mdl2)

    if(abs(AIC[1,2]-AIC[2,2]) >= 2){
      if(AIC[1,2] > AIC[2,2]){
        cli::cli_alert_info(glue::glue("We have a winner - it's ", independent2, "!", sep = ""))
      }else{
        cli::cli_alert_info(glue::glue("We have a winner - it's ", independent1, "!", sep = ""))
      }
    }else{
      cli::cli_alert_info(glue::glue("Both predictors, {independent1} & {independent2}, are equally good at predicting {dependent}."))
    }
  }else{
    formula1 <- as.formula(paste(dependent, paste("~"),
                                 paste(independent1, collapse = "+"), paste("+ ("),
                                 paste(random.slope), paste("|"), paste(random.intercept),
                                 paste(")")))
    formula2 <- as.formula(paste(dependent, paste("~"),
                                 paste(independent2, collapse = "+"), paste("+ ("),
                                 paste(random.slope), paste("|"), paste(random.intercept),
                                 paste(")")))
    mdl1 <- lme4::lmer(formula1, data, REML = FALSE)
    mdl2 <- lme4::lmer(formula2, data, REML = FALSE)

    AIC <- AIC(mdl1, mdl2)

    if(abs(AIC[1,2]-AIC[2,2]) >= 2){
      if(AIC[1,2] > AIC[2,2]){
        cli::cli_alert_info(glue::glue("We have a winner - it's ", independent2, "!", sep = ""))
      }else{
        cli::cli_alert_info(glue::glue("We have a winner - it's ", independent1, "!", sep = ""))
      }
    }else{
      cli::cli_alert_info(glue::glue("Both predictors, {independent1} & {independent2}, are equally good at predicting {dependent}."))
    }
  }
  return(AIC)
}
