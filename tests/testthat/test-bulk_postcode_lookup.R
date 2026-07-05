context("bulk_postcode_lookup input validation")

library(testthat)

test_that("requires at least one postcode", {
  expect_error(bulk_postcode_lookup(), "Please provide at least one postcode.")
  expect_error(bulk_postcode_lookup(character(0)), "Please provide at least one postcode.")
})

test_that("preserves old list(postcodes = ...) form and list checks", {
  expect_error(check_list_limit("not a list"), "Please provide a list with postcodes.")
})
