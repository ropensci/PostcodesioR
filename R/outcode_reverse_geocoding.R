#' Outcode reverse geocoding
#'
#' Returns nearest outcodes for a given longitude and latitude.
#'
#' Optional Query Parameters
#'
#' limit= (not required) Limits number of postcodes matches to return. Defaults to 10. Needs to be less than 100.
#'
#' radius= (not required) Limits number of postcodes matches to return. Defaults to 5,000m. Needs to be less than 25,000m.
#'
#' @import httr
#'
#' @param longitude A string, integer or float. Needs to have at least two decimal points.
#' @param latitude A string, integer or float. Needs to have at least two decimal points.
#'
#' @export
#'
#' @return A list of geographical properties.
#'
#' @examples
#' outcode_reverse_geocoding("-3.15", "51.47")
#' outcode_reverse_geocoding(-3.15, 51.47)
#' outcode_reverse_geocoding("-3.15807731271522", "51.4799900627036")
#'
outcode_reverse_geocoding <- function(longitude, latitude) {
  if (nchar(longitude) < 4) {
    stop("Please provide a valid longitude with at least two decimal points.")
  }
  if (nchar(latitude) < 4) {
    stop("Please provide a valid latitude with at least two decimal points.")
  }
  r <- GET(paste0("https://api.postcodes.io/outcodes?lon=",
                  longitude,
                  "&lat=",
                  latitude))
  # TODO add optional parameters
  warn_for_status(r)
  content(r)
}
