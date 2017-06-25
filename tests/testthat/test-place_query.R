context("place_query")

test_that("place_query works as expected", {

  place_query_result <- place_query("Cambridge")

  expect_that(place_query_result, is_a("list"))
})
