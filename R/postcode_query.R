#' Postcode query
#'
#' Submit a postcode query and receive a complete list of postcode matches and all associated postcode data.
#'
#' Optional Query Parameters
#'
#' query= (not required) aliases to q=
#'
#' limit= (not required) Limits number of postcodes matches to return. Defaults to 10. Needs to be less than 100.
#' @param postcode A string.
#' @return A list of geographic properties.
#'
#' @examples
#' postcode_query("EC1Y8LX")
#'
#' @export

postcode_query <- function(postcode) {
  r <- GET(paste0("https://api.postcodes.io/postcodes?q=", postcode))
  #warn_for_status(r) # https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
  content(r)
}
