#' Postcode lookup
#'
#' Lookup a postcode.
#'
#' @importFrom httr GET
#' @importFrom httr warn_for_status
#'
#' @param postcode A string. One valid UK postcode. This function is case- and space-insensitive.
#' For more than one postcode use \code{\link{bulk_postcode_lookup}}.
#'
#' @export
#'
#' @return A data frame. Returns all available data if found. Returns 404 if postcode does not exist.
#'  * \code{postcode} Postcode. All current ('live') postcodes within the United Kingdom,
#'  the Channel Islands and the Isle of Man, received monthly from Royal Mail.
#'  2, 3 or 4-character outward code, single space and 3-character inward code.
#'  * \code{quality} Positional Quality. Shows the status of the assigned grid reference.
#'    * 1 - within the building of the matched address closest to the postcode mean
#'    * 2 - as for status value 1, except by visual inspection of Landline maps (Scotland only)
#'    * 3 - approximate to within 50m
#'    * 4 - postcode unit mean (mean of matched addresses with the same postcode, but not snapped to a building)
#'    * 5 - imputed by ONS, by reference to surrounding postcode grid references
#'    * 6 - postcode sector mean, (mainly PO Boxes)
#'    * 8 - postcode terminated prior to Gridlink(R) initiative, last known ONS postcode grid reference1
#'    * 9 - no grid reference available
#'  * \code{eastings} Eastings. The Ordnance Survey postcode grid reference
#'  Easting to 1 metre resolution; blank for postcodes in the
#'  Channel Islands and the Isle of Man.
#'  Grid references for postcodes in Northern Ireland relate to the Irish Grid system.
#'  * \code{northings} Northings. The Ordnance Survey postcode grid reference
#'  Easting to 1 metre resolution; blank for postcodes in the
#'  Channel Islands and the Isle of Man.
#'  Grid references for postcodes in Northern Ireland relate to the Irish Grid system.
#'  * \code{country} Country. The country (i.e. one of the four constituent
#'  countries of the United Kingdom or the Channel Islands or the Isle of Man)
#'  to which each postcode is assigned.
#'  * \code{nhs_ha} Strategic Health Authority. The health area code for the postcode.
#'  * \code{longitude} Longitude.
#'  The WGS84 longitude given the Postcode's national grid reference.
#'  * \code{latitude} Latitude.
#'  The WGS84 latitude given the Postcode's national grid reference.
#'  * \code{european_electoral_region} European Electoral Region (EER).
#'  The European Electoral Region code for each postcode.
#'  * \code{primary_care_trust} Primary Care Trust (PCT).
#'  The code for the Primary Care areas in England, LHBs in Wales, CHPs in Scotland,
#'  LCG in Northern Ireland and PHD in the Isle of Man;
#'  there are no equivalent areas in the Channel Islands.
#'  Care Trust/ Care Trust Plus (CT) / local health board (LHB) /
#'  community health partnership (CHP) / local commissioning group (LCG) /
#'  primary healthcare directorate (PHD).
#'  * \code{region} Region (formerly GOR). The Region code for each postcode.
#'  The nine GORs were abolished on 1 April 2011 and are now known as 'Regions'.
#'  They were the primary statistical subdivisions of England and
#'  also the areas in which the Government Offices for the Regions fulfilled their role.
#'  Each GOR covered a number of local authorities.
#'  * \code{lsoa} 2011 Census lower layer super output area (LSOA).
#'  The 2011 Census lower layer SOA code for England and Wales,
#'  SOA code for Northern Ireland and data zone code for Scotland.
#'  * \code{msoa} 2011 Census middle layer super output area (MSOA).
#'  The 2011 Census middle layer SOA (MSOA) code for England and
#'  Wales and intermediate zone for Scotland.
#'  * \code{incode} Incode. 3-character inward code that
#'  is following the space in the full postcode.
#'  * \code{outcode} Outcode. 2, 3 or 4-character outward code.
#'  The part of postcode before the space.
#'  * \code{parliamentary_constituency} Westminster Parliamentary Constituency.
#'  The Westminster Parliamentary Constituency code for each postcode.
#'  * \code{admin_district} District.
#'  The current district/unitary authority to which the postcode has been assigned.
#'  * \code{parish} Parish (England)/ community (Wales).
#'  The smallest type of administrative area in England is the parish
#'  (also known as 'civil parish'); the equivalent units in Wales are communities.
#'  * \code{admin_county} County. The current county to which the postcode has been assigned.
#'  * \code{admin_ward} Ward.
#'  The current administrative/electoral area to which the postcode has been assigned.
#'  * \code{ccg} Clinical Commissioning Group. Clinical commissioning groups (CCGs)
#'  are NHS organisations set up by the Health and Social Care Act 2012
#'  to organise the delivery of NHS services in England.
#'  * \code{nuts} Nomenclature of Units for Territorial Statistics (NUTS) /
#'  Local Administrative Units (LAU) areas.
#'  The LAU2 code for each postcode. NUTS is a hierarchical classification of
#'  spatial units that provides a breakdown of the European Union's
#'  territory for producing regional statistics which are comparable across
#'  the Union. The NUTS area classification in the United Kingdom
#'  comprises current national administrative and electoral areas,
#'  except in Scotland where some NUTS areas comprise whole and/or part
#'  Local Enterprise Regions. NUTS levels 1-3 are frozen for a minimum of
#'  three years and NUTS levels 4 and 5 are now
#'  Local Administrative Units (LAU) levels 1 and 2 respectively.
#'  * \code{_code} Returns an ID or Code associated with the postcode.
#'  Typically these are a 9 character code known as an ONS Code or GSS Code.
#'  This is currently only available for districts, parishes, counties, CCGs, NUTS and wards.
#'
#' See
#'   \url{https://postcodes.io/docs} for more details.
#' @md
#'
#' @examples
#' \donttest{
#' postcode_lookup("EC1Y8LX")
#' postcode_lookup("EC1Y 8LX") # spaces are ignored
#' }
#'
postcode_lookup <- function(postcode) {
  postcode_error <- "Please provide a valid UK postcode."
  if (!is.character(postcode)) {
    stop(postcode_error)
  }
  if (nchar(postcode) < 2) {
    stop(postcode_error)
  }
  if (length(nchar(postcode)) > 1) {
    stop("This function accepts only one postcode. For multiple requests please use bulk_postcode_lookup().")
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
