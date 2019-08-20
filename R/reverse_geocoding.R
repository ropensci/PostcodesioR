#' Reverse geocoding
#'
#' Returns nearest postcodes for a given longitude and latitude.
#'
#' @importFrom httr GET
#'
#' @param longitude A string or numeric. Needs to have at least three decimal points.
#' @param latitude A string or numeric. Needs to have at least three decimal points.
#' @param limit An integer. Limits number of postcodes matches to return. Defaults to 10. Needs to be less than 100.
#' @param radius An integer. Limits number of postcodes matches to return. Defaults to 100m. Needs to be less than 2,000m.
#' @param wideSearch TRUE or FALSE. Search up to 20km radius, but subject to a maximum of 10 results. Since lookups over a wide area can be very expensive, we've created this method to allow you choose to make the trade off between search radius and number of results. Defaults to false. When enabled, radius and limits over 10 are ignored.
#'
#' @return A list with available data.
#' @seealso \code{\link{postcode_lookup}} for documentation.
#'
#' @export
#'
#' @examples
#' \donttest{
#' reverse_geocoding(0.127, 51.507)
#' reverse_geocoding("0.1275", "51.5073", limit = 3)
#' reverse_geocoding("0.1275", "51.5073", limit = 11, radius = 200)
#' }
#'
reverse_geocoding <- function(longitude, latitude,
                              limit = 10, radius = 100, wideSearch = NULL) {
  r <- GET("https://api.postcodes.io/postcodes",
           query = list(lon = longitude, lat = latitude,
                        limit = limit, radius = radius,
                        wideSearch = wideSearch))
  extract_results(r)
}
