#' Place Query
#'
#' Submit a place query and receive a complete list of places matches and associated data.
#'
#' @import httr
#'
#' @param place A string. Name of a place to search for.
#' @param limit An integer. Limits the number of matches to return. Defaults to 10. Needs to be less than 100.
#'
#' @return A list with available places.
#'
#' @export
#'
#' @examples
#' place_query("Hills")
#' place_query("Hills", limit = 12)
#'
place_query <- function(place, limit = 10) {
  if (!is.character(place) || nchar(place) < 2) {
    stop("Please provide a valid place name.")
  }
  if (limit > 100) {
    stop("Please provide an integer lower than 100.")
  }
  r <- GET(paste0("https://api.postcodes.io/places?q=",
                  place, "&limit=", limit))
  extract_results(r)
}
