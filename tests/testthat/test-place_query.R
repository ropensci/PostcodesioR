context("place_query")

test_that("place_query works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  incorrect_limit1 <- 101
  incorrect_limit2 <- "11"
  correct_limit <- 11

  place_query_result1 <- place_query("Hills")
  place_query_result2 <- place_query("Hills", limit = correct_limit)

  expect_that(place_query_result1, is_a("list"))
  expect_that(place_query_result2, is_a("list"))

  expect_error(place_query("EC1", limit = incorrect_limit1))
  expect_error(place_query("EC1", limit = incorrect_limit2))
  expect_error(place_query("H"))
})
