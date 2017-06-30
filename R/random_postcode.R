#' Random postcode
#'
#' Returns a random postcode and all available data for that postcode.
#'
#' @import httr
#'
#' @param outcode A string. Filters random postcodes by outcode. Returns null if invalid outcode. Optional.
#'
#' @return A data frame with a random post code with corresponding characteristics.
#'
#' @export
#'
#' @examples
#' random_postcode()
#' random_postcode("N1")
#'
random_postcode <- function(outcode = NULL) {
  r <- GET("https://api.postcodes.io/random/postcodes",
           query = list(outcode = outcode))
  warn_for_status(r)
  r <- content(r)
  pc_result <- r[[2]]
  take_names <- setdiff(names(pc_result), 'codes')
  pc_result[sapply(pc_result, is.null)] = list(NA)
  pc_df <- cbind(as.data.frame(pc_result[take_names], stringsAsFactors = FALSE),
                 as.data.frame(pc_result$codes, stringsAsFactors = FALSE))
  return(pc_df)
}
