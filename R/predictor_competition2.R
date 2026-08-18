.comparison_formula <- function(dependent, independent, random.intercept, random.slope) {
  fixed_formula <- stats::reformulate(independent, response = dependent)
  if (is.null(random.intercept)) return(fixed_formula)
  random_term <- sprintf("(%s | %s)", random.slope, random.intercept)
  fixed_text <- paste(deparse(fixed_formula), collapse = "")
  stats::as.formula(paste(fixed_text, "+", random_term))
}

#' Compare two sets of predictors using AIC
#'
#' Fits two linear or linear mixed-effects models that differ in their fixed
#' effects. A difference of at least two AIC points is reported as evidence for
#' the lower-AIC model.
#'
#' @param data Data frame used for both models.
#' @param dependent Name of the dependent variable.
#' @param independent1,independent2 Character vectors naming the fixed-effect
#'   terms in the two models.
#' @param random.intercept Optional random-intercept grouping variable.
#' @param random.slope Random-slope expression; defaults to `1`, which specifies
#'   a random-intercept-only model.
#'
#' @return The two-row data frame returned by [stats::AIC()].
#' @examples
#' data("data_s")
#' predictor_competition2(data_s, "sDur", "pauseBin", "typeOfS")
#' @export
predictor_competition2 <- function(data, dependent, independent1, independent2,
                                   random.intercept = NULL, random.slope = 1) {
  if (!is.data.frame(data)) stop("`data` must be a data frame.", call. = FALSE)
  if (length(dependent) != 1L || !is.character(dependent)) {
    stop("`dependent` must be one column name.", call. = FALSE)
  }
  if (!is.character(independent1) || !length(independent1) ||
      !is.character(independent2) || !length(independent2)) {
    stop("Each independent-variable specification must be a character vector.",
         call. = FALSE)
  }

  formula1 <- .comparison_formula(dependent, independent1, random.intercept, random.slope)
  formula2 <- .comparison_formula(dependent, independent2, random.intercept, random.slope)
  if (is.null(random.intercept)) {
    model1 <- stats::lm(formula1, data = data)
    model2 <- stats::lm(formula2, data = data)
  } else {
    .require_optional("lme4", "predictor_competition2")
    model1 <- lme4::lmer(formula1, data = data, REML = FALSE)
    model2 <- lme4::lmer(formula2, data = data, REML = FALSE)
  }

  comparison <- stats::AIC(model1, model2)
  difference <- comparison$AIC[[1L]] - comparison$AIC[[2L]]
  if (abs(difference) < 2) {
    message(sprintf(
      "The two predictor sets have similar support for predicting %s (delta AIC < 2).",
      dependent
    ))
  } else {
    winner <- if (difference > 0) independent2 else independent1
    message("Lower-AIC predictor set: ", paste(winner, collapse = " + "), ".")
  }
  comparison
}
