#' Postcode autocomplete
#'
#' Returns a data frame of matching postcodes.
#'
#' @importFrom httr GET
#' @importFrom utils URLencode
#'
#' @param postcode A string. Valid UK postcode.
#' @param limit An integer. Limits number of postcodes matches to return. Defaults to 10. Needs to be less than 100.
#'
#' @export
#'
#' @return A data frame with suggested postcodes.
#'
#' @examples
#' \donttest{
#' postcode_autocomplete("E1")
#' postcode_autocomplete("E1", limit = 11)
#' }
#'
postcode_autocomplete <- function(postcode, limit = 10) {
  if (!is.character(postcode)) {
    stop("Please provide a valid UK postcode.")
  }
  if (limit > 100) {
    stop("Please provide an integer lower than 100.")
  }
  postcode <- URLencode(postcode)
  r <- GET(paste0("https://api.postcodes.io/postcodes/",
                  postcode, "/autocomplete", "?limit=", limit))
  r <- extract_results(r)
  r <- data.frame(sapply(r, "[", 1),
                  stringsAsFactors = FALSE)
  colnames(r) <- "postcode"
  return(r)
}
