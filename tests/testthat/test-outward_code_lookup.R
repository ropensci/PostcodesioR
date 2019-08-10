context("outward_code_lookup")

test_that("outward_code_lookup works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  incorrect_outcode1 <- "E"
  incorrect_outcode2 <- "EC1Y 8LX"

  outward_code_lookup_result <- outward_code_lookup("E1")

  expect_error(outward_code_lookup(incorrect_outcode1))
  expect_warning(outward_code_lookup(incorrect_outcode2))
  expect_that(outward_code_lookup_result, is_a("list"))
})
