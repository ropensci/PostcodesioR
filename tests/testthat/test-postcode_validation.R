context("postcode_validation")

test_that("postcode_validation works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  postcode_validation_result1 <- postcode_validation("EC1Y 8LX")
  postcode_validation_result2 <- postcode_validation("XYZ")
  postcode_validation_result3 <- postcode_validation("E")

  expect_true(postcode_validation_result1)
  expect_false(postcode_validation_result2)
  expect_false(postcode_validation_result3)
  expect_error(postcode_validation(1))
})
