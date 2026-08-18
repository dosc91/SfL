test_that("mode_stat and se handle missing values", {
  expect_equal(mode_stat(c(1, 1, 2)), 1)
  expect_true(is.na(mode_stat(c(NA, NA), na.rm = TRUE)))
  expect_equal(se(c(1, 2, 3, 4)), stats::sd(c(1, 2, 3, 4)) / 2)
  expect_equal(se(c(1, 2, NA), na.rm = TRUE), stats::sd(c(1, 2)) / sqrt(2))
})

test_that("create_error_bar_df uses non-missing sample size", {
  input <- data.frame(group = c("a", "a", "a", "b", "b"),
                      value = c(1, 3, NA, 2, 4))
  result <- create_error_bar_df(input, "value", "group", type = "std")
  expect_named(result, c("group", "value", "std"))
  expect_equal(result$value, c(2, 3))
  expect_equal(result$std, c(1, 1))
})

test_that("corfun returns a lower-triangular matrix", {
  input <- data.frame(a = 1:10, b = 2 * (1:10), c = factor(rep(1:2, 5)))
  result <- suppressWarnings(capture.output(value <- corfun(input, names(input))))
  expect_true(is.matrix(value))
  expect_equal(dim(value), c(3, 3))
  expect_equal(value[2, 1], 1)
  expect_true(is.na(value[1, 2]))
})

test_that("pairwise_wilcox discovers prediction columns", {
  input <- data.frame(
    group = rep(c("a", "b"), each = 4),
    PredictedSize.1 = 1:8,
    PredictedSize.2 = 2:9
  )
  result <- suppressWarnings(pairwise_wilcox("group", input))
  expect_true(is.matrix(result))
})
