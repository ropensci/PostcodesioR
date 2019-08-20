#' Outward code lookup
#'
#' Geolocation data for the centroid of the outward code specified.
#'
#' @importFrom httr GET
#'
#' @param outcode A string. The outward code representing the first half of any postcode (separated by a space).
#'
#' @export
#'
#' @return The list of geographical properties.
#' @seealso \code{\link{postcode_lookup}} for documentation.
#'
#' @examples
#' \donttest{
#' outward_code_lookup("E1")
#' }
#'
outward_code_lookup <- function(outcode) {
  if (!is.character(outcode) || nchar(outcode) < 2) {
    stop("Please provide a valid UK outcode.")
  }
  r <- GET(paste0("https://api.postcodes.io/outcodes/", outcode))
  extract_results(r)
}
