test_that("mixed_model_r2 supports random intercepts and slopes", {
  skip_if_not_installed("lme4")
  intercept_model <- lme4::lmer(Reaction ~ Days + (1 | Subject), lme4::sleepstudy)
  slope_model <- lme4::lmer(Reaction ~ Days + (Days | Subject), lme4::sleepstudy)

  intercept_r2 <- mixed_model_r2(intercept_model)
  slope_r2 <- mixed_model_r2(slope_model)
  expect_named(intercept_r2, c("R2m", "R2c"))
  expect_equal(unname(unlist(intercept_r2)), c(0.2798856, 0.7042555),
               tolerance = 1e-6)
  expect_true(all(unlist(intercept_r2) >= 0 & unlist(intercept_r2) <= 1))
  expect_gte(intercept_r2$R2c, intercept_r2$R2m)
  expect_true(all(unlist(slope_r2) >= 0 & unlist(slope_r2) <= 1))
  expect_equal(unname(unlist(slope_r2)), c(0.2786511, 0.7992199),
               tolerance = 1e-6)
})

test_that("predictor_strength returns one row per omitted predictor", {
  skip_if_not_installed("lme4")
  result <- predictor_strength(
    "Reaction", c("Days", "I(Days^2)"), "(1 | Subject)", lme4::sleepstudy
  )
  expect_named(result, c("predictor", "R2m", "R2c"))
  expect_equal(result$predictor, c("Days", "I(Days^2)"))
})

test_that("predictor comparison returns AIC for two models", {
  result <- suppressMessages(
    predictor_competition2(mtcars, "mpg", "wt", "hp")
  )
  expect_equal(nrow(result), 2)
  expect_true("AIC" %in% names(result))
})

test_that("multinomial_p uses its model argument", {
  skip_if_not_installed("nnet")
  model <- suppressWarnings(nnet::multinom(Species ~ Sepal.Length, iris, trace = FALSE))
  result <- multinomial_p(model)
  expect_named(result, c("response", "term", "coefficient", "std.error", "z.value", "p.value"))
  expect_true(all(result$p.value >= 0 & result$p.value <= 1))
})

test_that("ordinal_p adds p-values", {
  skip_if_not_installed("MASS")
  model <- MASS::polr(Sat ~ Infl + Type + Cont, MASS::housing, Hess = TRUE)
  result <- ordinal_p(model)
  expect_true("p value" %in% colnames(result))
})
