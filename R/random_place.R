#' Random place
#'
#' Returns a random place and all associated data
#'
#' @importFrom httr GET
#' @importFrom httr warn_for_status
#' @importFrom httr status_code
#' @importFrom httr content
#'
#' @return A data frame describing a random place and all associated data.
#' @seealso \code{\link{place_lookup}} for documentation.
#'
#' @export
#'
#' @examples
#' \donttest{
#' random_place()
#' }
#'
random_place <- function() {
  r <- GET("https://api.postcodes.io/random/places")
  warn_for_status(r)
  if (status_code(r) == 200) {
    r <- content(r)
    r <- r[["result"]]
    r <- data.frame(t(sapply(r, `[`)))
    return(r)
  }
}
