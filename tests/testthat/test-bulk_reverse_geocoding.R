context("bulk_reverse_geocoding")

test_that("bulk_reverse_geocoding works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  single_coordinate <- 3.15807
  geolocations_list <- structure(
    list(
      geolocations = structure(
        list(
          longitude = c(-3.15807731271522, -1.12935802905177),
          latitude = c(51.4799900627036, 50.7186356978817),
          limit = c(NA, 100L),
          radius = c(NA, 500L)),
        .Names = c("longitude", "latitude", "limit", "radius"),
        class = "data.frame",
        row.names = 1:2)),
    .Names = "geolocations")

  geocoding_results <- bulk_reverse_geocoding(geolocations_list)

  expect_error(bulk_reverse_geocoding(single_coordinate))
  expect_that(geocoding_results, is_a("list"))
})
