#' Postcode lookup
#'
#' Lookup a postcode.
#'
#' @importFrom httr GET
#' @importFrom httr warn_for_status
#'
#' @param postcode A string. One valid UK postcode. This function is case- and space-insensitive.
#' For more than one postcode use \link[PostcodesioR]{bulk_postcode_lookup}.
#'
#' @export
#'
#' @return A data frame. Returns all available data if found. Returns 404 if postcode does not exist.
#'
#' @examples
#' postcode_lookup("EC1Y8LX")
#' postcode_lookup("EC1Y 8LX") # spaces are ignored
#'
postcode_lookup <- function(postcode) {
  if (!is.character(postcode) || nchar(postcode) < 2) {
    stop("Please provide a valid UK outcode.")
  }
  if (length(nchar(postcode)) > 1) {
    stop("This function accepts only one postcode, for multiple requests please use bulk_postcode_lookup().")
  }
  r <- GET(paste0("https://api.postcodes.io/postcodes/", postcode))
  warn_for_status(r)
  if (status_code(r) == 200) {
    r <- content(r)
    pc_result <- r[["result"]]
    take_names <- setdiff(names(pc_result), "codes")
    pc_codes <- as.data.frame(pc_result$codes, stringsAsFactors = FALSE)
    colnames(pc_codes) <- paste0(names(pc_codes), "_code")
    pc_result[sapply(pc_result, is.null)] <- list(NA)
    pc_df <- cbind(as.data.frame(pc_result[take_names],
                                 stringsAsFactors = FALSE),
                   pc_codes)
    return(pc_df)
  }
}
