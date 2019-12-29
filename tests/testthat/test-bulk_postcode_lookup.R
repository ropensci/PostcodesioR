context("bulk_postcode_lookup")

test_that("bulk_postcode_lookup works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  single_postcode <- c("PR3 0SG")
  pc_list <- list(postcodes = c("PR3 0SG", "M45 6GN", "EX165BL"))
  lookup_results <- bulk_postcode_lookup(pc_list)

  expect_error(bulk_postcode_lookup(single_postcode))
  expect_error(bulk_postcode_lookup(list()))
  pc_list <- list(postcodes = 1:101)
  expect_error(bulk_postcode_lookup(pc_list))
  pc_list <- list(postcodes = 1:50, o = 1:51)
  expect_error(bulk_postcode_lookup(pc_list))
  expect_that(lookup_results, is_a("list"))
})
