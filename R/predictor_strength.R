#' Compute predictor strength
#'
#' Fits one Gaussian mixed-effects model for each fixed-effect term, omitting
#' that term in turn, and reports marginal and conditional R-squared values.
#'
#' @param dependent Name of the dependent variable.
#' @param fixed Character vector of fixed-effect terms.
#' @param random_str Character vector defining the random-effect structure.
#' @param data Data frame used to fit the models.
#'
#' @return A data frame with the omitted predictor and the model's marginal and
#'   conditional R-squared values.
#' @examples
#' \dontrun{
#' data("data_s")
#' predictor_strength(
#'   dependent = "sDur",
#'   fixed = c("pauseBin", "list", "folType", "baseDur"),
#'   random_str = c("(1 | speaker)", "(1 | item)"),
#'   data = data_s
#' )
#' }
#' @export
predictor_strength <- function(dependent, fixed, random_str, data) {
  .require_optional("lme4", "predictor_strength")
  if (!is.data.frame(data)) stop("`data` must be a data frame.", call. = FALSE)
  if (length(dependent) != 1L || !is.character(dependent)) {
    stop("`dependent` must be one column name.", call. = FALSE)
  }
  if (!is.character(fixed) || !length(fixed) || anyNA(fixed)) {
    stop("`fixed` must contain at least one fixed-effect term.", call. = FALSE)
  }
  if (!is.character(random_str) || !length(random_str) || anyNA(random_str)) {
    stop("`random_str` must contain at least one random-effect term.",
         call. = FALSE)
  }

  results <- lapply(seq_along(fixed), function(index) {
    retained <- fixed[-index]
    fixed_part <- if (length(retained)) paste(retained, collapse = " + ") else "1"
    formula <- stats::as.formula(sprintf(
      "%s ~ %s + %s",
      dependent, fixed_part, paste(random_str, collapse = " + ")
    ))
    model <- lme4::lmer(formula, data = data, REML = FALSE)
    data.frame(
      predictor = fixed[[index]],
      mixed_model_r2(model),
      stringsAsFactors = FALSE
    )
  })
  do.call(rbind, results)
}
