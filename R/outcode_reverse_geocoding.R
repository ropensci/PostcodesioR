#' Outcode reverse geocoding
#'
#' Returns nearest outcodes for a given longitude and latitude.
#'
#' @importFrom httr GET
#'
#' @param longitude A string, integer or float. Needs to have at least two decimal points.
#' @param latitude A string, integer or float. Needs to have at least two decimal points.
#' @param limit A string, integer or float. Limits number of postcodes matches to return. Defaults to 10. Needs to be less than 100.
#' @param radius A string, integer or float. Limits number of postcodes matches to return. Defaults to 5,000m. Needs to be less than 25,000m.
#'
#' @export
#'
#' @return A list of geographical properties.
#' @seealso \code{\link{postcode_lookup}} for documentation.
#'
#' @examples
#' \donttest{
#' outcode_reverse_geocoding("-3.15", "51.47")
#' outcode_reverse_geocoding(-3.15, 51.47)
#' outcode_reverse_geocoding("-3.15807731271522", "51.4799900627036")
#' outcode_reverse_geocoding(-3.15, 51.47, limit = 11, radius = 20000)
#' }
#'
outcode_reverse_geocoding <- function(longitude, latitude,
                                      limit = 10, radius = 5000) {
  if (nchar(longitude) < 4) {
    stop("Please provide a valid longitude with at least two decimal points.")
  }
  if (nchar(latitude) < 4) {
    stop("Please provide a valid latitude with at least two decimal points.")
  }
  if (limit > 100) {
    stop("Please provide an integer lower than 100.")
  }
  if (radius > 25000 || radius < 5000) {
    stop("Please provide a radius between 5000 and 25000.")
  }
  r <- GET(paste0("https://api.postcodes.io/outcodes?lon=",
                  longitude,
                  "&lat=",
                  latitude,
                  "&limit=",
                  limit,
                  "&radius=",
                  radius))
  extract_results(r)
}
