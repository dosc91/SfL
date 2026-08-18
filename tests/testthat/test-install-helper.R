test_that("workshop installer has the plotting defaults", {
  defaults <- eval(formals(install_workshop_packages)$packages)
  expect_setequal(
    defaults,
    c("ggplot2", "gridExtra", "gghighlight", "ggridges", "ggforce", "factoextra")
  )
})

test_that("workshop installer validates package names", {
  expect_error(install_workshop_packages(c("ggplot2", NA_character_)),
               "character vector")
})
