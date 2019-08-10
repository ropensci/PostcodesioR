context("terminated_postcode")

test_that("terminated_postcode works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  incorrect_postcode1 <- 1
  incorrect_postcode2 <- "E"

  terminated_postcode_result1 <- terminated_postcode("E1W 1UU")

  expect_error(terminated_postcode(incorrect_postcode1))
  expect_error(terminated_postcode(incorrect_postcode2))

  expect_that(terminated_postcode_result1, is_a("data.frame"))
  expect_warning(terminated_postcode("EC1Y 8LX"))
})
