context("postcode_autocomplete")

test_that("postcode_autocomplete works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  incorrect_postcode <- 1
  incorrect_limit1 <- 101
  incorrect_limit2 <- "11"
  correct_limit <- 11

  postcode_autocomplete_result1 <- postcode_autocomplete("E1")
  postcode_autocomplete_result2 <-
    postcode_autocomplete("E1", limit = correct_limit)

  expect_error(postcode_autocomplete(incorrect_postcode))
  expect_error(postcode_autocomplete("E1", limit = incorrect_limit1))
  expect_error(postcode_autocomplete("E1", limit = incorrect_limit2))

  expect_that(postcode_autocomplete_result1, is_a("data.frame"))
  expect_that(postcode_autocomplete_result2, is_a("data.frame"))

  expect_equal(nrow(postcode_autocomplete_result2), correct_limit)
})
