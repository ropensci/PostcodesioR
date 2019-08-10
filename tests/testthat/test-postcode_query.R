context("postcode_query")

test_that("postcode_query works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  incorrect_postcode1 <- 1
  incorrect_postcode2 <- "E"
  incorrect_limit1 <- 101
  incorrect_limit2 <- "11"
  correct_limit <- 11

  postcode_query_result1 <- postcode_query("EC1Y8LX")
  postcode_query_result2 <- postcode_query("EC1", limit = correct_limit)

  expect_error(postcode_query(incorrect_postcode1))
  expect_error(postcode_query(incorrect_postcode2))

  expect_error(postcode_query("EC1", limit = incorrect_limit1))
  expect_error(postcode_query("EC1", limit = incorrect_limit2))

  expect_that(postcode_query_result1, is_a("list"))
  expect_that(postcode_query_result2, is_a("list"))

  expect_equal(length(postcode_query_result2), correct_limit)
})
