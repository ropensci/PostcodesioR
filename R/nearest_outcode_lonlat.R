#' Nearest outcodes given longitude and latitude
#'
#' Returns nearest outward codes for a given longitude and latitude.
#' The search is based on the relative distance of the outcode centroid.
#'
#' @importFrom httr GET
#'
#' @param longitude A string or numeric. Needs to have at least three decimal points.
#' @param latitude A string or numeric. Needs to have at least three decimal points.
#'
#' @return A list with available data.
#' @seealso \code{\link{postcode_lookup}} for documentation.
#'
#' @export
#'
#' @examples
#' \donttest{
#' nearest_outcode_lonlat(0.127, 51.507)
#' }
#'
nearest_outcode_lonlat <- function(longitude, latitude) {
  r <- GET("https://api.postcodes.io/outcodes",
           query = list(lon = longitude, lat = latitude))
  extract_results(r)
}
