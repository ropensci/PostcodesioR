#' @importFrom httr GET
#' @importFrom httr user_agent
#' @importFrom httr warn_for_status
#' @importFrom httr status_code
#' @importFrom httr content
ua <- httr::user_agent("http://github.com/erzk/PostcodesioR")

extract_results <- function(x) {
  httr::warn_for_status(x)

  if (httr::status_code(x) == 200) {
    return(httr::content(x)$result)
  }
}
