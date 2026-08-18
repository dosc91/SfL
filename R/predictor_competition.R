#' Compare two sets of predictors
#'
#' `predictor_competition()` is retained for backward compatibility. New code
#' should use [predictor_competition2()].
#'
#' @inheritParams predictor_competition2
#' @return The result of [predictor_competition2()].
#' @examples
#' data("data_s")
#' predictor_competition(data_s, "sDur", "pauseBin", "typeOfS")
#' @export
predictor_competition <- function(data, dependent, independent1, independent2,
                                  random.intercept = NULL, random.slope = 1) {
  warning(
    "`predictor_competition()` is deprecated; use `predictor_competition2()`.",
    call. = FALSE
  )
  predictor_competition2(
    data = data,
    dependent = dependent,
    independent1 = independent1,
    independent2 = independent2,
    random.intercept = random.intercept,
    random.slope = random.slope
  )
}
