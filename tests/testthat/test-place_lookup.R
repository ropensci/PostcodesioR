context("place_lookup")

test_that("place_lookup works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  place_lookup_result <- place_lookup("osgb4000000074544700")

  expect_that(place_lookup_result, is_a("list"))

  expect_error(place_lookup(1))
})
