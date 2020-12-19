context("scottish_postcode_lookup")

test_that("scottish_postcode_lookup works as expected", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  incorrect_postcode1 <- 1
  incorrect_postcode2 <- "E"
  incorrect_postcode3 <- c("EC1Y8LX", "EX165BL")

  postcode_lookup_result <- scottish_postcode_lookup("EH12NG")

  expect_error(postcode_lookup(incorrect_postcode1))
  expect_error(postcode_lookup(incorrect_postcode2))
  expect_error(postcode_lookup(incorrect_postcode3))

  expect_that(postcode_lookup_result, is_a("data.frame"))

  # Check if new variables were added to the API
  harcoded_scottish_lookup_names <-
    c("postcode",
      "scottish_parliamentary_constituency",
      "scottish_parliamentary_constituency_code")
  postcode_lookup_names <- names(postcode_lookup_result)

  expect_equal(harcoded_scottish_lookup_names, postcode_lookup_names)
})
