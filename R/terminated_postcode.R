#' Terminated postcode lookup
#'
#' Returns month and year if a postcode was terminated or is no longer active.
#'
#' @importFrom httr GET
#' @importFrom httr warn_for_status
#' @importFrom httr status_code
#'
#' @param postcode A string. Terminated UK postcode.
#'
#' @return A data frame with data about terminated postcode. NULL if postcode is active.
#'  * \code{postcode} Postcode. All currently terminated postcodes within
#'  the United Kingdom, the Channel Islands and the Isle of Man,
#'  received every 3 months from Royal Mail. 2, 3 or 4-character outward code,
#'  single space and 3-character inward code.
#'  * \code{year_terminated} Termination year.
#'  Year of termination of a postcode.
#'  * \code{month_terminated} Termination month.
#'  Month of termination of a postcode. 1-January, 2-February, ..., 12-December.
#'  * \code{longitude} Longitude.
#'  The WGS84 longitude given the Postcode's national grid reference.
#'  * \code{latitude} Latitude.
#'  The WGS84 latitude given the Postcode's national grid reference.
#'
#' See
#'   \url{https://postcodes.io/docs} for more details.
#' @md
#'
#' @export
#'
#' @examples
#' \donttest{
#' terminated_postcode("EC1Y 8LX") # existing postcode
#' terminated_postcode("E1W 1UU") # terminated postcode
#' }
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
