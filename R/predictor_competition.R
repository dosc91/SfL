#' Compare Variables for Predictor Strength
#'
#' @description Compare the predictive strength of two independent variables in a minimal linear (mixed effects) regression model. The function creates two identical
#' \code{lm} or \code{lmer} objects, only differing in fixed effects structure. Then, a log-likelihood test is used to decide which fixed effect structure is better fit to
#' predict the dependent variable.
#'
#'
#' @param data The original data set for both models.
#' @param dependent The dependent variable for both models.
#' @param independent1 The independent variable(s), i.e. the fixed effects, of the 1st model.
#' @param independent2 The independent variable(s), i.e. the fixed effects, of the 2nd model.
#' @param random.intercept The random intercept for both models. If not random intercept is specified, regular linear models are fitted.
#' @param random.slope The random slope for both models. The default assumes no random slope.
#'
#' @return A dataframe containing npar, AIC, BIG, logLik, deviance, Chisq, Df, and Pr(>Chisq). Usually used without variable assignment.
#'
#' @author D. Schmitz
#'
#' @references Bates, D., Maechler, M., Bolker, B., & Walker, S. (2015). Fitting Linear Mixed-Effects Models Using lme4. Journal of Statistical Software, 67(1), 1-48. doi:10.18637/jss.v067.i01.
#'
#' @examples
#' data("data_s")
#'
#' # example 1: two similarly well fit predictors
#' predictor_competition(data = data_s, dependent = "sDur", independent1 = "typeOfS", independent2 = "pauseBin", random.intercept = "speaker")
#'
#' # example 2: one predictor is better than the other
#' predictor_competition(data = data_s, dependent = "sDur", independent1 = "typeOfS", independent2 = "slideNumber", random.intercept = "speaker")
#'
#' @export

predictor_competition <- function(data, dependent, independent1, independent2, random.intercept = NULL, random.slope = 1) {

  if(is.null(random.intercept)){

    formula1 <- as.formula(paste(dependent,
                                 paste("~"),
                                 paste(independent1, collapse= "+")))

    formula2 <- as.formula(paste(dependent,
                                 paste("~"),
                                 paste(independent2, collapse= "+")))

    mdl1 <- lm(formula1, data)
    mdl2 <- lm(formula2, data)

    an <- anova(mdl1, mdl2)

    if(is.na(an[2, 6])){
      cli::cli_alert_info(
        glue::glue("Both predictors, {independent1} & {independent2}, are equally good at predicting {dependent}.")
      )
    }
    else if(an[2, 6] >= 0.05){
      cli::cli_alert_info(
        glue::glue("Both predictors, {independent1} & {independent2}, are equally good at predicting {dependent}.")
      )
    } else {
      cli::cli_alert_info(
        glue::glue("We have a winner!")
      )
    }

  }else{

    formula1 <- as.formula(paste(dependent,
                                 paste("~"),
                                 paste(independent1, collapse= "+"),
                                 paste("+ ("),
                                 paste(random.slope),
                                 paste("|"),
                                 paste(random.intercept),
                                 paste(")")))

    formula2 <- as.formula(paste(dependent,
                                 paste("~"),
                                 paste(independent2, collapse= "+"),
                                 paste("+ ("),
                                 paste(random.slope),
                                 paste("|"),
                                 paste(random.intercept),
                                 paste(")")))

    mdl1 <- lme4::lmer(formula1, data, REML = FALSE)
    mdl2 <- lme4::lmer(formula2, data, REML = FALSE)

    an <- anova(mdl1, mdl2)

    if(an[2, 8] >= 0.05){
      cli::cli_alert_info(
        glue::glue("Both predictors, {independent1} & {independent2}, are equally good at predicting {dependent}.")
      )
    } else {
      cli::cli_alert_info(
        glue::glue("We have a winner!")
      )
    }

  }

  return(an)
}
