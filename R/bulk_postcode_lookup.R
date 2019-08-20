#' Bulk postcode lookup
#'
#' Returns a list of matching postcodes and respective available data.
#'
#' @importFrom httr POST
#'
#' @param postcodes Accepts a list of postcodes. Accepts up to 100 postcodes.
#' For only one postcode use \code{\link{postcode_lookup}}.
#'
#' @return A list.
#' @seealso \code{\link{postcode_lookup}} for documentation.
#'
#' @export
#'
#' @examples
#' \donttest{
#' pc_list <- list(
#' postcodes = c("PR3 0SG", "M45 6GN", "EX165BL")) # spaces are ignored
#' bulk_postcode_lookup(pc_list)
#' }
#'
bulk_postcode_lookup <- function(postcodes) {
  if (!is.list(postcodes))
    stop("Please provide a list with postcodes.")
  r <- POST("https://api.postcodes.io/postcodes",
            body = postcodes,
            encode = "json")
  extract_results(r)
}
