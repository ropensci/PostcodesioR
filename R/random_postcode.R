#' Random postcode
#'
#' Returns a random postcode and all available data for that postcode.
#'
#' @importFrom httr GET
#'
#' @param outcode A string. Filters random postcodes by outcode.
#' Returns null if invalid outcode. Optional.
#'
#' @return A list with a random postcode with corresponding characteristics.
#' @seealso \code{\link{postcode_lookup}} for documentation.
#'
#' @export
#'
#' @examples
#' \donttest{
#' random_postcode()
#' random_postcode("N1")
#' }
#'
random_postcode <- function(outcode = NULL) {
  r <- GET("https://api.postcodes.io/random/postcodes",
           query = list(outcode = outcode))
  extract_results(r)
}
