context("nearest_outcode_lonlat")

test_that("nearest_outcode_lonlat works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  nearest_outcode_lonlat_result <- nearest_outcode_lonlat(0.127, 51.507)

  expect_error(nearest_outcode_lonlat(0.127))
  expect_equal(nearest_outcode_lonlat(356, 999), NULL)

  expect_that(nearest_outcode_lonlat_result, is_a("list"))
})
