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
})
