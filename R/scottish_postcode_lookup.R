#' Scottish postcode lookup
#'
#' Lookup a Scottish postcode.
#'
#' @importFrom httr GET
#' @importFrom httr warn_for_status
#' @importFrom utils URLencode
#'
#' @param postcode A string. One valid Scottish postcode.
#' This function is case- and space-insensitive.
#' For non-Scottish postcodes use \code{\link{postcode_lookup}}.
#' For more than one non-Scottish postcode use \code{\link{bulk_postcode_lookup}}.
#'
#' @export
#'
#' @return A data frame. Returns all available data if found. Returns NAs if postcode does not exist (404).
#'  * \code{postcode} Postcode. Royal Mail postcode.
#'  * \code{scottish_parliamentary_constituency} Scottish Parliamentary
#'  Constituency 2014 Scottish Parliamentary Constituency.
#'  * \code{scottish_parliamentary_constituency} Scottish Parliamentary
#'  Constituency GSS Code. A code that identifies a 2014 Scottish
#'  Parliamentary Constituency.
#'
#' See
#'   \url{https://postcodes.io/docs} for more details.
#' @md
#'
#' @examples
#' \donttest{
#' scottish_postcode_lookup("EH12NG")
#' }
scottish_postcode_lookup <- function(postcode) {
  postcode_error <- "Please provide a valid Scottish postcode."
  if (!is.character(postcode)) {
    stop(postcode_error)
  }
  if (nchar(postcode) < 2) {
    stop(postcode_error)
  }
  if (length(nchar(postcode)) > 1) {
    stop("This function accepts only one postcode. For multiple requests please use bulk_postcode_lookup().")
  }
  postcode <- URLencode(postcode)
  r <- GET(paste0("https://api.postcodes.io/scotland/postcodes/", postcode))
  warn_for_status(r)
  if (status_code(r) == 200) {
    r <- content(r)
    pc_result <- r[["result"]]
    take_names <- setdiff(names(pc_result), "codes")
    pc_codes <- as.data.frame(do.call(cbind, pc_result$codes), stringsAsFactors = FALSE)
    colnames(pc_codes) <- paste0(names(pc_codes), "_code")
    pc_result[sapply(pc_result, is.null)] <- list(NA)
    pc_df <- cbind(as.data.frame(pc_result[take_names],
                                 stringsAsFactors = FALSE),
                   pc_codes)
    return(pc_df)
  }
  # if error (404) return NAs
  if (status_code(r) == 404) {
    print(paste("Postcode", postcode, "is incorrect or expired."))
    pc_df <-
      structure(list(postcode = postcode,
                     scottish_parliamentary_constituency = NA,
                     scottish_parliamentary_constituency_code = NA),
                class = "data.frame", row.names = c(NA, -1L))
    return(pc_df)
  }
}
