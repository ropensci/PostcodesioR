#' Place Query
#'
#' Submit a place query and receive a complete list of places matches and associated data.
#'
#' @import httr
#'
#' @param place A string. Name of a place to search for.
#'
#' @return A list with available places.
#'
#' @export
#'
#' @examples
#' place_query("Cambridge")
#'
place_query <- function(place) {
  if (!is.character(place) || nchar(place) < 2) {
    stop("Please provide a valid Ordnance Survey code.")
  }
  r <- GET(paste0("https://api.postcodes.io/places?q=", place))
  warn_for_status(r)
  content(r)
}
