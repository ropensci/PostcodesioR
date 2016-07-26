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
#' @param longitude A string. Needs to have at least two decimal points.
#' @param latitude A string. Needs to have at least two decimal points.
#' @return A list of geographical properties.
#'
#' @examples
#' outcode_reverse_geocoding("-3.15", "51.47")
#' outcode_reverse_geocoding("-3.15807731271522", "51.4799900627036")

outcode_reverse_geocoding <- function(longitude, latitude) {
  r <- GET(paste0("https://api.postcodes.io/outcodes?lon=",
                  longitude,
                  "&lat=",
                  latitude))
  warn_for_status(r) # https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
  content(r)
}
