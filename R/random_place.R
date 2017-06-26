#' Random Place
#'
#' Returns a random place and all associated data
#'
#' @import httr
#'
#' @return A data frame describing a random place and all associated data.
#'
#' @export
#'
#' @examples
#' random_place()
#'
random_place <- function() {
  r <- GET("https://api.postcodes.io/random/places")
  warn_for_status(r)
  r <- content(r)
  r <- r[[2]]
  r <- data.frame(t(sapply(r, `[`)))
  return(r)
}

