PostcodesioR
================

[![Travis-CI Build Status](https://travis-ci.org/erzk/PostcodesioR.svg?branch=master)](https://travis-ci.org/erzk/PostcodesioR) [![Coverage Status](https://img.shields.io/codecov/c/github/erzk/PostcodesioR/master.svg)](https://codecov.io/github/erzk/PostcodesioR?branch=master) [![Package-License](http://img.shields.io/badge/license-GPL--3-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/PostcodesioR)](https://cran.r-project.org/package=PostcodesioR)

An API wrapper around [postcodes.io](https://postcodes.io/) - free UK postcode lookup and geocoder.

Installation
------------

This package is still in a development version and is available only on GitHub. Not sure if it will ever make it to CRAN. In order to install it use the following commands:

``` r
if(!require("devtools")) {
  install.packages("devtools")
}
devtools::install_github("erzk/PostcodesioR")
```

Loading
-------

To start using the package use the standard command after you installed it.

``` r
library(PostcodesioR)
```

Examples
--------

Where possible, I tried to return a data frame. Unfortunately, a lot of API calls return more complex data and in those cases it is safer to use lists.

### Lookup postcodes and outcodes

#### Single postcode

Provide a postcode to obtain all available information:

``` r
lookup_result <- postcode_lookup("EC1Y8LX")

#overview
str(lookup_result)
```

    ## 'data.frame':    1 obs. of  29 variables:
    ##  $ postcode                  : chr "EC1Y 8LX"
    ##  $ quality                   : int 1
    ##  $ eastings                  : int 532544
    ##  $ northings                 : int 182128
    ##  $ country                   : chr "England"
    ##  $ nhs_ha                    : chr "London"
    ##  $ longitude                 : num -0.0909
    ##  $ latitude                  : num 51.5
    ##  $ european_electoral_region : chr "London"
    ##  $ primary_care_trust        : chr "Islington"
    ##  $ region                    : chr "London"
    ##  $ lsoa                      : chr "Islington 023D"
    ##  $ msoa                      : chr "Islington 023"
    ##  $ incode                    : chr "8LX"
    ##  $ outcode                   : chr "EC1Y"
    ##  $ parliamentary_constituency: chr "Islington South and Finsbury"
    ##  $ admin_district            : chr "Islington"
    ##  $ parish                    : chr "Islington, unparished area"
    ##  $ admin_county              : logi NA
    ##  $ admin_ward                : chr "Bunhill"
    ##  $ ccg                       : chr "NHS Islington"
    ##  $ nuts                      : chr "Haringey and Islington"
    ##  $ admin_district            : chr "E09000019"
    ##  $ admin_county              : chr "E99999999"
    ##  $ admin_ward                : chr "E05000367"
    ##  $ parish                    : chr "E43000209"
    ##  $ parliamentary_constituency: chr "E14000764"
    ##  $ ccg                       : chr "E38000088"
    ##  $ nuts                      : chr "UKI43"

#### Multiple postcodes

``` r
pc_list <- list(postcodes = c("PR3 0SG", "M45 6GN", "EX165BL"))
bulk_lookup_result <- bulk_postcode_lookup(pc_list)

#overview
str(bulk_lookup_result[1])
```

    ## List of 1
    ##  $ :List of 2
    ##   ..$ query : chr "PR3 0SG"
    ##   ..$ result:List of 23
    ##   .. ..$ postcode                  : chr "PR3 0SG"
    ##   .. ..$ quality                   : int 1
    ##   .. ..$ eastings                  : int 351012
    ##   .. ..$ northings                 : int 440302
    ##   .. ..$ country                   : chr "England"
    ##   .. ..$ nhs_ha                    : chr "North West"
    ##   .. ..$ longitude                 : num -2.75
    ##   .. ..$ latitude                  : num 53.9
    ##   .. ..$ european_electoral_region : chr "North West"
    ##   .. ..$ primary_care_trust        : chr "North Lancashire Teaching"
    ##   .. ..$ region                    : chr "North West"
    ##   .. ..$ lsoa                      : chr "Wyre 006A"
    ##   .. ..$ msoa                      : chr "Wyre 006"
    ##   .. ..$ incode                    : chr "0SG"
    ##   .. ..$ outcode                   : chr "PR3"
    ##   .. ..$ parliamentary_constituency: chr "Wyre and Preston North"
    ##   .. ..$ admin_district            : chr "Wyre"
    ##   .. ..$ parish                    : chr "Myerscough and Bilsborrow"
    ##   .. ..$ admin_county              : chr "Lancashire"
    ##   .. ..$ admin_ward                : chr "Brock with Catterall"
    ##   .. ..$ ccg                       : chr "NHS Morecambe Bay"
    ##   .. ..$ nuts                      : chr "Lancaster and Wyre"
    ##   .. ..$ codes                     :List of 7
    ##   .. .. ..$ admin_district            : chr "E07000128"
    ##   .. .. ..$ admin_county              : chr "E10000017"
    ##   .. .. ..$ admin_ward                : chr "E05009934"
    ##   .. .. ..$ parish                    : chr "E04005340"
    ##   .. .. ..$ parliamentary_constituency: chr "E14001057"
    ##   .. .. ..$ ccg                       : chr "E38000216"
    ##   .. .. ..$ nuts                      : chr "UKD44"

#### Outward code lookup

Provide an outcode to obtain geolocation data for the centroid of the specifid outcode:

``` r
ocl <- outward_code_lookup("E1")

#overview
str(ocl)
```

    ## List of 10
    ##  $ outcode       : chr "E1"
    ##  $ longitude     : num -0.0594
    ##  $ latitude      : num 51.5
    ##  $ northings     : int 181622
    ##  $ eastings      : int 534747
    ##  $ admin_district:List of 3
    ##   ..$ : chr "City of London"
    ##   ..$ : chr "Hackney"
    ##   ..$ : chr "Tower Hamlets"
    ##  $ parish        :List of 3
    ##   ..$ : chr "City of London, unparished area"
    ##   ..$ : chr "Hackney, unparished area"
    ##   ..$ : chr "Tower Hamlets, unparished area"
    ##  $ admin_county  : list()
    ##  $ admin_ward    :List of 13
    ##   ..$ : chr "Spitalfields & Banglatown"
    ##   ..$ : chr "Portsoken"
    ##   ..$ : chr "Tower"
    ##   ..$ : chr "St Dunstan's"
    ##   ..$ : chr "Aldgate"
    ##   ..$ : chr "Bishopsgate"
    ##   ..$ : chr "Hoxton East & Shoreditch"
    ##   ..$ : chr "Whitechapel"
    ##   ..$ : chr "Bethnal Green"
    ##   ..$ : chr "Shadwell"
    ##   ..$ : chr "Stepney Green"
    ##   ..$ : chr "St Peter's"
    ##   ..$ : chr "Weavers"
    ##  $ country       :List of 1
    ##   ..$ : chr "England"

### Reverse geocoding

Provide latitude and longitude to obtain geographic information. Different levels of aggregation are available, i.e. postcode or outcode.

#### Single postcode

``` r
rev_geo <- reverse_geocoding(0.127, 51.507)

# overview
str(rev_geo[1])
```

    ## List of 1
    ##  $ :List of 24
    ##   ..$ postcode                  : chr "SE28 8NH"
    ##   ..$ quality                   : int 1
    ##   ..$ eastings                  : int 547715
    ##   ..$ northings                 : int 180780
    ##   ..$ country                   : chr "England"
    ##   ..$ nhs_ha                    : chr "London"
    ##   ..$ longitude                 : num 0.127
    ##   ..$ latitude                  : num 51.5
    ##   ..$ european_electoral_region : chr "London"
    ##   ..$ primary_care_trust        : chr "Bexley"
    ##   ..$ region                    : chr "London"
    ##   ..$ lsoa                      : chr "Bexley 001D"
    ##   ..$ msoa                      : chr "Bexley 001"
    ##   ..$ incode                    : chr "8NH"
    ##   ..$ outcode                   : chr "SE28"
    ##   ..$ distance                  : num 38.9
    ##   ..$ parliamentary_constituency: chr "Erith and Thamesmead"
    ##   ..$ admin_district            : chr "Bexley"
    ##   ..$ parish                    : chr "Bexley, unparished area"
    ##   ..$ admin_county              : NULL
    ##   ..$ admin_ward                : chr "Thamesmead East"
    ##   ..$ ccg                       : chr "NHS Bexley"
    ##   ..$ nuts                      : chr "Bexley and Greenwich"
    ##   ..$ codes                     :List of 7
    ##   .. ..$ admin_district            : chr "E09000004"
    ##   .. ..$ admin_county              : chr "E99999999"
    ##   .. ..$ admin_ward                : chr "E05000084"
    ##   .. ..$ parish                    : chr "E43000194"
    ##   .. ..$ parliamentary_constituency: chr "E14000696"
    ##   .. ..$ ccg                       : chr "E38000011"
    ##   .. ..$ nuts                      : chr "UKI51"

#### Multiple postcodes

To reverse geocode multiple values use the function underneath. The result is a nested list, which might be a bit intimidating, but it allows storing unequal lengths of elements.

``` r
# create a JSON object with the coordinates
geolocations_list <- structure(
 list(
 geolocations = structure(
 list(
 longitude = c(-3.15807731271522, -1.12935802905177),
 latitude = c(51.4799900627036, 50.7186356978817),
 limit = c(NA, 100L),
 radius = c(NA, 500L)),
 .Names = c("longitude", "latitude", "limit", "radius"),
 class = "data.frame",
 row.names = 1:2)),
 .Names = "geolocations")

bulk_rev_geo <- bulk_reverse_geocoding(geolocations_list)

bulk_rev_geo[[1]]$result[[1]]
```

    ## $postcode
    ## [1] "CF24 2BT"
    ## 
    ## $quality
    ## [1] 1
    ## 
    ## $eastings
    ## [1] 319675
    ## 
    ## $northings
    ## [1] 176305
    ## 
    ## $country
    ## [1] "Wales"
    ## 
    ## $nhs_ha
    ## [1] "Cardiff and Vale University Health Board"
    ## 
    ## $longitude
    ## [1] -3.158077
    ## 
    ## $latitude
    ## [1] 51.47998
    ## 
    ## $european_electoral_region
    ## [1] "Wales"
    ## 
    ## $primary_care_trust
    ## [1] "Cardiff and Vale University Health Board"
    ## 
    ## $region
    ## NULL
    ## 
    ## $lsoa
    ## [1] "Cardiff 038D"
    ## 
    ## $msoa
    ## [1] "Cardiff 038"
    ## 
    ## $incode
    ## [1] "2BT"
    ## 
    ## $outcode
    ## [1] "CF24"
    ## 
    ## $distance
    ## [1] 2.639788
    ## 
    ## $parliamentary_constituency
    ## [1] "Cardiff South and Penarth"
    ## 
    ## $admin_district
    ## [1] "Cardiff"
    ## 
    ## $parish
    ## [1] "Splott"
    ## 
    ## $admin_county
    ## NULL
    ## 
    ## $admin_ward
    ## [1] "Splott"
    ## 
    ## $ccg
    ## [1] "Cardiff and Vale University Health Board"
    ## 
    ## $nuts
    ## [1] "Cardiff and Vale of Glamorgan"
    ## 
    ## $codes
    ## $codes$admin_district
    ## [1] "W06000015"
    ## 
    ## $codes$admin_county
    ## [1] "W99999999"
    ## 
    ## $codes$admin_ward
    ## [1] "W05000879"
    ## 
    ## $codes$parish
    ## [1] "W04000863"
    ## 
    ## $codes$parliamentary_constituency
    ## [1] "W07000080"
    ## 
    ## $codes$ccg
    ## [1] "W11000029"
    ## 
    ## $codes$nuts
    ## [1] "UKL22"

Common usage of this function might be extracting particular variables. You can extract one variable like this:

``` r
# extract one postcode
bulk_rev_geo[[1]]$result[[8]]$postcode
```

    ## [1] "CF24 2AL"

But more likely you will want more than one result. After all, that's the point of using a bulk function:

``` r
# function to extract variables of interest
extract_bulk_geo_variable <- function(x) {
  bulk_results <- lapply(bulk_rev_geo, `[[`, "result")
  sapply(unlist(bulk_results, recursive = FALSE), `[[`, x)
}

# define the variables you need
variables_of_interest <- c("postcode", "latitude", "longitude")

# return a data frame with the variables
data.frame(
  sapply(variables_of_interest, extract_bulk_geo_variable))
```

    ##    postcode         latitude         longitude
    ## 1  CF24 2BT 51.4799810730482 -3.15807708496285
    ## 2  CF24 2ED 51.4796962780375 -3.15868908771903
    ## 3  CF24 2AA  51.480214120738 -3.15906222875833
    ## 4  CF24 5NW 51.4793656523229 -3.15847910268578
    ## 5  CF24 2AJ  51.480686989214 -3.15852699155627
    ## 6  CF24 2AH 51.4805572928224 -3.15891252296984
    ## 7  CF24 2DZ 51.4801105864152 -3.15679871749552
    ## 8  CF24 2AL 51.4808346636567 -3.15814191348464
    ## 9  PO33 1PS 50.7188151075122 -1.12929804319882
    ## 10 PO33 1PT 50.7185750818924 -1.12846672060095
    ## 11 PO33 1QB 50.7170474559076 -1.12982656563728
    ## 12 PO33 1PX 50.7178907506146 -1.12714786456114
    ## 13 PO33 1QD 50.7172032703058 -1.12781222816285
    ## 14 PO33 1PU 50.7184669311199  -1.1260322523645
    ## 15 PO33 1PZ 50.7162328095008 -1.12791522396325
    ## 16 PO33 1QR 50.7157418306918 -1.12599793035477
    ## 17 PO33 1PB 50.7210243159623 -1.13371950415272
    ## 18 PO33 1PR  50.721487986434  -1.1331867990148
    ## 19 PO33 1PY 50.7151718843021 -1.12674508376803
    ## 20 PO33 1QP 50.7155625975698 -1.12488225387235
    ## 21 PO34 5AP 50.7214660528318 -1.12423400885574

#### Single outcode

``` r
out_rev_geocode <- outcode_reverse_geocoding("-3.15", "51.47")
# overview
str(out_rev_geocode[1])
```

    ## List of 1
    ##  $ :List of 11
    ##   ..$ outcode       : chr "CF99"
    ##   ..$ longitude     : num -3.16
    ##   ..$ latitude      : num 51.5
    ##   ..$ northings     : int 174588
    ##   ..$ eastings      : int 319421
    ##   ..$ admin_district:List of 1
    ##   .. ..$ : chr "Cardiff"
    ##   ..$ parish        :List of 1
    ##   .. ..$ : chr "Butetown"
    ##   ..$ admin_county  : list()
    ##   ..$ admin_ward    :List of 1
    ##   .. ..$ : chr "Butetown"
    ##   ..$ country       :List of 1
    ##   .. ..$ : chr "Wales"
    ##   ..$ distance      : num 997

### Generate random entries

#### Postcodes

Generates a list with a random UK postcode and corresponding geographic information:

``` r
# without restrictions
random_postcode()
```

    ## $postcode
    ## [1] "BN2 5RF"
    ## 
    ## $quality
    ## [1] 1
    ## 
    ## $eastings
    ## [1] 533928
    ## 
    ## $northings
    ## [1] 103529
    ## 
    ## $country
    ## [1] "England"
    ## 
    ## $nhs_ha
    ## [1] "South East Coast"
    ## 
    ## $longitude
    ## [1] -0.1002369
    ## 
    ## $latitude
    ## [1] 50.81583
    ## 
    ## $european_electoral_region
    ## [1] "South East"
    ## 
    ## $primary_care_trust
    ## [1] "Brighton and Hove City"
    ## 
    ## $region
    ## [1] "South East"
    ## 
    ## $lsoa
    ## [1] "Brighton and Hove 032D"
    ## 
    ## $msoa
    ## [1] "Brighton and Hove 032"
    ## 
    ## $incode
    ## [1] "5RF"
    ## 
    ## $outcode
    ## [1] "BN2"
    ## 
    ## $parliamentary_constituency
    ## [1] "Brighton, Kemptown"
    ## 
    ## $admin_district
    ## [1] "Brighton and Hove"
    ## 
    ## $parish
    ## [1] "Brighton and Hove, unparished area"
    ## 
    ## $admin_county
    ## NULL
    ## 
    ## $admin_ward
    ## [1] "Rottingdean Coastal"
    ## 
    ## $ccg
    ## [1] "NHS Brighton and Hove"
    ## 
    ## $nuts
    ## [1] "Brighton and Hove"
    ## 
    ## $codes
    ## $codes$admin_district
    ## [1] "E06000043"
    ## 
    ## $codes$admin_county
    ## [1] "E99999999"
    ## 
    ## $codes$admin_ward
    ## [1] "E05002433"
    ## 
    ## $codes$parish
    ## [1] "E43000034"
    ## 
    ## $codes$parliamentary_constituency
    ## [1] "E14000597"
    ## 
    ## $codes$ccg
    ## [1] "E38000021"
    ## 
    ## $codes$nuts
    ## [1] "UKJ21"

A randomly generated postcode can also belong to a particular outcode:

``` r
# restrict to an outcode
random_postcode("N1")
```

    ## $postcode
    ## [1] "N1 3EA"
    ## 
    ## $quality
    ## [1] 1
    ## 
    ## $eastings
    ## [1] 532544
    ## 
    ## $northings
    ## [1] 183964
    ## 
    ## $country
    ## [1] "England"
    ## 
    ## $nhs_ha
    ## [1] "London"
    ## 
    ## $longitude
    ## [1] -0.09023201
    ## 
    ## $latitude
    ## [1] 51.53902
    ## 
    ## $european_electoral_region
    ## [1] "London"
    ## 
    ## $primary_care_trust
    ## [1] "Islington"
    ## 
    ## $region
    ## [1] "London"
    ## 
    ## $lsoa
    ## [1] "Islington 018A"
    ## 
    ## $msoa
    ## [1] "Islington 018"
    ## 
    ## $incode
    ## [1] "3EA"
    ## 
    ## $outcode
    ## [1] "N1"
    ## 
    ## $parliamentary_constituency
    ## [1] "Islington South and Finsbury"
    ## 
    ## $admin_district
    ## [1] "Islington"
    ## 
    ## $parish
    ## [1] "Islington, unparished area"
    ## 
    ## $admin_county
    ## NULL
    ## 
    ## $admin_ward
    ## [1] "Canonbury"
    ## 
    ## $ccg
    ## [1] "NHS Islington"
    ## 
    ## $nuts
    ## [1] "Haringey and Islington"
    ## 
    ## $codes
    ## $codes$admin_district
    ## [1] "E09000019"
    ## 
    ## $codes$admin_county
    ## [1] "E99999999"
    ## 
    ## $codes$admin_ward
    ## [1] "E05000369"
    ## 
    ## $codes$parish
    ## [1] "E43000209"
    ## 
    ## $codes$parliamentary_constituency
    ## [1] "E14000764"
    ## 
    ## $codes$ccg
    ## [1] "E38000088"
    ## 
    ## $codes$nuts
    ## [1] "UKI43"

#### Places

You can also generate a random place, specified by an OSGB code, with corresponding geographic information:

``` r
random_place()
```

    ##                   code name_1 name_1_lang name_2 name_2_lang
    ## 1 osgb4000000074573758  Achow        NULL   NULL        NULL
    ##         local_type outcode county_unitary county_unitary_type
    ## 1 Other Settlement     KW3       Highland    UnitaryAuthority
    ##   district_borough district_borough_type   region  country longitude
    ## 1             NULL                  NULL Scotland Scotland -3.315512
    ##   latitude eastings northings min_eastings min_northings max_eastings
    ## 1 58.31298   323021    936798       322699        936328       323303
    ##   max_northings
    ## 1        937318

### Postcode validation

This function can validate a UK postcode:

``` r
postcode_validation("EC1Y 8LX") # actual UK postcode
```

    ## [1] TRUE

``` r
postcode_validation("XYZ") # incorrect UK postcode
```

    ## [1] FALSE

### Find nearest postcodes or outcodes

Provide a postcode to get a list of the nearest postcodes:

``` r
near_pc <- nearest_postcode("EC1Y 8LX")

#overview
str(near_pc[1])
```

    ## List of 1
    ##  $ :List of 24
    ##   ..$ postcode                  : chr "EC1Y 8LX"
    ##   ..$ quality                   : int 1
    ##   ..$ eastings                  : int 532544
    ##   ..$ northings                 : int 182128
    ##   ..$ country                   : chr "England"
    ##   ..$ nhs_ha                    : chr "London"
    ##   ..$ longitude                 : num -0.0909
    ##   ..$ latitude                  : num 51.5
    ##   ..$ european_electoral_region : chr "London"
    ##   ..$ primary_care_trust        : chr "Islington"
    ##   ..$ region                    : chr "London"
    ##   ..$ lsoa                      : chr "Islington 023D"
    ##   ..$ msoa                      : chr "Islington 023"
    ##   ..$ incode                    : chr "8LX"
    ##   ..$ outcode                   : chr "EC1Y"
    ##   ..$ distance                  : int 0
    ##   ..$ parliamentary_constituency: chr "Islington South and Finsbury"
    ##   ..$ admin_district            : chr "Islington"
    ##   ..$ parish                    : chr "Islington, unparished area"
    ##   ..$ admin_county              : NULL
    ##   ..$ admin_ward                : chr "Bunhill"
    ##   ..$ ccg                       : chr "NHS Islington"
    ##   ..$ nuts                      : chr "Haringey and Islington"
    ##   ..$ codes                     :List of 7
    ##   .. ..$ admin_district            : chr "E09000019"
    ##   .. ..$ admin_county              : chr "E99999999"
    ##   .. ..$ admin_ward                : chr "E05000367"
    ##   .. ..$ parish                    : chr "E43000209"
    ##   .. ..$ parliamentary_constituency: chr "E14000764"
    ##   .. ..$ ccg                       : chr "E38000088"
    ##   .. ..$ nuts                      : chr "UKI43"

You can also use outcodes:

``` r
near_outcode <- nearest_outcode("EC1Y")

# overview
str(near_outcode[2])
```

    ## List of 1
    ##  $ :List of 11
    ##   ..$ outcode       : chr "EC2Y"
    ##   ..$ longitude     : num -0.0938
    ##   ..$ latitude      : num 51.5
    ##   ..$ northings     : int 181787
    ##   ..$ eastings      : int 532350
    ##   ..$ admin_district:List of 2
    ##   .. ..$ : chr "City of London"
    ##   .. ..$ : chr "Islington"
    ##   ..$ parish        :List of 2
    ##   .. ..$ : chr "Islington, unparished area"
    ##   .. ..$ : chr "City of London, unparished area"
    ##   ..$ admin_county  : list()
    ##   ..$ admin_ward    :List of 6
    ##   .. ..$ : chr "Bassishaw"
    ##   .. ..$ : chr "Coleman Street"
    ##   .. ..$ : chr "Clerkenwell"
    ##   .. ..$ : chr "Bunhill"
    ##   .. ..$ : chr "Cripplegate"
    ##   .. ..$ : chr "Aldersgate"
    ##   ..$ country       :List of 1
    ##   .. ..$ : chr "England"
    ##   ..$ distance      : num 400

Or longitude and latitude

``` r
near_ll <- nearest_outcode_lonlat(0.127, 51.507)

#overview
str(near_ll[1])
```

    ## List of 1
    ##  $ :List of 11
    ##   ..$ outcode       : chr "SE28"
    ##   ..$ longitude     : num 0.105
    ##   ..$ latitude      : num 51.5
    ##   ..$ northings     : int 180253
    ##   ..$ eastings      : int 546165
    ##   ..$ admin_district:List of 2
    ##   .. ..$ : chr "Bexley"
    ##   .. ..$ : chr "Greenwich"
    ##   ..$ parish        :List of 2
    ##   .. ..$ : chr "Greenwich, unparished area"
    ##   .. ..$ : chr "Bexley, unparished area"
    ##   ..$ admin_county  : list()
    ##   ..$ admin_ward    :List of 4
    ##   .. ..$ : chr "Thamesmead Moorings"
    ##   .. ..$ : chr "Glyndon"
    ##   .. ..$ : chr "Thamesmead East"
    ##   .. ..$ : chr "Plumstead"
    ##   ..$ country       :List of 1
    ##   .. ..$ : chr "England"
    ##   ..$ distance      : num 1646

### Find places

Provide a name of a place of interest. You can specify the number of results (default is 10):

``` r
place_query_result <- place_query("Hills", limit = 11)

# overview
str(place_query_result[1])
```

    ## List of 1
    ##  $ :List of 21
    ##   ..$ code                 : chr "osgb4000000074574731"
    ##   ..$ name_1               : chr "Berwick Hills"
    ##   ..$ name_1_lang          : NULL
    ##   ..$ name_2               : NULL
    ##   ..$ name_2_lang          : NULL
    ##   ..$ local_type           : chr "Suburban Area"
    ##   ..$ outcode              : chr "TS3"
    ##   ..$ county_unitary       : chr "Middlesbrough"
    ##   ..$ county_unitary_type  : chr "UnitaryAuthority"
    ##   ..$ district_borough     : NULL
    ##   ..$ district_borough_type: NULL
    ##   ..$ region               : chr "North East"
    ##   ..$ country              : chr "England"
    ##   ..$ longitude            : num -1.21
    ##   ..$ latitude             : num 54.6
    ##   ..$ eastings             : int 451459
    ##   ..$ northings            : int 518602
    ##   ..$ min_eastings         : int 450839
    ##   ..$ min_northings        : int 517640
    ##   ..$ max_eastings         : int 451968
    ##   ..$ max_northings        : int 519361

You can also find a place using an OSGB code:

``` r
place_lookup_result <- place_lookup("osgb4000000074544700")

# overview
str(place_lookup_result)
```

    ## List of 21
    ##  $ code                 : chr "osgb4000000074544700"
    ##  $ name_1               : chr "Cutler Heights"
    ##  $ name_1_lang          : NULL
    ##  $ name_2               : NULL
    ##  $ name_2_lang          : NULL
    ##  $ local_type           : chr "Suburban Area"
    ##  $ outcode              : chr "BD4"
    ##  $ county_unitary       : NULL
    ##  $ county_unitary_type  : NULL
    ##  $ district_borough     : chr "Bradford"
    ##  $ district_borough_type: chr "MetropolitanDistrict"
    ##  $ region               : chr "Yorkshire and the Humber"
    ##  $ country              : chr "England"
    ##  $ longitude            : num -1.72
    ##  $ latitude             : num 53.8
    ##  $ eastings             : int 418830
    ##  $ northings            : int 431785
    ##  $ min_eastings         : int 418487
    ##  $ min_northings        : int 431541
    ##  $ max_eastings         : int 419039
    ##  $ max_northings        : int 432041

### Terminated postcodes

You might end up having terminated postcodes in your data set. If you need more information about when a particular postcode was terminated use:

``` r
terminated_postcode("E1W 1UU")
```

    ##   postcode year_terminated month_terminated
    ## 1  E1W 1UU            2015                2

Notes
-----

Currently, there is a limit to the number of API calls that can be made. However, [postcodes.io](https://postcodes.io/) provides full list of geolocation data that can be used locally without limitations. The original data is sourced from [Office for National Statistics Data Portal](https://geoportal.statistics.gov.uk/geoportal/catalog/main/home.page). That [file](https://github.com/ideal-postcodes/postcodes.io/blob/master/latest) is rather large so I didn't include it in the package.

For more info see the original [documentation](https://postcodes.io/docs).

Go to the package's [website](https://erzk.github.io/PostcodesioR/) or to my [blog](https://walczak.org/tag/postcodesior/) for more examples.
