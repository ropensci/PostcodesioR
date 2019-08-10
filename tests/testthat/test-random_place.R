context("random_place")

test_that("random_place works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  random_place_result <- random_place()

  expect_that(random_place_result, is_a("data.frame"))
})
