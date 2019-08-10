context("reverse_geocoding")

test_that("reverse_geocoding works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  reverse_geocoding_result1 <- reverse_geocoding(0.1, 51.5)
  reverse_geocoding_result2 <- reverse_geocoding(0.127, 51.507)
  reverse_geocoding_result3 <- reverse_geocoding("0.1275", "51.5073", limit = 3)
  reverse_geocoding_result4 <- reverse_geocoding("0.1275", "51.5073",
                                                 limit = 11, radius = 200)

  expect_that(reverse_geocoding_result2, is_a("list"))

  expect_equal(reverse_geocoding_result1, NULL)
  expect_equal(length(reverse_geocoding_result3), 3)
  expect_equal(length(reverse_geocoding_result4), 11)
})
