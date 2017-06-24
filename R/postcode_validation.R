#' Postcode validation
#'
#' Convenience method to validate a postcode.
#'
#' @import httr
#'
#' @param postcode A string. Valid UK postcode.
#'
#' @export
#'
#' @return A list consisting of the HTTP response, and True or False (meaning valid or invalid respectively).
#'
#' @examples
#' postcode_validation("EC1Y 8LX") # returns TRUE
#' postcode_validation("XYZ") # returns FALSE
#'
postcode_validation <- function(postcode) {
  r <- GET(paste0("https://api.postcodes.io/postcodes/", postcode, "/validate"))
  warn_for_status(r)
  content(r)
}
