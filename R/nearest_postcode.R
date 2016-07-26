#' Nearest postcode
#'
#' Returns nearest postcodes for a given postcode.
#'
#' Optional Query Parameters
#'
#' limit= (not required) Limits number of postcodes matches to return. Defaults to 10. Needs to be less than 100.
#'
#' radius= (not required) Limits number of postcodes matches to return. Defaults to 100m. Needs to be less than 2,000m.
#' @param postcode A string.
#' @return A list of geographic properties of the nearest postcode.
#'
#' @examples
#' nearest_postcode("EC1Y 8LX")

nearest_postcode <- function(postcode) {
  r <- GET(paste0("https://api.postcodes.io/postcodes/", postcode, "/nearest"))
  warn_for_status(r) # https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
  content(r)
}
