context("nearest_outcode")

test_that("nearest_outcode works as expected", {
  incorrect_outcode1 <- 3.15807
  incorrect_outcode2 <- "E"

  nearest_outcode_result <- nearest_outcode("EC1Y")

  expect_error(nearest_outcode(incorrect_outcode1))
  expect_error(nearest_outcode(incorrect_outcode2))
  expect_that(nearest_outcode_result, is_a("list"))
})
