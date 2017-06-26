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
#' @return A logical vector: True or False (meaning respectively valid or invalid postcode).
#'
#' @examples
#' postcode_validation("EC1Y 8LX") # returns TRUE
#' postcode_validation("XYZ") # returns FALSE
#'
postcode_validation <- function(postcode) {
  r <- GET(paste0("https://api.postcodes.io/postcodes/", postcode, "/validate"))
  warn_for_status(r)
  r <- content(r)
  r <- r[[2]]
  return(r)
}
