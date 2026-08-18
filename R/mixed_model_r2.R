#' Marginal and conditional R-squared for a linear mixed model
#'
#' Calculates marginal and conditional R-squared values for Gaussian linear
#' mixed-effects models fitted with `lme4::lmer()`. Marginal R-squared describes
#' variance explained by fixed effects; conditional R-squared describes
#' variance explained by fixed and random effects. For random-slope models, the
#' random-effect contribution is the mean observation-level random variance.
#'
#' @param model A Gaussian `lmerMod` model fitted with `lme4::lmer()`.
#'
#' @return A one-row data frame with columns `R2m` and `R2c`.
#' @references
#' Nakagawa, S. & Schielzeth, H. (2013). A general and simple method for
#' obtaining R-squared from generalized linear mixed-effects models. *Methods
#' in Ecology and Evolution*, 4, 133-142.
#'
#' Johnson, P. C. D. (2014). Extension of Nakagawa & Schielzeth's R-squared
#' GLMM to random slopes models. *Methods in Ecology and Evolution*, 5,
#' 944-946.
#'
#' Nakagawa, S., Johnson, P. C. D., & Schielzeth, H. (2017). The coefficient
#' of determination R-squared and intra-class correlation coefficient from
#' generalized linear mixed-effects models revisited and expanded. *Journal
#' of the Royal Society Interface*, 14, 20170213.
#' @examples
#' \dontrun{
#' model <- lme4::lmer(Reaction ~ Days + (Days | Subject), lme4::sleepstudy)
#' mixed_model_r2(model)
#' }
#' @export
mixed_model_r2 <- function(model) {
  .require_optional("lme4", "mixed_model_r2")
  if (!inherits(model, "lmerMod")) {
    stop("`model` must be a Gaussian model fitted with lme4::lmer().",
         call. = FALSE)
  }

  design <- lme4::getME(model, "X")
  coefficients <- lme4::fixef(model)
  fixed_prediction <- as.vector(design %*% coefficients)
  fixed_variance <- stats::var(fixed_prediction)

  random_design <- lme4::getME(model, "Z")
  relative_covariance <- lme4::getME(model, "Lambda")
  residual_sd <- stats::sigma(model)
  scaled_design <- random_design %*% relative_covariance
  random_variance <- mean(rowSums(as.matrix(scaled_design)^2)) * residual_sd^2
  residual_variance <- residual_sd^2

  total_variance <- fixed_variance + random_variance + residual_variance
  if (!is.finite(total_variance) || total_variance <= 0) {
    stop("The fitted model does not have a positive finite total variance.",
         call. = FALSE)
  }

  data.frame(
    R2m = fixed_variance / total_variance,
    R2c = (fixed_variance + random_variance) / total_variance
  )
}
