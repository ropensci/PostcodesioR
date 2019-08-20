#' Nearest postcode
#'
#' Returns nearest postcodes for a given postcode.
#' The search is based on the relative distance of the postcode centroid.
#'
#' @importFrom httr GET
#'
#' @param postcode A string. Valid UK postcode.
#' @param limit A string or integer. Limits number of postcodes matches to return. Defaults to 10. Needs to be lower than 100.
#' @param radius Limits number of postcodes matches to return. Defaults to 100m. Needs to be less than 2,000m.
#'
#' @export
#'
#' @return A list of geographic properties of the nearest postcode.
#'
#' @examples
#' \donttest{
#' nearest_postcode("EC1Y 8LX")
#' nearest_postcode("EC1Y 8LX", limit = 11)
#' nearest_postcode("EC1Y 8LX", limit = 12, radius = 200)
#' }
#'
nearest_postcode <- function(postcode, limit = 10, radius = 100) {
  if (!is.character(postcode) || nchar(postcode) < 2) {
    stop("Please provide a valid UK postcode.")
  }
  if (limit > 100) {
    stop("Please provide an integer lower than 100.")
  }
  if (radius > 2000 || radius < 100) {
    stop("Please provide a radius between 100 and 2000 (m).")
  }
  r <- GET(paste0("https://api.postcodes.io/postcodes/",
                  postcode,
                  "/nearest",
                  "?limit=",
                  limit,
                  "?radius=",
                  radius))
  extract_results(r)
}
