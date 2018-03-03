#' Terminated postcode lookup
#'
#' Returns month and year if a postcode was terminated or is no longer active.
#'
#' @import httr
#'
#' @param postcode A string. Terminated UK postcode.
#'
#' @return A data frame with data about terminated postcode. NULL if postcode is active.
#'
#' @export
#'
#' @examples
#' terminated_postcode("EC1Y 8LX") # exisitng postcode
#' terminated_postcode("E1W 1UU") # terminated
#'
terminated_postcode <- function(postcode) {
  if (!is.character(postcode) || nchar(postcode) < 3) {
    stop("Please provide a UK postcode.")
  }

  r <- GET(paste0("https://api.postcodes.io/terminated_postcodes/", postcode))
  warn_for_status(r)

  if (status_code(r) == 200) {
    data.frame(content(r)$result)
  }
}
