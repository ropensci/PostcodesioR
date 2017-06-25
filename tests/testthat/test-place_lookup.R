context("place_lookup")

test_that("place_lookup works as expected", {

  place_lookup_result <- place_lookup("osgb4000000074544700")

  expect_that(place_lookup_result, is_a("list"))
})
