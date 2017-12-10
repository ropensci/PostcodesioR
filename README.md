PostcodesioR
================

[![Travis-CI Build Status](https://travis-ci.org/erzk/PostcodesioR.svg?branch=master)](https://travis-ci.org/erzk/PostcodesioR) [![Coverage Status](https://img.shields.io/codecov/c/github/erzk/PostcodesioR/master.svg)](https://codecov.io/github/erzk/PostcodesioR?branch=master) [![Package-License](http://img.shields.io/badge/license-GPL--3-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/PostcodesioR)](https://cran.r-project.org/package=PostcodesioR)

An API wrapper around [postcodes.io](https://postcodes.io/) - free UK postcode lookup and geocoder.

Installation
------------

This package is still in a development version and is available only on GitHub. Not sure if it will ever make it to CRAN. In order to install it use the following commands:

``` r
if (!require("devtools")) install.packages("devtools")
devtools::install_github("erzk/PostcodesioR")
```

Loading
-------

To start using the package use the standard command after you installed it.

``` r
library(PostcodesioR)
```

    ## Loading required package: httr

Examples
--------

### Lookup postcodes and outcodes

#### Single postcode

Provide a postcode to obtain all available information:

``` r
# load the package
library(PostcodesioR)

lookup_result <- postcode_lookup("EC1Y8LX")

#overview
str(lookup_result)
```

    ## List of 2
    ##  $ status: int 200
    ##  $ result:List of 23
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

#### Multiple postcodes

``` r
pc_list <- list(postcodes = c("PR3 0SG", "M45 6GN", "EX165BL"))
bulk_lookup_result <- bulk_postcode_lookup(pc_list)

#overview
str(bulk_lookup_result$result[1])
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

    ## List of 2
    ##  $ status: int 200
    ##  $ result:List of 10
    ##   ..$ outcode       : chr "E1"
    ##   ..$ longitude     : num -0.0593
    ##   ..$ latitude      : num 51.5
    ##   ..$ northings     : int 181623
    ##   ..$ eastings      : int 534749
    ##   ..$ admin_district:List of 3
    ##   .. ..$ : chr "City of London"
    ##   .. ..$ : chr "Hackney"
    ##   .. ..$ : chr "Tower Hamlets"
    ##   ..$ parish        :List of 3
    ##   .. ..$ : chr "City of London, unparished area"
    ##   .. ..$ : chr "Hackney, unparished area"
    ##   .. ..$ : chr "Tower Hamlets, unparished area"
    ##   ..$ admin_county  : list()
    ##   ..$ admin_ward    :List of 13
    ##   .. ..$ : chr "Spitalfields & Banglatown"
    ##   .. ..$ : chr "Portsoken"
    ##   .. ..$ : chr "Tower"
    ##   .. ..$ : chr "St Dunstan's"
    ##   .. ..$ : chr "Aldgate"
    ##   .. ..$ : chr "Bishopsgate"
    ##   .. ..$ : chr "Hoxton East & Shoreditch"
    ##   .. ..$ : chr "Whitechapel"
    ##   .. ..$ : chr "Bethnal Green"
    ##   .. ..$ : chr "Shadwell"
    ##   .. ..$ : chr "Stepney Green"
    ##   .. ..$ : chr "St Peter's"
    ##   .. ..$ : chr "Weavers"
    ##   ..$ country       :List of 1
    ##   .. ..$ : chr "England"

### Reverse geocoding

Provide latitude and longitude to obtain geographic information. Different levels of aggregation are available, i.e. postcode or outcode.

#### Single postcode

``` r
rev_geo <- reverse_geocoding(0.127, 51.507)

# overview
str(rev_geo$result[1])
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

bulk_rev_geo$result[[1]]$result[[1]]
```

    ## $postcode
    ## [1] "PO33 1PS"
    ## 
    ## $quality
    ## [1] 1
    ## 
    ## $eastings
    ## [1] 461563
    ## 
    ## $northings
    ## [1] 91382
    ## 
    ## $country
    ## [1] "England"
    ## 
    ## $nhs_ha
    ## [1] "South Central"
    ## 
    ## $longitude
    ## [1] -1.129298
    ## 
    ## $latitude
    ## [1] 50.71882
    ## 
    ## $european_electoral_region
    ## [1] "South East"
    ## 
    ## $primary_care_trust
    ## [1] "Isle of Wight National Health Service"
    ## 
    ## $region
    ## [1] "South East"
    ## 
    ## $lsoa
    ## [1] "Isle of Wight 010D"
    ## 
    ## $msoa
    ## [1] "Isle of Wight 010"
    ## 
    ## $incode
    ## [1] "1PS"
    ## 
    ## $outcode
    ## [1] "PO33"
    ## 
    ## $distance
    ## [1] 24.989
    ## 
    ## $parliamentary_constituency
    ## [1] "Isle of Wight"
    ## 
    ## $admin_district
    ## [1] "Isle of Wight"
    ## 
    ## $parish
    ## [1] "Nettlestone and Seaview"
    ## 
    ## $admin_county
    ## NULL
    ## 
    ## $admin_ward
    ## [1] "Nettlestone and Seaview"
    ## 
    ## $ccg
    ## [1] "NHS Isle of Wight"
    ## 
    ## $nuts
    ## [1] "Isle of Wight"
    ## 
    ## $codes
    ## $codes$admin_district
    ## [1] "E06000046"
    ## 
    ## $codes$admin_county
    ## [1] "E99999999"
    ## 
    ## $codes$admin_ward
    ## [1] "E05008496"
    ## 
    ## $codes$parish
    ## [1] "E04001306"
    ## 
    ## $codes$parliamentary_constituency
    ## [1] "E14000762"
    ## 
    ## $codes$ccg
    ## [1] "E38000087"
    ## 
    ## $codes$nuts
    ## [1] "UKJ34"

Common usage of this function might be extracting particular variables. You can extract one variable like this:

``` r
# extract one postcode
bulk_rev_geo$result[[1]]$result[[8]]$postcode
```

    ## [1] "PO33 1QR"

But more likely you will want more than one result. After all, that's the point of using a bulk function:

``` r
# function to extract variables of interest
extract_bulk_geo_variable <- function(x) {
  bulk_results <- lapply(bulk_rev_geo$result, `[[`, "result")
  sapply(unlist(bulk_results, recursive = FALSE), `[[`, x)
}

# define the variables you need
variables_of_interest <- c("postcode", "latitude", "longitude")

# return a data frame with the variables
data.frame(
  sapply(variables_of_interest, extract_bulk_geo_variable))
```

    ##    postcode         latitude         longitude
    ## 1  PO33 1PS 50.7188151075122 -1.12929804319882
    ## 2  PO33 1PT 50.7185750818924 -1.12846672060095
    ## 3  PO33 1QB 50.7170474559076 -1.12982656563728
    ## 4  PO33 1PX 50.7178907506146 -1.12714786456114
    ## 5  PO33 1QD 50.7172032703058 -1.12781222816285
    ## 6  PO33 1PU 50.7184669311199  -1.1260322523645
    ## 7  PO33 1PZ 50.7162328095008 -1.12791522396325
    ## 8  PO33 1QR 50.7157418306917 -1.12599793035477
    ## 9  PO33 1PB 50.7210243159623 -1.13371950415272
    ## 10 PO33 1PR  50.721487986434  -1.1331867990148
    ## 11 PO33 1PY 50.7151718843021 -1.12674508376803
    ## 12 PO33 1QP 50.7155625975698 -1.12488225387235
    ## 13 PO34 5AP 50.7214660528318 -1.12423400885574
    ## 14 CF24 2BT 51.4799810730482 -3.15807708496285
    ## 15 CF24 2ED 51.4796962780375 -3.15868908771903
    ## 16 CF24 2AA  51.480214120738 -3.15906222875833
    ## 17 CF24 5NW 51.4793656523229 -3.15847910268578
    ## 18 CF24 2AJ  51.480686989214 -3.15852699155627
    ## 19 CF24 2AH 51.4805572928224 -3.15891252296984
    ## 20 CF24 2DZ 51.4801105864152 -3.15679871749552
    ## 21 CF24 2AL 51.4808346636567 -3.15814191348464

#### Single outcode

``` r
out_rev_geocode <- outcode_reverse_geocoding("-3.15", "51.47")
# overview
str(out_rev_geocode$result[1])
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

Generates a data frame with a random UK postcode and corresponding geographic information:

``` r
# without restrictions
random_postcode()
```

    ##   postcode quality eastings northings  country  nhs_ha longitude latitude
    ## 1 EH49 6EJ       1   299253    676222 Scotland Lothian -3.615662  55.9684
    ##   european_electoral_region
    ## 1                  Scotland
    ##                                   primary_care_trust region
    ## 1 West Lothian Community Health and Care Partnership     NA
    ##                    lsoa             msoa incode outcode
    ## 1 Linlithgow South - 03 Linlithgow South    6EJ    EH49
    ##    parliamentary_constituency admin_district            parish
    ## 1 Linlithgow and East Falkirk   West Lothian (pseudo) Scotland
    ##   admin_county admin_ward
    ## 1           NA Linlithgow
    ##                                                  ccg         nuts
    ## 1 West Lothian Community Health and Care Partnership West Lothian
    ##   admin_district admin_county admin_ward    parish
    ## 1      S12000040    S99999999  S13002820 S99999999
    ##   parliamentary_constituency       ccg  nuts
    ## 1                  S14000043 S03000035 UKM28

A randomly generated postcode can also belong to a particular outcode:

``` r
# restrict to an outcode
random_postcode("N1")
```

    ##   postcode quality eastings northings country nhs_ha   longitude latitude
    ## 1   N1 5BU       1   532989    184120 England London -0.08376049 51.54032
    ##   european_electoral_region        primary_care_trust region         lsoa
    ## 1                    London City and Hackney Teaching London Hackney 025A
    ##          msoa incode outcode   parliamentary_constituency admin_district
    ## 1 Hackney 025    5BU      N1 Hackney South and Shoreditch        Hackney
    ##                     parish admin_county  admin_ward                  ccg
    ## 1 Hackney, unparished area           NA De Beauvoir NHS City and Hackney
    ##                 nuts admin_district admin_county admin_ward    parish
    ## 1 Hackney and Newham      E09000012    E99999999  E05009371 E43000202
    ##   parliamentary_constituency       ccg  nuts
    ## 1                  E14000721 E38000035 UKI41

#### Places

You can also generate a random place, specified by an OSGB code, with corresponding geographic information:

``` r
random_place()
```

    ##                   code name_1 name_1_lang name_2 name_2_lang local_type
    ## 1 osgb4000000074541561    Voe        NULL   NULL        NULL    Village
    ##   outcode   county_unitary county_unitary_type district_borough
    ## 1     ZE2 Shetland Islands    UnitaryAuthority             NULL
    ##   district_borough_type   region  country longitude latitude eastings
    ## 1                  NULL Scotland Scotland -1.266932 60.35012   440557
    ##   northings min_eastings min_northings max_eastings max_northings
    ## 1   1163125       439795       1162084       441178       1164979

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
str(near_pc$result[1])
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
str(near_outcode$result[2])
```

    ## List of 1
    ##  $ :List of 11
    ##   ..$ outcode       : chr "EC2Y"
    ##   ..$ longitude     : num -0.094
    ##   ..$ latitude      : num 51.5
    ##   ..$ northings     : int 181793
    ##   ..$ eastings      : int 532337
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
    ##   ..$ distance      : num 396

### Find places

Provide a name of a place of interest. You can specify the number of results (default is 10):

``` r
place_query_result <- place_query("Hills", limit = 11)

# overview
str(place_query_result$result[1])
```

    ## List of 1
    ##  $ :List of 21
    ##   ..$ code                 : chr "osgb4000000074557270"
    ##   ..$ name_1               : chr "Hillside"
    ##   ..$ name_1_lang          : NULL
    ##   ..$ name_2               : NULL
    ##   ..$ name_2_lang          : NULL
    ##   ..$ local_type           : chr "Village"
    ##   ..$ outcode              : chr "DD10"
    ##   ..$ county_unitary       : chr "Angus"
    ##   ..$ county_unitary_type  : chr "UnitaryAuthority"
    ##   ..$ district_borough     : NULL
    ##   ..$ district_borough_type: NULL
    ##   ..$ region               : chr "Scotland"
    ##   ..$ country              : chr "Scotland"
    ##   ..$ longitude            : num -2.48
    ##   ..$ latitude             : num 56.7
    ##   ..$ eastings             : int 370951
    ##   ..$ northings            : int 761060
    ##   ..$ min_eastings         : int 368761
    ##   ..$ min_northings        : int 760516
    ##   ..$ max_eastings         : int 371950
    ##   ..$ max_northings        : int 762123

You can also find a place using an OSGB code:

``` r
place_lookup_result <- place_lookup("osgb4000000074544700")

# overview
str(place_lookup_result$result)
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

Notes
-----

Currently, there is a limit to the number of API calls. However, [postcodes.io](https://postcodes.io/) provides full list of geolocation data that can be used locally without limitations. The original data is sourced from [Office for National Statistics Data Portal](https://geoportal.statistics.gov.uk/geoportal/catalog/main/home.page). That [file](https://github.com/ideal-postcodes/postcodes.io/blob/master/latest) is rather large so I didn't include it in the package.

For more info see the original [documentation](https://postcodes.io/docs).

The reference manual can be accessed [here](https://github.com/erzk/PostcodesioR/blob/master/PostcodesioR.pdf). Go to my [blog](https://walczak.org/tag/postcodesior/) for more examples.
