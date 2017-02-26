#' Reverse geocoding
#'
#' Returns nearest postcodes for a given longitude and latitude.
#'
#' Optional Query Parameters:
#' limit= (not required) Limits number of postcodes matches to return. Defaults to 10. Needs to be less than 100.
#' radius= (not required) Limits number of postcodes matches to return. Defaults to 100m. Needs to be less than 2,000m.
#' wideSearch= (not required) Search up to 20km radius, but subject to a maximum of 10 results. Since lookups over a wide area can be very expensive, we've created this method to allow you choose to make the trade off between search radius and number of results. Defaults to false. When enabled, radius and limits over 10 are ignored.
#'
#' @param longitude A string. Needs to have at least three decimal points.
#' @param latitude A string. Needs to have at least three decimal points.
#' @return A list with available data.
#'
#' @examples
#' reverse_geocoding("-3.158", "51.479")
#'
#' @export

reverse_geocoding <- function(longitude, latitude) {
  r <- GET(paste0("https://api.postcodes.io/postcodes?lon=",
                  longitude,
                  "&lat=",
                  latitude))
  warn_for_status(r) # https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
  content(r)
}

