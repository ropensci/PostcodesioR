#' Bulk postcode lookup
#'
#' Returns a list of matching postcodes and respective available data.
#'
#' @param postcodes Accepts a JSON object containing an array of postcodes. Accepts up to 100 postcodes.

bulk_postcode_lookup <- function(postcodes) {
  r <- POST(paste0("https://api.postcodes.io/postcodes?q=", postcodes))
  warn_for_status(r) # https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
  pc_content <- content(r)
  return(pc_content)
}
