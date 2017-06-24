#' Nearest outcode
#'
#' Returns nearest outcodes for a given outcode.
#'
#' @import httr
#'
#' @param outcode A string with a UK postcode.
#' @param limit An integer. Optional parameter. Limits number of postcodes matches to return. Defaults to 10. Needs to be less than 100.
#' @param radius An integer. Optional parameter. Limits number of postcodes matches to return. Defaults to 5,000m. Needs to be less than 25,000m.
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
  #         query = list(outcode = outcode, limit = limit, radius = radius)) #TODO fix to include 'nearest' after the query
  warn_for_status(r)
  content(r)
}
