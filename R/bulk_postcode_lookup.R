#' Bulk postcode lookup
#'
#' Returns a list of matching postcodes and respective available data.
#'
#' @importFrom httr POST
#' @importFrom utils URLencode
#'
#' @param ... Postcodes provided as character strings/vectors, or a single
#'   argument of the form `list(postcodes = c(...))` for backward compatibility.
#'   Up to 100 postcodes are accepted per request.
#'
#' @return A list of length one.
#' @seealso \code{\link{postcode_lookup}} for single postcode lookups.
#'
#' @export
#'
#' @examples
#' \donttest{
#' # New usage: vectors or multiple arguments
#' bulk_postcode_lookup(c("PR3 0SG", "M45 6GN", "EX165BL"))
#' bulk_postcode_lookup("PR3 0SG", "M45 6GN", "EX165BL")
#'
#' # Old usage still supported
#' pc_list <- list(postcodes = c("PR3 0SG", "M45 6GN", "EX165BL"))
#' bulk_postcode_lookup(pc_list)
#' }
#'
bulk_postcode_lookup <- function(..., postcodes = NULL) {
  args <- list(...)

  # Resolve input into a simple character vector of postcodes
  if (!is.null(postcodes)) {
    pcs <- postcodes
  } else if (length(args) == 1 && is.list(args[[1]]) && !is.null(args[[1]]$postcodes)) {
    # preserve old signature: bulk_postcode_lookup(list(postcodes = c(...)))
    pcs <- args[[1]]$postcodes
  } else {
    # accept multiple arguments and/or multiple vectors
    pcs <- unlist(args, recursive = TRUE, use.names = FALSE)
  }

  pcs <- as.character(pcs)
  # normalize: remove all whitespace inside postcodes so "S7 1FL" -> "S71FL"
  pcs <- gsub("\\s+", "", pcs)
  # drop empty / NA entries
  pcs <- pcs[!is.na(pcs) & nzchar(pcs)]

  if (length(pcs) == 0) {
    stop("Please provide at least one postcode.", call. = FALSE)
  }

  # Respect API limit: postcodes.io accepts up to 100 postcodes per bulk request
  if (length(pcs) > 100) {
    warning("postcodes.io bulk endpoint supports a maximum of 100 postcodes per request; only the first 100 will be sent")
    pcs <- pcs[1:100]
  }

  body <- list(postcodes = pcs)

  # Reuse existing list-shape checks (expects a list)
  check_list_limit(body)

  body <- lapply(body, URLencode)

  r <- POST("https://api.postcodes.io/postcodes",
            body = body,
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
