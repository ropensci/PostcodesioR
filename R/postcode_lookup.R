#' Postcode lookup
#'
#' Lookup a postcode.
#'
#' @import httr
#'
#' @param postcode A string. Valid UK postcode.
#'
#' @export
#'
#' @return A data frame. Returns all available data if found. Returns 404 if postcode does not exist.
#'
#' @examples
#' postcode_lookup("EC1Y8LX")
#' postcode_lookup("EC1Y 8LX")
#'
postcode_lookup <- function(postcode) {
  if (!is.character(postcode) || nchar(postcode) < 2) {
    stop("Please provide a valid UK outcode.")
  }
  r <- GET(paste0("https://api.postcodes.io/postcodes/", postcode))
  warn_for_status(r)
  if (status_code(r) == 200) {
    r <- content(r)
    pc_result <- r[["result"]]
    take_names <- setdiff(names(pc_result), "codes")
    pc_result[sapply(pc_result, is.null)] <- list(NA)
    pc_df <- cbind(as.data.frame(pc_result[take_names],
                                 stringsAsFactors = FALSE),
                   as.data.frame(pc_result$codes,
                                 stringsAsFactors = FALSE))
    return(pc_df)
  }
}
