context("random_postcode")

test_that("random_postcode works as expected", {
  test_outcode <- "N1"

  random_postcode_result1 <- random_postcode()
  random_postcode_result2 <- random_postcode(test_outcode)

  expect_that(random_postcode_result1, is_a("list"))
  expect_that(random_postcode_result2, is_a("list"))

  expect_equal(random_postcode_result2$result$outcode, test_outcode)
})