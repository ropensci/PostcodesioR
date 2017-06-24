context("postcode_autocomplete")

test_that("postcode_autocomplete works as expected", {
  incorrect_postcode <- 1
  incorrect_limit1 <- 101
  incorrect_limit2 <- "11"
  correct_limit = 11

  postcode_autocomplete_result1 <- postcode_autocomplete("E1")
  postcode_autocomplete_result2 <- postcode_autocomplete("E1", limit = correct_limit)

  expect_error(postcode_autocomplete(incorrect_postcode))
  expect_error(postcode_autocomplete("E1", limit = incorrect_limit1))
  expect_error(postcode_autocomplete("E1", limit = incorrect_limit2))

  expect_that(postcode_autocomplete_result1, is_a("list"))
  expect_that(postcode_autocomplete_result2, is_a("list"))

  expect_equal(length(postcode_autocomplete_result2$result), correct_limit)
})
