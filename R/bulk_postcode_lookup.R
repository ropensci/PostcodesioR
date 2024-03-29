#' Bulk postcode lookup
#'
#' Returns a list of matching postcodes and respective available data.
#'
#' @importFrom httr POST
#' @importFrom utils URLencode
#'
#' @param postcodes Accepts a list of postcodes. Accepts up to 100 postcodes.
#' For only one postcode use \code{\link{postcode_lookup}}.
#'
#' @return A list of length one.
#' @seealso \code{\link{postcode_lookup}} for documentation.
#'
#' @export
#'
#' @examples
#' \donttest{
#' pc_list <- list(
#' postcodes = c("PR3 0SG", "M45 6GN", "EX165BL")) # spaces are ignored
#' bulk_postcode_lookup(pc_list)
#' # The function needs a list of length one. This won't work:
#' bulk_postcode_lookup(list("PR3 0SG", "M45 6GN", "EX165BL"))
#' }
#'
bulk_postcode_lookup <- function(postcodes) {
  check_list_limit(postcodes)
  postcodes <- lapply(postcodes, URLencode)
  r <- POST("https://api.postcodes.io/postcodes",
            body = postcodes,
            encode = "json")
  extract_results(r)
}

check_list_limit <- function(x) {
  if (!is.list(x))
    stop("Please provide a list with postcodes.")
  if (length(x) == 0)
    stop("Please provide a list with more than one postcode")
  count <- sum(sapply(x, length))
  if (count > 100)
    stop("Please provide a list with less than 100 postcodes.")
}
