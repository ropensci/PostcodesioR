#' Place lookup
#'
#' Lookup a place by code. Returns all available data if found. Returns 404 if a place does not exist.
#'
#' @importFrom httr GET
#'
#' @param code A string. The unique identifier for places - Ordnance Survey (OSGB) code.
#'
#' @return A list with available places.
#'  * \code{code} A unique identifier that enables records to be identified easily.
#'  The identifier will be persistent for all LocalTypes
#'  except Section of Named Road and Section of Numbered Road.
#'  * \code{name_1} Name. The proper noun that applies to the real world entity.
#'  Names that are prefixed by the definite article are not formatted
#'  for alphabetical sorting, that is, 'The Pennines' not 'Pennines, The'.
#'  * \code{name_1_lang} Language of Name. The language type is only set
#'   where more than one name exists
#'   E.g. cym (Welsh), eng (English), gla (Scottish Gaelic).
#'  * \code{name_2} Name (in case of multiple languages).
#'  The proper noun that applies to the real world entity.
#'  Names that are prefixed by the definite article are not formatted for
#'  alphabetical sorting, that is, 'The Pennines' not 'Pennines, The'.
#'  * \code{name_2_lang} Language of Name. The language type is only set where more than one name exists
#'  E.g. cym (Welsh), eng (English), gla (Scottish Gaelic).
#'  * \code{local_type} The Ordnance Survey classification for the named place being represented
#'  by the specific feature. E.g. City, Town, Village, Hamlet, Other Settlement, Suburban Area
#'  * \code{outcode} The postcode district, for example, SO15.
#'  * \code{county_unitary} Administrative Area. The name of the County (non-metropolitan or Metropolitan),
#'  Unitary Authority or Greater London Authority administrative area that the point geometry
#'  for feature is within or nearest to.
#'  * \code{county_unitary_type} Administrative Area Type. Classifies the type of administrative unit.
#'  * \code{district_borough} District or Borough. The name of the District, Metropolitan District or
#'  London Borough administrative unit that the point geometry for the feature is within.
#'  * \code{district_borough_type} Borough Type. Classifies the type of administrative unit.
#'  * \code{region} The name of the European Region (was Government O ice Region)
#'  that the point geometry for the feature is within or nearest to.
#'  * \code{country} The country (i.e. one of the four constituent countries of the United Kingdom
#'  or the Channel Islands or the Isle of Man) to which each place is assigned.
#'  * \code{longitude} The WGS84 longitude given the Place's national grid reference.
#'  * \code{latitude} The WGS84 latitude given the Place's national grid reference.
#'  * \code{eastings} The Ordnance Survey postcode grid reference Easting to 1 metre resolution;
#'  blank for postcodes in the Channel Islands and the Isle of Man.
#'  * \code{northings} The Ordnance Survey postcode grid reference Northing to 1 metre resolution;
#'  blank for postcodes in the Channel Islands and the Isle of Man.
#'  * \code{min/max northings/eastings} Minimum and Maximum, Northings and Eastings.
#'  Bounding box or Minimum Bounding Rectangle (MBR) for roads and settlements.
#'  For Settlements and Sections of Named and Numbered Roads,
#'  the MBR gives a representation of the extent of these features and
#'  is not snapped to the real world extent.
#'
#' See \url{https://postcodes.io/docs} for more details.
#' @md
#'
#' @export
#'
#' @examples
#' \donttest{
#' place_lookup("osgb4000000074544700")
#' }
#'
place_lookup <- function(code) {
  if (!is.character(code) || nchar(code) < 2) {
    stop("Please provide a valid Ordnance Survey code.")
  }
  r <- GET(paste0("https://api.postcodes.io/places/", code))
  extract_results(r)
}
