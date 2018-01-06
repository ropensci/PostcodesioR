#' Terminated postcode lookup
#'
#' Returns nearest postcodes for a given longitude and latitude.
#'
#' @import httr
#'
#' @param postcode A string. Terminated UK postcode.
#'
#' @return A data frame with data about terminated postcode.
#'
#' @export
#'
#' @examples
#' terminated_postcode("EC1Y 8LX") # exisitng postcode - returns 404
#' terminated_postcode("E1W 1UU") # terminated - from Wikipedia but returns 404
#'
terminated_postcode <- function(postcode) {
  if (!is.character(postcode) || nchar(postcode) < 3) {
    stop("Please provide a UK postcode.")
  }

  r <- GET(paste0("https://api.postcodes.io/terminated_postcodes/", postcode), ua)
  warn_for_status(r)

  if (status_code(r) == 200) {
    data.frame(content(r)$result)
  }
}
