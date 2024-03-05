#' Bulk postcode lookup
#'
#' Returns a list of matching postcodes and respective available data.
#'
#' @importFrom httr POST
#' @importFrom utils URLencode
#'
#' @param ... One or more vectors containing postcodes to look up. Up to 100 postcodes are accepted.
#' For only one postcode use \code{\link{postcode_lookup}}.
#'
#' @return A list
#' @seealso \code{\link{postcode_lookup}} for documentation.
#'
#' @export
#'
#' @examples
#' \donttest{
#' ## Postcodes can be provided as individual arguments
#' bulk_postcode_lookup("PR30SG", "M456GN", "EX165BL")
#' ## Or as one or more vectors:
#' bulk_postcode_lookup(c("PR30SG", "M456GN"), "EX165BL")
#' }
bulk_postcode_lookup <- function(...) {
  dots <- unlist(c(...), recursive = TRUE)
  postcodes <- list(postcodes = dots)
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
    stop("Please provide more than one postcode")
  count <- sum(sapply(x, length))
  if (count > 100)
    stop("Please provide fewer than 100 postcodes.")
}
