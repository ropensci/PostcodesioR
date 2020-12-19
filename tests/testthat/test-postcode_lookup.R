context("postcode_lookup")

test_that("postcode_lookup works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  incorrect_postcode1 <- 1
  incorrect_postcode2 <- "E"
  incorrect_postcode3 <- c("EC1Y8LX", "EX165BL")

  postcode_lookup_result <- postcode_lookup("EC1Y8LX")

  expect_error(postcode_lookup(incorrect_postcode1))
  expect_error(postcode_lookup(incorrect_postcode2))
  expect_error(postcode_lookup(incorrect_postcode3))

  expect_that(postcode_lookup_result, is_a("data.frame"))

  # Check if new variables were added to the API
  harcoded_lookup_names <-
    c("postcode", "quality", "eastings", "northings", "country",
      "nhs_ha", "longitude", "latitude", "european_electoral_region",
      "primary_care_trust", "region", "lsoa", "msoa", "incode", "outcode",
      "parliamentary_constituency", "admin_district", "parish", "admin_county",
      "admin_ward", "ced", "ccg", "nuts", "admin_district_code",
      "admin_county_code", "admin_ward_code", "parish_code",
      "parliamentary_constituency_code", "ccg_code", "ccg_id_code",
      "ced_code", "nuts_code", "lsoa_code", "msoa_code", "lau2_code")
  postcode_lookup_names <- names(postcode_lookup_result)

  expect_equal(harcoded_lookup_names, postcode_lookup_names)
})
