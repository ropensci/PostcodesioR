context("random_place")

test_that("random_place works as expected", {

  random_place_result <- random_place()

  expect_that(random_place_result, is_a("list"))
})
