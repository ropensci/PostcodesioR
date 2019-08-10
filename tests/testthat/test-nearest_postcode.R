context("nearest_postcode")

test_that("nearest_postcode works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  incorrect_postcode1 <- 3.15807
  incorrect_postcode2 <- "E"

  nearest_postcode_result <- nearest_postcode("EC1Y 8LX")

  expect_error(nearest_postcode(incorrect_postcode1))
  expect_error(nearest_postcode(incorrect_postcode2))

  expect_error(nearest_postcode("EC1Y 8LX", limit = 101))
  expect_error(nearest_postcode("EC1Y 8LX", limit = 10, radius = 2001))
  expect_error(nearest_postcode("EC1Y 8LX", limit = 10, radius = 99))

  expect_that(nearest_postcode_result, is_a("list"))
})
