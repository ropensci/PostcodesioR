#' Postcode autocomplete
#'
#' Convenience method to return an list of matching postcodes.
#'
#' Optional Query Parameters
#'
#' limit= (not required) Limits number of postcodes matches to return. Defaults to 10. Needs to be less than 100.
#'
#' @param postcode A string.
#' @return A list of suggested postcodes. Defaults to 10.
#'
#' @examples
#' postcode_autocomplete("E1")
#' @export

postcode_autocomplete <- function(postcode) {
  r <- GET(paste0("https://api.postcodes.io/postcodes/", postcode, "/autocomplete"))
  warn_for_status(r)
  content(r)
}
