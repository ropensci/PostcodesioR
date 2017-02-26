#' Postcode lookup
#'
#' Lookup a postcode.
#'
#' @param postcode A string.
#' @return A list. Returns all available data if found. Returns 404 if postcode does not exist.
#'
#' @examples
#' postcode_lookup("EC1Y8LX")
#' postcode_lookup("EC1Y 8LX")
#' @export

postcode_lookup <- function(postcode) {
  r <- GET(paste0("https://api.postcodes.io/postcodes/", postcode))
  warn_for_status(r)
  content(r)
}
