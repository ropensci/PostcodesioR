#' Random Place
#'
#' Returns a random place and all associated data
#'
#' @import httr
#'
#' @return A list describing a random place and all associated data.
#'
#' @export
#'
#' @examples
#' random_place()
#'
random_place <- function() {
  r <- GET("https://api.postcodes.io/random/places")
  warn_for_status(r)
  content(r)
}

