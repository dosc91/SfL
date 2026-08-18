test_that("data_l contains the complete lexical-decision design", {
  data("data_l", package = "SfL")

  expect_equal(dim(data_l), c(7200L, 11L))
  expect_named(
    data_l,
    c(
      "subject", "item", "condition", "group", "frequency_z", "length",
      "trial", "RT", "accuracy", "neighbourhood", "neighbourhood_z"
    )
  )
  expect_false(anyNA(data_l))
  expect_true(all(vapply(data_l[c("subject", "item", "condition", "group")],
                         is.factor, logical(1))))
  expect_equal(nlevels(data_l$subject), 60L)
  expect_equal(nlevels(data_l$item), 120L)
  expect_equal(levels(data_l$condition), c("unrelated", "related"))
  expect_equal(levels(data_l$group), c("control", "training"))
  expect_equal(sort(unique(data_l$accuracy)), 0:1)
  expect_false(anyDuplicated(data_l[c("subject", "item")]) > 0L)
  expect_true(all(table(data_l$subject) == 120L))
  expect_true(all(table(data_l$item) == 60L))
})
