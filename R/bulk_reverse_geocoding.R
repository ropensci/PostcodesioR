#' Reverse geocoding - NOT WORKING
#'
#' Returns nearest postcodes for a given longitude and latitude. Accepts up to 100 geolocations.
#'
#' This method requires a JSON object containing an array of geolocation objects to be POSTed.
#' Each geolocation object accepts an optional radius (meters) and limit argument.
#' Both default to 100m and 10 respectively. It also accepts a wideSearch argument.
#'
#' @param A list containing an array of geolocation objects.
#'
#' @return A list with available data.
#'
#' @examples
#' bulk_reverse_geocoding()
#' @export

bulk_reverse_geocoding <- function(longitude, latitude) {
  r <- GET(paste0("https://api.postcodes.io/postcodes?lon=",
                  longitude,
                  "&lat=",
                  latitude))
  warn_for_status(r)
  content(r)
}
