#' Returns nearest outcodes for a given outcode.
#'
#' Optional Query Parameters
#'
#' limit= (not required) Limits number of postcodes matches to return. Defaults to 10. Needs to be less than 100.
#'
#' radius= (not required) Limits number of postcodes matches to return. Defaults to 5,000m. Needs to be less than 25,000m.
#'
#' @import httr
#'
#' @param outcode A string with a UK postcode.
#'
#' @export
#'
#' @return A list of geographical properties.
#'
#' @examples
#' nearest_outcode("EC1Y")
#'
nearest_outcode <- function(outcode, limit = NULL, radius = NULL) {
  if (!is.character(outcode) || nchar(outcode) < 2) {
    stop("Please provide a valid UK outcode.")
  }
  r <- GET(paste0("https://api.postcodes.io/outcodes/", outcode, "/nearest"))
  # r <- GET("https://api.postcodes.io/outcodes",
  #          query = list(outcode = outcode, limit = limit, radius = radius))
  warn_for_status(r)
  content(r)
}
