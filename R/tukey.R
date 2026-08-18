#' Tukey contrasts
#'
#' Computes simultaneous Tukey contrasts for a categorical predictor in a
#' linear or linear mixed-effects model.
#'
#' @param model A fitted model supported by `multcomp::glht()`.
#' @param predictor A categorical predictor, supplied either as an unquoted
#'   name or a single character string.
#'
#' @return The summary of a `multcomp::glht` object.
#' @examples
#' \dontrun{
#' model <- stats::lm(mpg ~ factor(cyl), mtcars)
#' tukey(model, "factor(cyl)")
#' }
#' @export
tukey <- function(model, predictor) {
  .require_optional("multcomp", "tukey")
  predictor_name <- if (is.character(predictor)) {
    if (length(predictor) != 1L) {
      stop("`predictor` must contain one name.", call. = FALSE)
    }
    predictor
  } else {
    deparse(substitute(predictor))
  }
  linear_function <- do.call(
    multcomp::mcp,
    stats::setNames(list("Tukey"), predictor_name)
  )
  summary(multcomp::glht(model, linear_function))
}
