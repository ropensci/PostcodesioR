#' Bulk postcode lookup
#'
#' Returns a list of matching postcodes and respective available data.
#'
#' @param postcodes Accepts a list of postcodes. Accepts up to 100 postcodes.
#'
#' @examples
#' pc_list <- list(postcodes = c("PR3 0SG", "M45 6GN", "EX165BL"))
#' bulk_postcode_lookup(pc_list)

bulk_postcode_lookup <- function(postcodes) {
  # TODO check if postcodes is a list, if not transform into a list (preferably from a DF)
  r <- POST("https://api.postcodes.io/postcodes",
            body = postcodes,
            encode = "json")
  warn_for_status(r)
  pc_content <- content(r)
  return(pc_content)
}




