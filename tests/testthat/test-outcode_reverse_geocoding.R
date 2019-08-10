context("outcode_reverse_geocoding")

test_that("outcode_reverse_geocoding works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  incorrect_geocode1 <- 3.1
  incorrect_geocode2 <- "4"

  outcode_reverse_geocoding_result <-
    outcode_reverse_geocoding("-3.15", "51.47")

  expect_error(outcode_reverse_geocoding(incorrect_geocode1))
  expect_error(outcode_reverse_geocoding(incorrect_geocode2))
  expect_error(outcode_reverse_geocoding(-3, 51.47))
  expect_error(outcode_reverse_geocoding(-3.15, 51))
  expect_error(
    outcode_reverse_geocoding(-3.15, 51.47, limit = 101, radius = 20000))
  expect_error(
    outcode_reverse_geocoding(-3.15, 51.47, limit = 11, radius = 3000))
  expect_error(
    outcode_reverse_geocoding(-3.15, 51.47, limit = 11, radius = 25001))

  expect_that(outcode_reverse_geocoding_result, is_a("list"))
})
