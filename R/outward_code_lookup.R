#' Outward code lookup
#'
#' Geolocation data for the centroid of the outward code specified.
#' The outward code represents the first half of any postcode (separated by a space).
#'
#' @param outcode A string.
#' @return The list of geographical properties.
#'
#' @examples
#' outward_code_lookup("E1")
#'
#' @export

outward_code_lookup <- function(outcode) {
  r <- GET(paste0("https://api.postcodes.io/outcodes/", outcode))
  warn_for_status(r) # https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
  content(r)
}
