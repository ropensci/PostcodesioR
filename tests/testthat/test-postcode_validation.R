context("postcode_validation")

test_that("postcode_validation works as expected", {
  postcode_validation_result1 <- postcode_validation("EC1Y 8LX")
  postcode_validation_result2 <- postcode_validation("XYZ")
  postcode_validation_result3 <- postcode_validation("E")
  postcode_validation_result4 <- postcode_validation(1)

  expect_true(postcode_validation_result1$result)
  expect_false(postcode_validation_result2$result)
  expect_false(postcode_validation_result3$result)
  expect_false(postcode_validation_result4$result)
})