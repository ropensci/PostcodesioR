#' Returns nearest outcodes for a given outcode.
#'
#' Optional Query Parameters
#'
#' limit= (not required) Limits number of postcodes matches to return. Defaults to 10. Needs to be less than 100.
#'
#' radius= (not required) Limits number of postcodes matches to return. Defaults to 5,000m. Needs to be less than 25,000m.
#'
#' @param postcode A string.
#' @return A list of geographical properties.
#'
#' @examples
#' nearest_postcode("EC1Y 8LX")
#' nearest_postcode("EC1Y8LX")
#' @export

nearest_postcode <- function(postcode) {
  r <- GET(paste0("https://api.postcodes.io/postcodes/", postcode, "/nearest"))
  warn_for_status(r)
  content(r)
}
