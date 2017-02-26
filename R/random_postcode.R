#' Random postcode
#'
#' Returns a random postcode and all available data for that postcode.
#'
#' Optional Query Parameters
#'
#' outcode= (not required) Filters random postcodes by outcode. Returns null if invalid outcode.
#'
#' @return A random post code with corresponding characteristics.
#' @examples
#' random_postcode()
#'
#' @export

random_postcode <- function() {
  r <- GET(paste0("https://api.postcodes.io/random/postcodes"))
  warn_for_status(r) # https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
  content(r)
}

