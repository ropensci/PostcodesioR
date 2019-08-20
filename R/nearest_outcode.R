#' Nearest outcode
#'
#' Returns nearest outcodes for a given outcode.
#' The search is based on the relative distance of the outcode centroid.
#'
#' @importFrom httr GET
#'
#' @param outcode A string with a UK postcode.
#' @param limit An integer. Optional parameter. Limits number of postcodes matches to return.
#' Defaults to 10. Needs to be less than 100.
#' @param radius An integer. Optional parameter. Limits number of postcodes matches to return.
#' Defaults to 5,000m. Needs to be less than 25,000m.
#'
#' @export
#'
#' @return A list of geographical properties.
#' @seealso \code{\link{postcode_lookup}} for documentation.
#'
#' @examples
#' \donttest{
#' nearest_outcode("EC1Y")
#' nearest_outcode("EC1Y", limit = 11)
#' nearest_outcode("EC1Y", limit = 11, radius = 6000)
#' }
#'
nearest_outcode <- function(outcode, limit = 10, radius = 5000) {
  if (!is.character(outcode) || nchar(outcode) < 2) {
    stop("Please provide a valid UK outcode.")
  }
  if (limit > 100) {
    stop("Please provide an integer lower than 100.")
  }
  if (radius > 25000 || radius < 5000) {
    stop("Please provide a radius between 5000 and 25000 (m).")
  }
  r <- GET(paste0("https://api.postcodes.io/outcodes/",
                  outcode,
                  "/nearest",
                  "?limit=",
                  limit,
                  "?radius=",
                  radius))
  extract_results(r)
}
