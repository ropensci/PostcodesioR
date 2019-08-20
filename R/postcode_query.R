#' Postcode query
#'
#' Submit a postcode query and receive a complete list of postcode matches and all associated postcode data.
#'
#' @importFrom httr GET
#'
#' @param postcode A string. Valid UK postcode.
#' @param limit An integer. Limits the number of matches to return. Defaults to 10. Needs to be less than 100.
#'
#' @export
#'
#' @return A list of geographic properties.
#' To return a data frame use \link[PostcodesioR]{postcode_lookup}.
#'
#' @examples
#' \donttest{
#' postcode_query("EC1Y8LX")
#' postcode_query("EC1", limit = 11)
#' }
#'
postcode_query <- function(postcode, limit = 10) {
  if (!is.character(postcode) || nchar(postcode) < 2) {
    stop("Please provide a valid UK outcode.")
  }
  if (limit > 100) {
    stop("Please provide an integer lower than 100.")
  }
  r <- GET(paste0("https://api.postcodes.io/postcodes?q=",
                  postcode, "&limit=", limit))
  extract_results(r)
}
