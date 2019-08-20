#' Bulk reverse geocoding
#'
#' Returns nearest postcodes for a given longitude and latitude. Accepts up to 100 geolocations.
#'
#' This method requires a JSON object containing an array of geolocation objects to be POSTed.
#' Each geolocation object accepts an optional radius (meters) and limit argument.
#' Both default to 100m and 10 respectively. It also accepts a wideSearch argument.
#'
#' @importFrom httr POST
#'
#' @param geolocations A list containing an array of objects to geolocate.
#' At least two elements needed.
#'
#' @return A list with the geocoded data.
#' @seealso \code{\link{postcode_lookup}} for documentation.
#'
#' @export
#'
#' @examples
#'
#' \donttest{
#' geolocations_list <- structure(
#' list(
#' geolocations = structure(
#' list(
#' longitude = c(-3.15807731271522, -1.12935802905177),
#' latitude = c(51.4799900627036, 50.7186356978817),
#' limit = c(NA, 100L),
#' radius = c(NA, 500L)),
#' .Names = c("longitude", "latitude", "limit", "radius"),
#' class = "data.frame",
#' row.names = 1:2)),
#' .Names = "geolocations")
#'
#' bulk_reverse_geocoding(geolocations_list)
#' }
#'
bulk_reverse_geocoding <- function(geolocations) {
  if (!is.list(geolocations))
    stop("Please provide a list with geolocations.")
  r <- POST("https://api.postcodes.io/postcodes",
            body = geolocations,
            encode = "json")
  extract_results(r)
}
