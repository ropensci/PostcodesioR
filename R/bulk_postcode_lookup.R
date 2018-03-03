#' Bulk postcode lookup
#'
#' Returns a list of matching postcodes and respective available data.
#'
#' @import httr
#'
#' @param postcodes Accepts a list of postcodes. Accepts up to 100 postcodes.
#'
#' @return A list.
#'
#' @export
#'
#' @examples
#' pc_list <- list(
#' postcodes = c("PR3 0SG", "M45 6GN", "EX165BL")) # spaces are ignored
#' bulk_postcode_lookup(pc_list)
#'
bulk_postcode_lookup <- function(postcodes) {
  if (!is.list(postcodes))
    stop("Please provide a list with postcodes.")
  r <- POST("https://api.postcodes.io/postcodes",
            body = postcodes,
            encode = "json")
  extract_results(r)
}
