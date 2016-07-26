# TEST
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

# warn_for_status(r) # https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html

long <- "-3.15807731271522"
lat <- "51.4799900627036"

# write functions for each call http://postcodes.io/docs
library(httr)

post_example <- "EC1Y8LX"

# postcode lookup - returning a DF - WORKING - DO NOT DELETE:

postcode_lookup <- function(postcode) {
  r <- GET(paste0("https://api.postcodes.io/postcodes/", postcode))
  warn_for_status(r) # https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
  pc_content <- content(r)
  pc_result <- pc_content[[2]]
  take_names <- setdiff(names(pc_result), 'codes')
  pc_result[sapply(pc_result, is.null)] = list(NA)
  pc_result_df = cbind(as.data.frame(pc_result[take_names]),
                       as.data.frame(pc_result$codes))
  return(pc_result_df)
}

#########

bulk_postcode_lookup <- function(postcodes) {
  r <- POST(paste0("https://api.postcodes.io/postcodes?q=", postcodes))
  warn_for_status(r) # https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
  pc_content <- content(r)
  return(pc_content)
}

library(jsonlite)
library(xml2) # without installing it the function returns error
into_json <- c("PR3 0SG", "M45 6GN", "EX165BL")
json <- toJSON(into_json, pretty = TRUE)

