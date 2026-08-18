test_that("resource catalogue selects registered URLs", {
  url <- SfL:::.resource_url(3, 2021, "English", "slide")
  expect_identical(url, "https://dosc91.github.io/SfL/slides/SfL_Session_03.pdf")

  hannover <- SfL:::.resource_url(11, 2023, "hannover", "exercise")
  expect_match(hannover, "11_Kollinearitaet[.]html$")

  marburg <- SfL:::.resource_url(8, 2026, "Marburg", "exercise")
  expect_identical(
    marburg,
    "https://dosc91.github.io/SfL/exercises/Marburg/08_Kollinearitaet.html"
  )
})

test_that("resource catalogue reports unavailable sessions", {
  expect_message(
    expect_null(SfL:::.resource_url(2, 2021, "english", "slide")),
    "Available sessions: 01, 03"
  )
  expect_message(
    expect_null(SfL:::.resource_url(1, 1999, "unknown", "slide")),
    "No slide resources"
  )
})

test_that("resource inputs are validated", {
  expect_error(SfL:::.resource_url(1.5, 2021, "english", "slide"),
               "positive whole number")
  expect_error(SfL:::.resource_url(1, 2021, "", "slide"), "non-empty")
})
